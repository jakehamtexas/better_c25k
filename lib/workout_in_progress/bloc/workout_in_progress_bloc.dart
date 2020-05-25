import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'workout_in_progress_event.dart';
part 'workout_in_progress_state.dart';

class WorkoutInProgressBloc
    extends Bloc<WorkoutInProgressEvent, WorkoutInProgressState> {
  @override
  WorkoutInProgressState get initialState => WorkoutInProgressInitial();

  bool _isPaused = false;
  @override
  Stream<WorkoutInProgressState> mapEventToState(
    WorkoutInProgressEvent event,
  ) async* {
    if (event is PauseEvent) {
      _isPaused = true;
      yield PauseToggledOnState(
        currentCountdownTime: event.currentCountdownTime,
        exerciseActionMessage: event.exerciseActionMessage,
      );
    }
  }
}
