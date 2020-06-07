import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/workout/workout.dart';
import '../../../domain/entities/workout_in_progress/workout_in_progress.dart';
import '../../router/routes.dart';
import 'bloc/workout_bloc.dart';
import 'workout_card.dart';

class WorkoutTile extends StatelessWidget {
  final WorkoutEntity _workout;
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
    final start = () {
      Navigator.of(context).pushNamed(
        Routes.doWorkout,
        arguments: WorkoutInProgressEntity(
          exercises: _workout.exercises,
          workoutTitle: _workoutTitle,
        ),
      );
    };
    final duration = Duration(milliseconds: 350);
    return BlocProvider<WorkoutBloc>(
      create: (_) => WorkoutBloc(),
      child: Center(
        child: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (BuildContext context, state) {
            if (state is WorkoutExpandToggledOnState) {
              return AnimatedContainer(
                duration: duration,
                height: 155,
                child: ExpandedWorkoutCard(
                  startFunc: start,
                  workoutDescription: _workoutDescription,
                  workoutTitle: _workoutTitle,
                ),
              );
            }

            if (state is WorkoutExpandToggledOffState) {
              return AnimatedContainer(
                duration: duration,
                height: 72,
                child: CollapsedWorkoutCard(
                  startFunc: start,
                  workoutDescription: _workoutDescription,
                  workoutTitle: _workoutTitle,
                ),
              );
            }
            return null;
          },
        ),
      ),
    );
  }
}
