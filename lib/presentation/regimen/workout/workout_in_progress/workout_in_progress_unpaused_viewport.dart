import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_viewport.dart';

class WorkoutInProgressUnpausedViewport extends WorkoutInProgressViewport {
  const WorkoutInProgressUnpausedViewport(WorkoutInProgressStateDTO _state)
      : super(_state);
  @override
  Widget build(BuildContext context) => super.buildViewport(
        onPressedHandler: () {
          BlocProvider.of<WorkoutInProgressBloc>(context).add(PauseEvent());
        },
        buttonIcon: Icons.pause_circle_outline,
        context: context,
        shouldPause: false,
      );
}
