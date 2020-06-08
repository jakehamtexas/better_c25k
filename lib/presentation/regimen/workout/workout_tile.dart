import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout/workout.dart';
import 'bloc/workout_bloc.dart';
import 'collapsed_workout_card.dart';
import 'expanded_workout_card.dart';
import 'workout_card_base.dart';

class WorkoutTile extends StatelessWidget {
  final WorkoutPresentationEntity _workout;
  String get _workoutDescription => _workout.description;
  String get _workoutTitle {
    final weekNumber = _workout.ordinalWeekNumber;
    final week = "Week $weekNumber";

    final dayNumber = _workout.ordinalDayOfWeekNumber;
    final day = "Day $dayNumber";
    return "$week $day";
  }

  WorkoutTile(this._workout);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutBloc>(
      create: (_) => WorkoutBloc(),
      child: Center(
        child: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (BuildContext context, state) {
            if (state is WorkoutExpandToggledOnState) {
              return ExpandedWorkoutCard(
                workoutId: _workout.workoutId,
                workoutDescription: _workoutDescription,
                workoutTitle: _workoutTitle,
              );
            }

            if (state is WorkoutExpandToggledOffState) {
              return CollapsedWorkoutCard(
                workoutId: _workout.workoutId,
                workoutDescription: _workoutDescription,
                workoutTitle: _workoutTitle,
              );
            }
          },
        ),
      ),
    );
  }
}
