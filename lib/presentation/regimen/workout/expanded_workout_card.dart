import 'package:flutter/material.dart';

import 'workout_card_base.dart';

class ExpandedWorkoutCard extends WorkoutCardBase {
  ExpandedWorkoutCard({
    @required startFunc,
    @required workoutTitle,
    @required workoutDescription,
  }) : super(
          startFunc: startFunc,
          workoutDescription: workoutDescription,
          workoutTitle: workoutTitle,
        );

  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget =
        WorkoutCardBase.getWorkoutTitleWidget(workoutTitle);
    final workoutDescriptionWidget = Text(workoutDescription);
    final toggleExpand = WorkoutCardBase.getToggleExpand(context);
    final expandedButtonBar = ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Collapse"),
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
        child: Wrap(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: WorkoutCardBase.paddingAmount,
                  ),
                  child: workoutTitleWidget,
                ),
                workoutDescriptionWidget,
              ],
            ),
            expandedButtonBar,
          ],
        ),
      ),
    );
  }
}
