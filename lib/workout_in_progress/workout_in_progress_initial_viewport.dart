import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../exercise/exercise.dart';
import 'bloc/workout_in_progress_bloc.dart';
import 'workout_in_progress_viewport.dart';

class WorkoutInProgressInitialViewport extends WorkoutInProgressViewport {
  final List<ExerciseModel> _exercises;
  WorkoutInProgressInitialViewport(this._exercises)
      : super(WorkoutInProgressStateDTO(
          currentCountdownTime: _exercises[0].durationInSeconds,
          exerciseActionMessage: _exercises[0].exerciseAction.message,
        ));

  @override
  Widget build(BuildContext context) => super.buildViewport(
        buttonMessage: "Start",
        onPressedHandler: () {
          BlocProvider.of<WorkoutInProgressBloc>(context)
              .add(StartEvent(exercises: _exercises));
        },
      );
}
