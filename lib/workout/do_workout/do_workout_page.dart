import 'package:flutter/material.dart';

import '../../exercise/exercise.dart';
import 'do_workout_configuration.dart';
import 'do_workout_widget.dart';

class DoWorkoutPage extends StatelessWidget {
  final DoWorkoutConfiguration _configuration;

  String get _workoutTitle => _configuration.workoutTitle;
  List<ExerciseModel> get _exercises => _configuration.exercises;

  DoWorkoutPage(this._configuration);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_workoutTitle),
      ),
      body: DoWorkoutWidget(_exercises),
    );
  }
}
