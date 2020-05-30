import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workout_in_progress_event.dart';
part 'workout_in_progress_state.dart';

class WorkoutInProgressBloc
    extends Bloc<WorkoutInProgressEvent, WorkoutInProgressState> {
  @override
  WorkoutInProgressState get initialState => WorkoutInProgressInitialState();

  bool _isStarted = false;
  @override
  Stream<WorkoutInProgressState> mapEventToState(
    WorkoutInProgressEvent event,
  ) async* {
    if (event is StartEvent && !_isStarted) {
      _isStarted = true;
      yield IsStartedState(
        currentCountdownTime: event.currentCountdownTime,
        exerciseActionMessage: event.exerciseActionMessage,
      );
    } else if (event is UnpauseEvent) {
      yield PauseToggledOffState(
        currentCountdownTime: event.currentCountdownTime,
        exerciseActionMessage: event.exerciseActionMessage,
      );
    } else if (event is PauseEvent) {
      yield PauseToggledOnState(
        currentCountdownTime: event.currentCountdownTime,
        exerciseActionMessage: event.exerciseActionMessage,
      );
    }
  }
}
