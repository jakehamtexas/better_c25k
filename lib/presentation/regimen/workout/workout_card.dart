import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/workout_bloc.dart';

class CollapsedWorkoutCard extends WorkoutCard {
  CollapsedWorkoutCard({
    @required startFunc,
    @required workoutDescription,
    @required workoutTitle,
  }) : super(
          startFunc: startFunc,
          workoutTitle: workoutTitle,
          workoutDescription: workoutDescription,
        );
  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget = WorkoutCard._getWorkoutTitleWidget(workoutTitle);
    final toggleExpand = WorkoutCard._getToggleExpand(context);
    final collapsedButtonBar = ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Expand"),
          onPressed: toggleExpand,
        ),
        RaisedButton(
          child: Text("Start"),
          onPressed: startFunc,
        )
      ],
    );

    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: WorkoutCard._paddingAmount,
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                workoutTitleWidget,
                collapsedButtonBar,
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandedWorkoutCard extends WorkoutCard {
  ExpandedWorkoutCard({
    @required startFunc,
    @required workoutTitle,
    @required workoutDescription,
  }) : super(
          startFunc: startFunc,
          workoutDescription: workoutDescription,
          workoutTitle: workoutTitle,
        );

  @override
  Widget build(BuildContext context) {
    final workoutTitleWidget = WorkoutCard._getWorkoutTitleWidget(workoutTitle);
    final workoutDescriptionWidget = Text(workoutDescription);
    final toggleExpand = WorkoutCard._getToggleExpand(context);
    final expandedButtonBar = ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text("Collapse"),
          onPressed: toggleExpand,
        ),
        RaisedButton(
          child: Text("Start"),
          onPressed: startFunc,
        )
      ],
    );
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: WorkoutCard._paddingAmount,
        ),
        child: Wrap(
          children: [
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: WorkoutCard._paddingAmount,
                  ),
                  child: workoutTitleWidget,
                ),
                workoutDescriptionWidget,
              ],
            ),
            expandedButtonBar,
          ],
        ),
      ),
    );
  }
}

abstract class WorkoutCard extends StatelessWidget {
  final Function startFunc;
  final String workoutTitle;
  final String workoutDescription;

  WorkoutCard({
    @required this.startFunc,
    @required this.workoutTitle,
    @required this.workoutDescription,
  });

  static const double _paddingAmount = 10;
  static Function _getToggleExpand(BuildContext context) => () {
        BlocProvider.of<WorkoutBloc>(context).add(WorkoutExpandToggledEvent());
      };

  static Widget _getWorkoutTitleWidget(String workoutTitle) => Text(
        workoutTitle,
        style: TextStyle(fontWeight: FontWeight.bold),
      );
}
