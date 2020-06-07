import 'package:flutter/material.dart';

import '../../domain/entities/workout/workout_entity.dart';
import 'workout/workout_tile.dart';

class WorkoutsList extends StatelessWidget {
  final List<WorkoutEntity> workouts;
  WorkoutsList(this.workouts);

  @override
  Widget build(BuildContext context) {
    final exerciseWidgets =
        workouts.map((workout) => WorkoutTile(workout)).toList();
    return ListView(
      children: exerciseWidgets,
    );
  }
}
