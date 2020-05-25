import 'package:better_c25k/workout_in_progress/bloc/workout_in_progress_bloc.dart';
import 'package:better_c25k/workout_in_progress/paused_workout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../exercise/exercise.dart';
import 'workout_in_progress_configuration.dart';
import 'workout_in_progress_widget.dart';

class WorkoutInProgressPage extends StatelessWidget {
  final WorkoutInProgressConfiguration _configuration;

  String get _workoutTitle => _configuration.workoutTitle;
  List<ExerciseModel> get _exercises => _configuration.exercises;

  WorkoutInProgressPage(this._configuration);

  Widget bodyBuilder(WorkoutInProgressState state) {
    if (state is WorkoutInProgressInitial) {
      return WorkoutInProgressWidget(_exercises);
    }
    if (state is PauseToggledOnState) {
      return PausedWorkout(state);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutInProgressBloc>(
      builder: (_) => WorkoutInProgressBloc(),
      child: BlocBuilder<WorkoutInProgressBloc, WorkoutInProgressState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(_workoutTitle),
            ),
            body: bodyBuilder(state),
          );
        },
      ),
    );
  }
}
