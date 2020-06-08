import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_bloc.dart';
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
    return GestureDetector(
      onTap: () => BlocProvider.of<WorkoutBloc>(context)
          .add(WorkoutExpandToggledEvent()),
      child: Container(
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            workoutTitleWidget,
                            Icon(
                              Icons.arrow_drop_up,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                      Text(
                        workoutDescription,
                        textAlign: TextAlign.left,
                        softWrap: true,
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      child: Text("Start"),
                      onPressed: () =>
                          BlocProvider.of<WorkoutBloc>(context).add(
                        WorkoutStartedEvent(
                          workoutId: workoutId,
                          context: context,
                          workoutTitle: workoutTitle,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
