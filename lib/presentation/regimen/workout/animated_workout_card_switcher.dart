import 'workout_card_base.dart';
import 'package:flutter/material.dart';

class AnimatedWorkoutCardSwitcher extends StatelessWidget {
  final _duration = Duration(milliseconds: 175);
  final WorkoutCardBase workoutCard;

  AnimatedWorkoutCardSwitcher(this.workoutCard);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: _duration,
      reverseDuration: Duration(microseconds: 1),
      child: workoutCard,
      key: workoutCard.key,
      switchInCurve: Curves.linear,
      switchOutCurve: Curves.linear,
      transitionBuilder: (widget, animation) {
        var tween = Tween(begin: Offset(0.0, 1.0), end: Offset.zero);
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: widget,
        );
      },
    );
  }
}
