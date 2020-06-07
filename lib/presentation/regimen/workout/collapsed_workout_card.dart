import 'package:flutter/material.dart';

import 'workout_card_base.dart';

class CollapsedWorkoutCard extends WorkoutCardBase {
  CollapsedWorkoutCard({
    @required startFunc,
    @required workoutDescription,
    @required workoutTitle,
  }) : super(
          startFunc: startFunc,
          workoutTitle: workoutTitle,
          workoutDescription: workoutDescription,
        );
  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget =
        WorkoutCardBase.getWorkoutTitleWidget(workoutTitle);
    final toggleExpand = WorkoutCardBase.getToggleExpand(context);
    final collapsedButtonBar = ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Expand"),
          onPressed: toggleExpand,
        ),
        RaisedButton(
          child: Text("Start"),
          onPressed: startFunc,
        )
      ],
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: WorkoutCardBase.paddingAmount,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                workoutTitleWidget,
                collapsedButtonBar,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
