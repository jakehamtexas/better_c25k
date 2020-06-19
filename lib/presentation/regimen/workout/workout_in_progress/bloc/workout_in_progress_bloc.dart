import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../constant/exercise_action.dart';
import '../../../../../core/error/error.dart';
import '../../../../../core/extension/dartz/dartz.dart';
import '../../../../../domain/entities/exercise/exercise.dart';
import '../../../../../domain/usecases/get_exercises.dart';

part 'workout_in_progress_event.dart';
part 'workout_in_progress_state.dart';

class WorkoutInProgressBloc
    extends Bloc<WorkoutInProgressEvent, WorkoutInProgressState> {
  @override
  WorkoutInProgressState get initialState => WorkoutInProgressInitialState();

  List<ExerciseEntity> _exercises;

  int _exerciseIndex = 0;

  ExerciseEntity get _currentExercise => _exercises[_exerciseIndex];
  String get _exerciseActionMessage => _currentExercise.exerciseAction.message;

  int _currentCountdownTime = 0;
  Stopwatch _stopwatch;

  @override
  Stream<WorkoutInProgressState> mapEventToState(
    WorkoutInProgressEvent event,
  ) async* {
    if (event is WorkoutInProgressInitializedEvent) {
      final exercisesOrFailure = await event.usecase(event.workoutId);
      if (exercisesOrFailure.isRight()) {
        _exercises = exercisesOrFailure.getOrThrow();
      }
      yield exercisesOrFailure.fold(
        (failure) => ExercisesRetrievalFailureState(failure),
        (exercises) => ExercisesRetrievalSuccessState(exercises.first),
      );
    } else if (event is StartEvent) {
      _currentCountdownTime = _exercises[0].durationInSeconds;

      startTimer();

      yield IsStartedState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
      );
    } else if (event is UnpauseEvent) {
      _stopwatch.start();

      yield PauseToggledOffState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
      );
    } else if (event is PauseEvent) {
      _stopwatch.stop();

      yield PauseToggledOnState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
      );
    } else if (event is DecrementRemainingTimeEvent) {
      _currentCountdownTime--;

      yield PauseToggledOffState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
      );
    } else if (event is IncrementExerciseEvent) {
      _exerciseIndex++;
      _currentCountdownTime = _currentExercise.durationInSeconds;

      yield PauseToggledOffState(
        currentCountdownTime: _currentCountdownTime,
        exerciseActionMessage: _exerciseActionMessage,
      );
    } else if (event is WorkoutCompletedEvent) {
      yield WorkoutCompletedState();
    }
  }

  void startTimer() {
    _stopwatch = Stopwatch()..start();
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentCountdownTime <= 0) {
        add(IncrementExerciseEvent());
        timer.cancel();
        if (_exerciseIndex != _exercises.length) {
          startTimer();
        } else {
          add(WorkoutCompletedEvent());
        }
      } else if (_stopwatch.isRunning) {
        add(DecrementRemainingTimeEvent());
      }
    });
  }
}
