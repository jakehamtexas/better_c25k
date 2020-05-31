import 'package:flutter/material.dart';

import '../../domain/entities/regimen/regimen.dart';
import '../workout/workout.dart';

class RegimenPage extends StatelessWidget {
  final RegimenEntity regimen;
  RegimenPage(this.regimen);

  @override
  Widget build(BuildContext context) {
    final exerciseWidgets =
        regimen.workouts.map((workout) => WorkoutTile(workout)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(regimen.name)),
      body: ListView(
        children: exerciseWidgets,
      ),
    );
  }
}
