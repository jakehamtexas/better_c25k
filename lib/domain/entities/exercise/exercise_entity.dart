import 'package:flutter/material.dart';

import '../../../constant/exercise_action.dart';

class ExerciseEntity {
  final int durationInSeconds;

  final ExerciseAction exerciseAction;

  const ExerciseEntity({
    @required this.durationInSeconds,
    @required this.exerciseAction,
  });
}
