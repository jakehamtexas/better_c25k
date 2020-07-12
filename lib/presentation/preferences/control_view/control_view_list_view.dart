import 'package:flutter/material.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import 'workout_transition_preferences.dart';

class ControlViewListView extends StatelessWidget {
  final PreferencesEntity preferences;
  const ControlViewListView(this.preferences);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          WorkoutTransitionPreferences(preferences),
        ],
      ),
    );
  }
}
