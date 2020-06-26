import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/exercise_action.dart';
import '../../../../domain/entities/exercise/exercise.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_viewport.dart';

class WorkoutInProgressInitialViewport extends WorkoutInProgressViewport {
  WorkoutInProgressInitialViewport({
    @required ExerciseEntity firstExercise,
    @required bool hasNextExercise,
  }) : super(WorkoutInProgressStateDTO(
            currentCountdownTime: firstExercise.durationInSeconds,
            exerciseActionMessage: firstExercise.exerciseAction.message,
            hasPreviousExercise: false,
            hasNextExercise: hasNextExercise));

  @override
  Widget build(BuildContext context) => super.buildViewport(
        buttonIcon: Icons.play_circle_outline,
        onPressedHandler: () {
          BlocProvider.of<WorkoutInProgressBloc>(context).add(StartEvent());
        },
        context: context,
        shouldPause: true,
      );
}
