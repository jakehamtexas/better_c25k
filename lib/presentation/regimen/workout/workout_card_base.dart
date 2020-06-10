import 'package:flutter/material.dart';

abstract class WorkoutCardBase extends StatelessWidget {
  final int workoutId;
  final String workoutTitle;
  final String workoutDescription;

  WorkoutCardBase({
    @required this.workoutId,
    @required this.workoutTitle,
    @required this.workoutDescription,
  });

  final double paddingAmount = 10;
  Widget getWorkoutTitleWidget(String workoutTitle) => Text(
        workoutTitle,
        style: TextStyle(fontWeight: FontWeight.bold),
      );
  Card getCard(Widget child) => Card(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: paddingAmount,
          ),
          child: child,
        ),
      );
}