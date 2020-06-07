import 'package:flutter/material.dart';

import 'title_button_bar_factory.dart';
import 'workout_card_base.dart';

class ExpandedWorkoutCard extends WorkoutCardBase {
  ExpandedWorkoutCard({
    @required int workoutId,
    @required String workoutTitle,
    @required String workoutDescription,
  }) : super(
          workoutId: workoutId,
          workoutDescription: workoutDescription,
          workoutTitle: workoutTitle,
        );

  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget = super.getWorkoutTitleWidget(workoutTitle);
    return AnimatedContainer(
      duration: super.duration,
      height: 155,
      child: super.getCard(
        Wrap(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: super.paddingAmount,
                  ),
                  child: workoutTitleWidget,
                ),
                Text(workoutDescription),
              ],
            ),
            TileButtonBarFactory()(
              workoutTitle: workoutTitle,
              context: context,
              workoutId: workoutId,
              expandCollapseText: "Collapse",
            ),
          ],
        ),
      ),
    );
  }
}
