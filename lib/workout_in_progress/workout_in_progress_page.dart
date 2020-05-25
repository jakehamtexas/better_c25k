import 'package:flutter/material.dart';

import '../exercise/exercise.dart';
import 'workout_in_progress_configuration.dart';
import 'workout_in_progress_widget.dart';

class WorkoutInProgressPage extends StatelessWidget {
  final WorkoutInProgressConfiguration _configuration;

  String get _workoutTitle => _configuration.workoutTitle;
  List<ExerciseModel> get _exercises => _configuration.exercises;

  WorkoutInProgressPage(this._configuration);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_workoutTitle),
      ),
      body: WorkoutInProgressWidget(_exercises),
    );
  }
}
