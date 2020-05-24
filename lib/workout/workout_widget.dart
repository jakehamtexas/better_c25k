import 'package:flutter/material.dart';

import 'workout_model.dart';

class WorkoutWidgetState extends State<WorkoutWidget> {
  final WorkoutModel _workout;
  String get _workoutDescription => _workout.description;
  WorkoutWidgetState(this._workout);
  String get _workoutTitle {
    final weekNumber = _workout.ordinalWeekNumber;
    final week = "Week $weekNumber";

    final dayNumber = _workout.ordinalDayOfWeekNumber;
    final day = "Day $dayNumber";
    return "$week $day";
  }

  bool _isExpanded = false;
  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  void _start() {}
  @override
  Widget build(BuildContext context) {
    final double _height = _isExpanded ? 155 : 72;
    final _duration = Duration(milliseconds: 350);
    final _card = _WorkoutCard(
      isExpanded: _isExpanded,
      start: _start,
      toggleExpand: _toggleExpand,
      workoutDescription: _workoutDescription,
      workoutTitle: _workoutTitle,
    );
    return Center(
      child: AnimatedContainer(
        duration: _duration,
        height: _height,
        child: _card,
      ),
    );
  }
}

class WorkoutWidget extends StatefulWidget {
  final WorkoutModel _workout;
  WorkoutWidget(this._workout);
  @override
  State<StatefulWidget> createState() => WorkoutWidgetState(_workout);
}

class _WorkoutCard extends StatelessWidget {
  final bool isExpanded;
  final String workoutTitle;
  final String workoutDescription;
  final Function toggleExpand;
  final Function start;
  _WorkoutCard({
    @required this.isExpanded,
    @required this.workoutTitle,
    @required this.workoutDescription,
    @required this.toggleExpand,
    @required this.start,
  });
  Padding _verticalPadding(Widget child) {
    const verticalPadding = EdgeInsets.fromLTRB(0, 10, 0, 10);
    return Padding(
      padding: verticalPadding,
      child: child,
    );
  }

  Padding _horizontalPadding(Widget child) {
    const horizontalPadding = EdgeInsets.fromLTRB(10, 0, 10, 0);
    return Padding(
      padding: horizontalPadding,
      child: child,
    );
  }

  Card _getCard() {
    final workoutTitleWidget = Text(
      workoutTitle,
      style: TextStyle(fontWeight: FontWeight.bold),
    );
    final buttonBar = ButtonBar(
      children: <Widget>[
        RaisedButton(
          child: Text(isExpanded ? "Collapse" : "Expand"),
          onPressed: toggleExpand,
        ),
        RaisedButton(
          child: Text("Start"),
          onPressed: start,
        )
      ],
    );

    final withoutDescription = _horizontalPadding(
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              workoutTitleWidget,
              buttonBar,
            ],
          ),
        ],
      ),
    );

    final withDescription = _horizontalPadding(
      Wrap(
        children: [
          Column(
            children: <Widget>[
              _verticalPadding(
                workoutTitleWidget,
              ),
              Text(workoutDescription),
            ],
          ),
          buttonBar,
        ],
      ),
    );

    final cardChild = isExpanded ? withDescription : withoutDescription;

    return Card(
      child: cardChild,
    );
  }

  @override
  Widget build(BuildContext context) => _getCard();
}
