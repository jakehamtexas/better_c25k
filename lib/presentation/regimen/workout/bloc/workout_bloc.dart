import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/workout_in_progress/workout_in_progress.dart';
import '../../../router/routes.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  @override
  WorkoutState get initialState => WorkoutExpandToggledOffState();

  bool _isExpanded = false;
  @override
  Stream<WorkoutState> mapEventToState(
    WorkoutEvent event,
  ) async* {
    if (event is WorkoutExpandToggledEvent) {
      yield _isExpanded
          ? WorkoutExpandToggledOffState()
          : WorkoutExpandToggledOnState();
      _isExpanded = !_isExpanded;
    }
    if (event is WorkoutStartedEvent) {
      Navigator.of(event.context).pushNamed(
        Routes.doWorkout,
        arguments: WorkoutInProgressEntity(
          workoutId: event.workoutId,
          workoutTitle: event.workoutTitle,
        ),
      );
    }
  }
}
