import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_widget.dart';

class WorkoutInProgressUnpausedViewport extends WorkoutInProgressViewport {
  final WorkoutInProgressStateDTO _state;

  String get _buttonMessage {
    if (_state is PauseToggledOffState) {
      return (_state as PauseToggledOffState).buttonMessage;
    }
    return "Start";
  }

  int get _currentCountdownTime => _state.currentCountdownTime;
  String get _exerciseMessage => _state.exerciseActionMessage;
  WorkoutInProgressUnpausedViewport(this._state);
  @override
  Widget build(BuildContext context) => super.buildViewport(
        onPressedHandler: () {
          BlocProvider.of<WorkoutInProgressBloc>(context).add(PauseEvent(
            exerciseActionMessage: _exerciseMessage,
          ));
        },
        buttonMessage: _buttonMessage,
        currentCountdownTime: _currentCountdownTime,
        exerciseMessage: _exerciseMessage,
      );
}
