import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_bloc.dart';

class TileButtonBarFactory {
  Widget call({
    @required BuildContext context,
    @required String expandCollapseText,
    @required int workoutId,
    @required String workoutTitle,
  }) {
    return ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text(expandCollapseText),
          onPressed: () => BlocProvider.of<WorkoutBloc>(context)
              .add(WorkoutExpandToggledEvent()),
        ),
        RaisedButton(
          child: Text("Start"),
          onPressed: () => BlocProvider.of<WorkoutBloc>(context).add(
            WorkoutStartedEvent(
              workoutId: workoutId,
              context: context,
              workoutTitle: workoutTitle,
            ),
          ),
        )
      ],
    );
  }
}
