import 'package:flutter/material.dart';

import 'workout_model.dart';

class WorkoutWidget extends StatelessWidget {
  final WorkoutModel workout;
  WorkoutWidget(this.workout);
  String get workoutTitle {
    final weekNumber = workout.ordinalWeekNumber;
    final week = "Week $weekNumber";

    final dayNumber = workout.ordinalDayOfWeekNumber;
    final day = "Day $dayNumber";
    return "$week $day";
  }

  void view() {}
  void start() {}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonBar(
              alignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(workoutTitle),
                RaisedButton(
                  child: Text("View"),
                  onPressed: view,
                ),
                RaisedButton(
                  child: Text("Start"),
                  onPressed: start,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
