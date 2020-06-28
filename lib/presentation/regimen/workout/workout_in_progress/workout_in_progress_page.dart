import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/datasources/datasources.dart';
import '../../../../domain/entities/workout_in_progress/workout_in_progress.dart';
import '../../../../domain/usecases/get_exercises.dart';
import '../../../error/error.dart';
import '../../../router/routes.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'go_back_to_workouts_button.dart';
import 'workout_in_progress_initial_viewport.dart';
import 'workout_in_progress_paused_viewport.dart';
import 'workout_in_progress_unpaused_viewport.dart';

class WorkoutInProgressPage extends StatelessWidget {
  final WorkoutInProgressEntity _entity;

  int get _workoutId => _entity.workoutId;

  const WorkoutInProgressPage(this._entity);

  Widget _viewportBuilder(WorkoutInProgressState state) {
    if (state is ExercisesRetrievalSuccessState) {
      return WorkoutInProgressInitialViewport(
        firstExercise: state.firstExercise,
        hasNextExercise: state.hasNextExercise,
      );
    }
    if (state is PauseToggledOnState) {
      return WorkoutInProgressPausedViewport(state);
    }
    if (state is IsStartedState || state is PauseToggledOffState) {
      switch (state.runtimeType) {
        case IsStartedState:
          return WorkoutInProgressUnpausedViewport(state as IsStartedState);
        case PauseToggledOffState:
          return WorkoutInProgressUnpausedViewport(
              state as PauseToggledOffState);
      }
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WorkoutInProgressBloc>(
      create: (context) {
        final database = GetIt.I<RegimenDatabase>();
        final exerciseRepository = database.exerciseRepository;
        final usecase = GetExercises(exerciseRepository);
        return WorkoutInProgressBloc(_workoutId)
          ..add(WorkoutInProgressInitializedEvent(
            workoutId: _workoutId,
            usecase: usecase,
          ));
      },
      child: BlocConsumer<WorkoutInProgressBloc, WorkoutInProgressState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: () async => false,
            child: Material(
              child: SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: _viewportBuilder(
                    state,
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {
          if (state is WorkoutCompletedState) {
            final regimenNameAndIdByWorkoutId =
                MapEntry(state.workoutId, state.regimenNameAndId);
            Navigator.of(context).pushReplacementNamed(
              Routes.workoutComplete,
              arguments: regimenNameAndIdByWorkoutId,
            );
          }
          if (state is ExercisesRetrievalFailureState) {
            NavigateToDefaultErrorPage()(context)(state.failure);
          }
          if (state is GoBackToWorkoutsState) {
            GoBackToWorkoutsButton.navigate(
              context,
              state.regimenNameAndId,
            );
          }
        },
      ),
    );
  }
}
