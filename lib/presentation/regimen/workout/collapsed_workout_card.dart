import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_bloc.dart';
import 'workout_card_base.dart';

class CollapsedWorkoutCard extends WorkoutCardBase {
  const CollapsedWorkoutCard({
    @required int workoutId,
    @required String workoutDescription,
    @required String workoutTitle,
    @required Icon icon,
  }) : super(
          workoutId: workoutId,
          workoutTitle: workoutTitle,
          workoutDescription: workoutDescription,
          icon: icon,
        );
  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget = super.getWorkoutTitleWidget(workoutTitle);
    final child = super.getCard(
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          workoutTitleWidget,
          icon,
        ],
      ),
    );
    return GestureDetector(
      onTap: () => BlocProvider.of<WorkoutBloc>(context)
          .add(WorkoutExpandToggledEvent()),
      child: Container(
        height: 72,
        child: child,
      ),
    );
  }
}
