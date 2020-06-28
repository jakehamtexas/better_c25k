import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:soundpool/soundpool.dart';

import '../../../../../constant/completion_status.dart';
import '../../../../../constant/exercise_action.dart';
import '../../../../../core/bloc/bloc.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/extension/dartz/dartz.dart';
import '../../../../../domain/entities/common/common.dart';
import '../../../../../domain/entities/exercise/exercise.dart';
import '../../../../../domain/usecases/usecases.dart';

part 'workout_in_progress_event.dart';
part 'workout_in_progress_state.dart';

class WorkoutInProgressBloc
    extends Bloc<WorkoutInProgressEvent, WorkoutInProgressState> {
  WorkoutInProgressBloc(this._workoutId) {
    _continuouslyInsertLocationUseCase = GetIt.I<ContinuouslyInsertLocation>();
  }

  @override
  WorkoutInProgressState get initialState => WorkoutInProgressInitialState();

  final int _workoutId;

  List<ExerciseEntity> _exercises;

  int _exerciseIndex = 0;

  ExerciseEntity get _currentExercise => _exercises[_exerciseIndex];
  String get _exerciseActionMessage => _currentExercise.exerciseAction.message;
  bool get _hasPreviousExercise =>
      _exercises.asMap().containsKey(_exerciseIndex - 1);
  bool get _hasNextExercise =>
      _exercises.asMap().containsKey(_exerciseIndex + 1);

  int _currentCountdownTime = 0;
  Stopwatch _stopwatch;

  ContinuouslyInsertLocation _continuouslyInsertLocationUseCase;

  PauseToggledOffState get _pauseToggledOffState => PauseToggledOffState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
        hasPreviousExercise: _hasPreviousExercise,
        hasNextExercise: _hasNextExercise,
      );
  PauseToggledOnState get _pauseToggledOnState => PauseToggledOnState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
        hasPreviousExercise: _hasPreviousExercise,
        hasNextExercise: _hasNextExercise,
      );

  Future<int> _dingSoundId;

  @override
  Stream<WorkoutInProgressState> mapEventToState(
    WorkoutInProgressEvent event,
  ) async* {
    if (event is WorkoutInProgressInitializedEvent) {
      yield* _initialize(event);
    } else if (event is StartEvent) {
      yield* _start();
    } else if (event is UnpauseEvent) {
      yield* _unpause();
    } else if (event is PauseEvent) {
      yield* _pause();
    } else if (event is DecrementRemainingTimeEvent) {
      yield* _decrementRemainingTime();
    } else if (event is IncrementExerciseEvent) {
      yield* _incrementExercise(event.shouldPause);
    } else if (event is DecrementExerciseEvent) {
      yield* _decrementExercise(event.shouldPause);
    } else if (event is WorkoutCompletedEvent) {
      yield* _workoutCompleted();
    } else if (event is GoBackToWorkoutsEvent) {
      yield* _goBackToWorkouts();
    }
  }

  Stream<WorkoutInProgressState> _goBackToWorkouts() async* {
    final regimenNameAndId = await _getRegimenNameAndId();
    yield GoBackToWorkoutsState(regimenNameAndId);
  }

  Stream<WorkoutInProgressState> _workoutCompleted() async* {
    await _updateWorkoutStatus(CompletionStatus.completed);
    final regimenNameAndId = await _getRegimenNameAndId();
    GetIt.I<Soundpool>().play(await _dingSoundId);
    yield WorkoutCompletedState(
      regimenNameAndId: regimenNameAndId,
      workoutId: _workoutId,
    );
  }

  Stream<WorkoutInProgressState> _decrementExercise(bool shouldPause) async* {
    _exerciseIndex--;
    _currentCountdownTime = _currentExercise.durationInSeconds;

    if (shouldPause) {
      _stopwatch?.stop();
    }

    yield shouldPause ? _pauseToggledOnState : _pauseToggledOffState;
  }

  Stream<WorkoutInProgressState> _incrementExercise(bool shouldPause) async* {
    _exerciseIndex++;
    _currentCountdownTime = _currentExercise.durationInSeconds;
    if (shouldPause) {
      _stopwatch?.stop();
    } else {
      GetIt.I<Soundpool>().play(await _dingSoundId);
    }

    yield shouldPause ? _pauseToggledOnState : _pauseToggledOffState;
  }

  Stream<WorkoutInProgressState> _decrementRemainingTime() async* {
    _currentCountdownTime--;
    await _continuouslyInsertLocationUseCase(_workoutId);
    yield _pauseToggledOffState;
  }

  Stream<WorkoutInProgressState> _pause() async* {
    _stopwatch.stop();
    await _continuouslyInsertLocationUseCase.pause();

    yield _pauseToggledOnState;
  }

  Stream<WorkoutInProgressState> _unpause() async* {
    if (_stopwatch == null) {
      _startTimer();
    } else {
      _stopwatch.start();
    }
    await _continuouslyInsertLocationUseCase.resume(_workoutId);

    yield _pauseToggledOffState;
  }

  Stream<WorkoutInProgressState> _start() async* {
    _currentCountdownTime = _exercises[0].durationInSeconds;

    await _updateWorkoutStatus(CompletionStatus.inProgress);
    _startTimer();

    yield IsStartedState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
      hasNextExercise: _hasNextExercise,
    );
  }

  Stream<WorkoutInProgressState> _initialize(
    WorkoutInProgressInitializedEvent event,
  ) async* {
    final exercisesOrFailure = await event.usecase(event.workoutId);
    if (exercisesOrFailure.isRight()) {
      _exercises = exercisesOrFailure.getOrThrow();
    }
    final soundPath = await rootBundle.load("assets/android/sound/ding.wav");
    _dingSoundId = GetIt.I<Soundpool>().load(soundPath);

    yield exercisesOrFailure.fold(
      (failure) => ExercisesRetrievalFailureState(failure),
      (exercises) => ExercisesRetrievalSuccessState(
        firstExercise: exercises.first,
        hasNextExercise: _hasNextExercise,
      ),
    );
  }

  void _startTimer() {
    _stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentCountdownTime <= 0) {
        final isLastExercise = _exerciseIndex == _exercises.length - 1;
        if (isLastExercise) {
          add(WorkoutCompletedEvent());
        } else {
          add(const IncrementExerciseEvent(shouldPause: false));
          timer.cancel();
          _startTimer();
        }
      } else if (_stopwatch.isRunning) {
        add(DecrementRemainingTimeEvent());
      }
    });
  }

  Future _updateWorkoutStatus(CompletionStatus completionStatus) async {
    final usecase = GetIt.I<UpdateCompletionStatusForWorkout>();
    await usecase(_workoutId, completionStatus);
  }

  Future<NameAndId<int>> _getRegimenNameAndId() async {
    final regimenNameAndIdOrFailure =
        await GetIt.I<GetRegimenNameAndIdForWorkoutId>()(_workoutId);
    if (regimenNameAndIdOrFailure.isLeft()) {
      /// TODO: Handle failure to retrieve case
      throw UnimplementedError();
    }
    return regimenNameAndIdOrFailure.getOrThrow();
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    await _continuouslyInsertLocationUseCase.cancel();
    super.close();
  }
}
