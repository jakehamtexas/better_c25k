import 'package:flutter/material.dart';

import 'exercise_action.dart';

class ExerciseModel {
  final int durationInSeconds;

  final ExerciseAction exerciseAction;

  const ExerciseModel({
    @required this.durationInSeconds,
    @required this.exerciseAction,
  });
}
