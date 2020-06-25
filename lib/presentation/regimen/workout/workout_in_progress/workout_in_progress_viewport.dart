import 'package:better_c25k/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'bloc/workout_in_progress_bloc.dart';

abstract class WorkoutInProgressViewport extends StatelessWidget {
  final WorkoutInProgressStateDTO _state;
  String get _currentCountdownTime =>
      TimeDisplay.timeRemaining(_state.currentCountdownTime);
  String get _exerciseMessage => _state.exerciseActionMessage;

  const WorkoutInProgressViewport(this._state);
  Widget buildViewport({
    @required Null Function() onPressedHandler,
    @required IconData buttonIcon,
  }) =>
      SafeArea(
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    _currentCountdownTime,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: AutoSizeText(
                    _exerciseMessage,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: RawMaterialButton(
                    onPressed: onPressedHandler,
                    shape: const CircleBorder(),
                    child: Icon(
                      buttonIcon,
                      size: 100,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
