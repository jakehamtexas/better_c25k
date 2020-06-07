import 'package:flutter/material.dart';

import 'title_button_bar_factory.dart';
import 'workout_card_base.dart';

class CollapsedWorkoutCard extends WorkoutCardBase {
  CollapsedWorkoutCard({
    @required int workoutId,
    @required String workoutDescription,
    @required String workoutTitle,
  }) : super(
          workoutId: workoutId,
          workoutTitle: workoutTitle,
          workoutDescription: workoutDescription,
        );
  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget = super.getWorkoutTitleWidget(workoutTitle);
    //TODO: Fix broken animated container transition
    return Container(
      height: 72,
      child: super.getCard(
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                workoutTitleWidget,
                TileButtonBarFactory()(
                  workoutTitle: workoutTitle,
                  context: context,
                  workoutId: workoutId,
                  expandCollapseText: "Expand",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
