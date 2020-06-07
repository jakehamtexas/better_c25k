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
    return Container(
      height: 200,
      child: super.getCard(
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: super.paddingAmount,
                      ),
                      child: workoutTitleWidget,
                    ),
                    Text(
                      workoutDescription,
                      textAlign: TextAlign.left,
                      softWrap: true,
                    ),
                  ],
                ),
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
      ),
    );
  }
}
