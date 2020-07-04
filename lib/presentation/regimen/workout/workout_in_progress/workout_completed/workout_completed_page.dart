import 'package:auto_size_text/auto_size_text.dart';
import '../../../../common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/common/common.dart';
import '../../../../common/widgets/go_back_to_workouts_button.dart';
import 'bloc/workout_completed_bloc.dart';

class WorkoutCompletedPage extends StatelessWidget {
  final MapEntry<int, NameAndId<int>> regimenNameAndIdByWorkoutId;
  NameAndId<int> get regimenNameAndId => regimenNameAndIdByWorkoutId.value;
  const WorkoutCompletedPage({
    Key key,
    @required this.regimenNameAndIdByWorkoutId,
  }) : super(key: key);
  @override
  Widget build(BuildContext _context) {
    return BlocProvider<WorkoutCompletedBloc>(
      create: (BuildContext _) => WorkoutCompletedBloc(),
      child: BlocConsumer<WorkoutCompletedBloc, WorkoutCompletedState>(
        listener: (BuildContext context, WorkoutCompletedState state) {
          if (state is GoBackToWorkoutsState) {
            GoBackToWorkoutsButton.navigate(
              context,
              state.regimenNameAndId,
            );
          }
        },
        builder: (BuildContext context, WorkoutCompletedState state) {
          return SafeArea(
            child: Material(
              child: Column(
                children: <Widget>[
                  GoBackToWorkoutsButton.topLeft(
                    context: context,
                    event: GoBackToWorkoutsEvent(regimenNameAndId),
                  ),
                  ExpandedCenter(
                    child: AutoSizeText(
                      "You did it!",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
