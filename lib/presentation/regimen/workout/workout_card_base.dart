import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_bloc.dart';

abstract class WorkoutCardBase extends StatelessWidget {
  final Function startFunc;
  final String workoutTitle;
  final String workoutDescription;

  WorkoutCardBase({
    @required this.startFunc,
    @required this.workoutTitle,
    @required this.workoutDescription,
  });

  static const double paddingAmount = 10;
  static Function getToggleExpand(BuildContext context) => () {
        BlocProvider.of<WorkoutBloc>(context).add(WorkoutExpandToggledEvent());
      };

  static Widget getWorkoutTitleWidget(String workoutTitle) => Text(
        workoutTitle,
        style: TextStyle(fontWeight: FontWeight.bold),
      );
}
