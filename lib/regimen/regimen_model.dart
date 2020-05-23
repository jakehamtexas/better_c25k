import 'package:flutter/material.dart';

import 'package:better_c25k/workout/workout.dart';

/// A regimen is a full suite of consecutive workouts.
/// A canonical example of this would be the Couch To 5K
/// workout regimen.
class RegimenModel {
  final List<WorkoutModel> workouts;
  final String name;

  RegimenModel({@required this.workouts, this.name = "My Regimen"});
}
