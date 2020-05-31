import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/router/routes.dart';
import '../../../../domain/entities/exercise/exercise.dart';
import '../../../../domain/entities/workout_in_progress/workout_in_progress.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_initial_viewport.dart';
import 'workout_in_progress_paused_viewport.dart';
import 'workout_in_progress_unpaused_viewport.dart';

class WorkoutInProgressPage extends StatelessWidget {
  final WorkoutInProgressEntity _entity;

  String get _workoutTitle => _entity.workoutTitle;
  List<ExerciseEntity> get _exercises => _entity.exercises;

  WorkoutInProgressPage(this._entity);

  Widget bodyBuilder(WorkoutInProgressState state) {
    if (state is WorkoutInProgressInitialState) {
      return WorkoutInProgressInitialViewport(_exercises);
    }
    if (state is PauseToggledOnState) {
      return WorkoutInProgressPausedViewport(state);
    }
    if (state is IsStartedState || state is PauseToggledOffState) {
      return WorkoutInProgressUnpausedViewport(state);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutInProgressBloc>(
      builder: (_) => WorkoutInProgressBloc(),
      child: BlocBuilder<WorkoutInProgressBloc, WorkoutInProgressState>(
        builder: (context, state) {
          if (state is WorkoutCompletedState) {
            Navigator.of(context).pushReplacementNamed(
              Routes.workoutComplete,
              arguments: "",
            );
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(_workoutTitle),
            ),
            body: bodyBuilder(
              state,
            ),
          );
        },
      ),
    );
  }
}
