import 'package:flutter/material.dart';

import 'collapsed_workout_card.dart';
import 'workout_card_base.dart';

class WorkoutCardAnimation extends StatelessWidget {
  final WorkoutCardBase child;
  static const duration = Duration(milliseconds: 300);

  bool get isCollapsed => child is CollapsedWorkoutCard;

  WorkoutCardAnimation(this.child) : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      child: child,
      duration: duration,
      transitionBuilder: (widget, animation) {
        final sizeTween = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(
              .5,
              1,
              curve: Curves.linearToEaseOut,
            ),
          ),
        );
        return SizeTransition(
          sizeFactor: sizeTween,
          child: widget,
        );
      },
    );
  }
}
