import 'package:flutter/material.dart';

import '../workout/workout.dart';

/// A regimen is a full suite of consecutive workouts.
/// A canonical example of this would be the Couch To 5K
/// workout regimen.
class RegimenEntity {
  final List<WorkoutEntity> workouts;
  final String name;
  final String description;

  RegimenEntity({
    @required this.workouts,
    this.name = "My Regimen",
    this.description = "MyDescription",
  });
}
