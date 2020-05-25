import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/routes.dart';
import 'bloc/workout_bloc.dart';
import 'do_workout/do_workout.dart';
import 'workout_card.dart';
import 'workout_model.dart';

class WorkoutTile extends StatelessWidget {
  final WorkoutModel _workout;
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
        arguments: DoWorkoutConfiguration(
          exercises: _workout.exercises,
          workoutTitle: _workoutTitle,
        ),
      );
    };
    final duration = Duration(milliseconds: 350);
    return BlocProvider<WorkoutBloc>(
      builder: (_) => WorkoutBloc(),
      child: Center(
        child: BlocBuilder<WorkoutBloc, WorkoutState>(
          builder: (BuildContext context, state) {
            if (state is WorkoutExpandToggledOn) {
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

            if (state is WorkoutExpandToggledOff) {
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
