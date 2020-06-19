import 'package:better_c25k/presentation/error/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../data/datasources/datasources.dart';
import '../../../../domain/entities/workout_in_progress/workout_in_progress.dart';
import '../../../../domain/usecases/get_exercises.dart';
import '../../../router/routes.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_initial_viewport.dart';
import 'workout_in_progress_paused_viewport.dart';
import 'workout_in_progress_unpaused_viewport.dart';

class WorkoutInProgressPage extends StatelessWidget {
  final WorkoutInProgressEntity _entity;

  String get _workoutTitle => _entity.workoutTitle;
  int get _workoutId => _entity.workoutId;

  const WorkoutInProgressPage(this._entity);

  Widget bodyBuilder(WorkoutInProgressState state) {
    if (state is ExercisesRetrievalSuccessState) {
      return WorkoutInProgressInitialViewport(state.firstExercise);
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
        final exerciseRepository =
            GetIt.I<RegimenDatabase>().exerciseRepository;
        final usecase = GetExercises(exerciseRepository);
        return WorkoutInProgressBloc()
          ..add(WorkoutInProgressInitializedEvent(
            workoutId: _workoutId,
            context: context,
            usecase: usecase,
          ));
      },
      child: BlocConsumer<WorkoutInProgressBloc, WorkoutInProgressState>(
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
        listener: (context, state) {
          if (state is ExercisesRetrievalFailureState) {
            NavigateToDefaultErrorPage()(context)(state.failure);
          }
        },
      ),
    );
  }
}
