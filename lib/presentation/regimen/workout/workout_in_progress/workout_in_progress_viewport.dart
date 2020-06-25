import 'package:better_c25k/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';

import 'bloc/workout_in_progress_bloc.dart';

abstract class WorkoutInProgressViewport extends StatelessWidget {
  final WorkoutInProgressStateDTO _state;
  String get _currentCountdownTime =>
      TimeDisplay.timeRemaining(_state.currentCountdownTime);
  String get _exerciseMessage => _state.exerciseActionMessage;

  const WorkoutInProgressViewport(this._state);
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
          Text(_currentCountdownTime),
          Text(_exerciseMessage),
        ],
      );
}
