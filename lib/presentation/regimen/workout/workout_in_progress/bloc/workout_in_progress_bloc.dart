import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../constant/exercise_action.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/extension/dartz/dartz.dart';
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

  int _currentCountdownTime = 0;
  Stopwatch _stopwatch;

  ContinuouslyInsertLocation _continuouslyInsertLocationUseCase;

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
      yield* _incrementExercise();
    } else if (event is WorkoutCompletedEvent) {
      yield WorkoutCompletedState();
    }
  }

  Stream<WorkoutInProgressState> _incrementExercise() async* {
    _exerciseIndex++;
    _currentCountdownTime = _currentExercise.durationInSeconds;

    yield PauseToggledOffState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
    );
  }

  Stream<WorkoutInProgressState> _decrementRemainingTime() async* {
    _currentCountdownTime--;
    await _continuouslyInsertLocationUseCase(_workoutId);
    yield PauseToggledOffState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
    );
  }

  Stream<WorkoutInProgressState> _pause() async* {
    _stopwatch.stop();
    await _continuouslyInsertLocationUseCase.pause();

    yield PauseToggledOnState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
    );
  }

  Stream<WorkoutInProgressState> _unpause() async* {
    _stopwatch.start();
    await _continuouslyInsertLocationUseCase.resume(_workoutId);

    yield PauseToggledOffState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
    );
  }

  Stream<WorkoutInProgressState> _start() async* {
    _currentCountdownTime = _exercises[0].durationInSeconds;

    _startTimer();

    yield IsStartedState(
      currentCountdownTime: _currentCountdownTime,
      exerciseActionMessage: _exerciseActionMessage,
    );
  }

  Stream<WorkoutInProgressState> _initialize(
      WorkoutInProgressInitializedEvent event) async* {
    final exercisesOrFailure = await event.usecase(event.workoutId);
    if (exercisesOrFailure.isRight()) {
      _exercises = exercisesOrFailure.getOrThrow();
    }

    yield exercisesOrFailure.fold(
      (failure) => ExercisesRetrievalFailureState(failure),
      (exercises) => ExercisesRetrievalSuccessState(exercises.first),
    );
  }

  void _startTimer() {
    _stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentCountdownTime <= 0) {
        add(IncrementExerciseEvent());
        timer.cancel();
        if (_exerciseIndex != _exercises.length) {
          _startTimer();
        } else {
          add(WorkoutCompletedEvent());
        }
      } else if (_stopwatch.isRunning) {
        add(DecrementRemainingTimeEvent());
      }
    });
  }

  @override
  @mustCallSuper
  Future<void> close() async {
    await _continuouslyInsertLocationUseCase.cancel();
    super.close();
  }
}
