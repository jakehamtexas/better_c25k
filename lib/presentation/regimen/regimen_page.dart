import 'package:flutter/material.dart';

import '../../domain/entities/regimen/regimen.dart';
import 'workout/workout.dart';

class RegimenPage extends StatelessWidget {
  final int regimenId;
  RegimenPage(this.regimenId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(regimenId.toString())),
      body: ListView(
          // children: exerciseWidgets,
          ),
    );
  }
}
