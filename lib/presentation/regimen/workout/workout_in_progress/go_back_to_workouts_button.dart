import 'package:better_c25k/presentation/regimen/workout/workout_in_progress/bloc/workout_in_progress_bloc.dart'
    as workout_in_progress;
import 'package:better_c25k/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/workout_in_progress_viewport.dart';
import '../../../../core/bloc/bloc.dart';
import '../../../../domain/entities/common/common.dart';
import './workout_completed/bloc/workout_completed_bloc.dart'
    as workout_completed;

class GoBackToWorkoutsButton<
        TGoBackToWorkoutsEvent extends IGoBackToWorkoutsEvent>
    extends RawMaterialButton {
  GoBackToWorkoutsButton({
    @required BuildContext buildContext,
    @required TGoBackToWorkoutsEvent event,
  }) : super(
          onPressed: () {
            final bloc = _getBloc(event, buildContext);
            bloc.add(event);
          },
          shape: WorkoutInProgressButton.buttonShape,
          highlightColor: WorkoutInProgressButton.highlighColor,
          splashColor: WorkoutInProgressButton.splashColor,
          child: Icon(
            Icons.close,
            size: WorkoutInProgressButton.buttonSize,
          ),
        );

  static Bloc _getBloc(
      IGoBackToWorkoutsEvent event, BuildContext buildContext) {
    switch (event.runtimeType) {
      case workout_in_progress.GoBackToWorkoutsEvent:
        return BlocProvider.of<workout_in_progress.WorkoutInProgressBloc>(
            buildContext);
      case workout_completed.GoBackToWorkoutsEvent:
        return BlocProvider.of<workout_completed.WorkoutCompletedBloc>(
            buildContext);
      default:
        throw UnimplementedError();
    }
  }

  static void navigate(
    BuildContext context,
    NameAndId<int> regimenNameAndId,
  ) {
    Navigator.of(context).pushReplacementNamed(
      Routes.regimen,
      arguments: regimenNameAndId,
    );
  }
}
