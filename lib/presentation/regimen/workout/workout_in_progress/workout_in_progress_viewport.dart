import 'package:flutter/material.dart';

import 'bloc/workout_in_progress_bloc.dart';

abstract class WorkoutInProgressViewport extends StatelessWidget {
  final WorkoutInProgressStateDTO _state;
  int get _currentCountdownTime => _state.currentCountdownTime;
  String get _exerciseMessage => _state.exerciseActionMessage;

  WorkoutInProgressViewport(this._state);
  Widget buildViewport({
    @required Null Function() onPressedHandler,
    @required String buttonMessage,
  }) =>
      Column(
        children: <Widget>[
          RaisedButton(
            onPressed: onPressedHandler,
            child: Text(buttonMessage),
          ),
          Text("Time Remaining: $_currentCountdownTime"),
          Text(_exerciseMessage),
        ],
      );
}
