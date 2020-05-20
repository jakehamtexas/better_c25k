import 'package:flutter/material.dart';

import 'exercise_action.dart';

class Exercise {
  final int durationInSeconds;

  final ExerciseAction exerciseAction;

  Exercise({@required this.durationInSeconds, @required this.exerciseAction});
}
