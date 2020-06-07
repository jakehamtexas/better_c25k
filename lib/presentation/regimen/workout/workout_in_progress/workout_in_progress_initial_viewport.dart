import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/exercise/exercise.dart';
import '../../../../constant/exercise_action.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_viewport.dart';

class WorkoutInProgressInitialViewport extends WorkoutInProgressViewport {
  WorkoutInProgressInitialViewport(ExerciseEntity firstExercise)
      : super(WorkoutInProgressStateDTO(
          currentCountdownTime: firstExercise.durationInSeconds,
          exerciseActionMessage: firstExercise.exerciseAction.message,
        ));

  @override
  Widget build(BuildContext context) => super.buildViewport(
        buttonMessage: "Start",
        onPressedHandler: () {
          BlocProvider.of<WorkoutInProgressBloc>(context).add(StartEvent());
        },
      );
}
