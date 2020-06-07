import 'workout_card_base.dart';
import 'package:flutter/material.dart';

class AnimatedWorkoutCardSwitcher extends StatelessWidget {
  final _duration = Duration(milliseconds: 300);
  final WorkoutCardBase workoutCard;

  AnimatedWorkoutCardSwitcher(this.workoutCard);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _duration,
      child: workoutCard,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SizeTransition(
          axis: Axis.vertical,
          sizeFactor: animation,
          child: child,
        );
      },
      key: workoutCard.key,
    );
  }
}
