import 'package:flutter/material.dart';

import '../workout/workout.dart';
import 'regimen_model.dart';

class RegimenPage extends StatelessWidget {
  final RegimenModel regimen;
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
