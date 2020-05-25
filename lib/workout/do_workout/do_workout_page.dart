import 'package:flutter/material.dart';

import '../../exercise/exercise.dart';
import 'do_workout_configuration.dart';
import 'do_workout_widget.dart';

class DoWorkoutPage extends StatelessWidget {
  List<ExerciseModel> _exercises;
  String _workoutTitle;
  DoWorkoutPage(DoWorkoutConfiguration configuration) {
    _exercises = configuration.exercises;
    _workoutTitle = configuration.workoutTitle;
  }

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
