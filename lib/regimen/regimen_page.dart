import 'package:better_c25k/router/routes.dart';
import 'package:better_c25k/workout/workout.dart';
import 'package:flutter/material.dart';

import 'regimen_model.dart';

class RegimenPage extends StatelessWidget {
  final RegimenModel regimen;
  RegimenPage(this.regimen);

  @override
  Widget build(BuildContext context) {
    final exerciseWidgets =
        regimen.workouts.map((workout) => WorkoutWidget(workout)).toList();
    return Scaffold(
      appBar: AppBar(title: Text(regimen.name)),
      body: ListView(
        children: exerciseWidgets,
      ),
    );
  }
}
