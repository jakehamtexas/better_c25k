import 'package:better_c25k/workout_in_progress/bloc/workout_in_progress_bloc.dart';
import 'package:flutter/material.dart';

class PausedWorkout extends StatelessWidget {
  final PauseToggledOnState _state;
  String get _exerciseActionMessage => _state.exerciseActionMessage;
  int get _currentCountdownTime => _state.currentCountdownTime;

  PausedWorkout(this._state);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            // no-op
          },
          child: Text("Resume"),
        ),
        Text("Time Remaining: $_currentCountdownTime"),
        Text(_exerciseActionMessage)
      ],
    );
  }
}
