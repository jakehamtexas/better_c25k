import 'package:better_c25k/workout_in_progress/bloc/workout_in_progress_bloc.dart';
import 'package:better_c25k/workout_in_progress/workout_in_progress_widget.dart';
import 'package:flutter/material.dart';

class PausedWorkout extends WorkoutInProgressViewport {
  final PauseToggledOnState _state;
  String get _exerciseActionMessage => _state.exerciseActionMessage;
  int get _currentCountdownTime => _state.currentCountdownTime;

  PausedWorkout(this._state);

  @override
  Widget build(BuildContext context) => super.buildViewport(
        onPressedHandler: () {
          // no-op
        },
        buttonMessage: "Resume",
        currentCountdownTime: _currentCountdownTime,
        exerciseMessage: _exerciseActionMessage,
      );
}
