import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/workout_in_progress_viewport.dart';
import '../../../../domain/usecases/usecases.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'go_back_to_workouts_button.dart';

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
    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GoBackToWorkoutsButton(
                  buildContext: context,
                  event: const GoBackToWorkoutsEvent(),
                ),
                Center(
                  child: AutoSizeText(
                    _currentCountdownTime,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                ),
              ],
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
    );
  }

  List<RawMaterialButton> _getActionButtons(
    IconData buttonIcon,
    Null Function() onPressedHandler,
    BuildContext context,
    bool shouldPause,
  ) {
    final bloc = BlocProvider.of<WorkoutInProgressBloc>(context);

    final invisibleButton = RawMaterialButton(
      onPressed: () {},
      splashColor: WorkoutInProgressButton.splashColor,
      highlightColor: WorkoutInProgressButton.highlighColor,
      child: Icon(
        Icons.block,
        size: WorkoutInProgressButton.buttonSize,
        color: Colors.transparent,
      ),
    );
    final previousButton = _hasPreviousExercise
        ? RawMaterialButton(
            onPressed: () {
              bloc.add(const DecrementExerciseEvent(shouldPause: true));
            },
            shape: WorkoutInProgressButton.buttonShape,
            splashColor: WorkoutInProgressButton.splashColor,
            highlightColor: WorkoutInProgressButton.highlighColor,
            child: Icon(
              Icons.skip_previous,
              size: WorkoutInProgressButton.buttonSize,
            ),
          )
        : invisibleButton;
    final nextButton = _hasNextExercise
        ? RawMaterialButton(
            onPressed: () {
              bloc.add(const IncrementExerciseEvent(shouldPause: true));
            },
            shape: WorkoutInProgressButton.buttonShape,
            splashColor: WorkoutInProgressButton.splashColor,
            highlightColor: WorkoutInProgressButton.highlighColor,
            child: Icon(
              Icons.skip_next,
              size: WorkoutInProgressButton.buttonSize,
            ),
          )
        : invisibleButton;
    final startStopButton = RawMaterialButton(
      onPressed: onPressedHandler,
      shape: WorkoutInProgressButton.buttonShape,
      splashColor: WorkoutInProgressButton.splashColor,
      highlightColor: WorkoutInProgressButton.highlighColor,
      child: Icon(
        buttonIcon,
        size: WorkoutInProgressButton.buttonSize,
      ),
    );

    return [previousButton, startStopButton, nextButton].toList();
  }
}
