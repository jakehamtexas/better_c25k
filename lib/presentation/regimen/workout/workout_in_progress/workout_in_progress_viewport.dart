import 'package:better_c25k/domain/usecases/usecases.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_in_progress_bloc.dart';

abstract class WorkoutInProgressViewport extends StatelessWidget {
  final WorkoutInProgressStateDTO _state;
  String get _currentCountdownTime =>
      TimeDisplay.timeRemaining(_state.currentCountdownTime);
  String get _exerciseMessage => _state.exerciseActionMessage;

  bool get _hasPreviousExercise => _state.hasPreviousExercise;
  bool get _hasNextExercise => _state.hasNextExercise;

  const WorkoutInProgressViewport(this._state);
  Widget buildViewport(
      {@required Null Function() onPressedHandler,
      @required IconData buttonIcon,
      @required BuildContext context,
      @required bool shouldPause}) {
    final actionButtons =
        _getActionButtons(buttonIcon, onPressedHandler, context, shouldPause);
    return SafeArea(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: actionButtons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<RawMaterialButton> _getActionButtons(
    IconData buttonIcon,
    Null Function() onPressedHandler,
    BuildContext context,
    bool shouldPause,
  ) {
    final bloc = BlocProvider.of<WorkoutInProgressBloc>(context);
    const buttonShape = CircleBorder();
    const buttonSize = 100.0;

    final invisibleButton = RawMaterialButton(
      onPressed: () {},
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        Icons.block,
        size: buttonSize,
        color: Colors.transparent,
      ),
    );
    final previousButton = _hasPreviousExercise
        ? RawMaterialButton(
            onPressed: () {
              bloc.add(const DecrementExerciseEvent(shouldPause: true));
            },
            shape: buttonShape,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(
              Icons.skip_previous,
              size: buttonSize,
            ),
          )
        : invisibleButton;
    final nextButton = _hasNextExercise
        ? RawMaterialButton(
            onPressed: () {
              bloc.add(const IncrementExerciseEvent(shouldPause: true));
            },
            shape: buttonShape,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(
              Icons.skip_next,
              size: buttonSize,
            ),
          )
        : invisibleButton;
    final startStopButton = RawMaterialButton(
      onPressed: onPressedHandler,
      shape: buttonShape,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Icon(
        buttonIcon,
        size: buttonSize,
      ),
    );

    return [previousButton, startStopButton, nextButton].toList();
  }
}
