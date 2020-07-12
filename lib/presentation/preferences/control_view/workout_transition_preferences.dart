import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import '../bloc/preferences_bloc.dart';

class WorkoutTransitionPreferences extends StatelessWidget {
  final PreferencesEntity preferences;
  const WorkoutTransitionPreferences(this.preferences, {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text("Workout Transition"),
        ),
        _hasWorkoutVoiceExplanationToggle(
          preferences: preferences,
          context: context,
        ),
        _hasWorkoutDingSoundEffectToggle(
          context: context,
          preferences: preferences,
        ),
      ]),
    );
  }

  static Widget _hasWorkoutVoiceExplanationToggle({
    @required PreferencesEntity preferences,
    @required BuildContext context,
  }) =>
      SwitchListTile(
        title: const Text("Voice"),
        value: preferences.hasWorkoutVoiceExplanationToggledOn,
        onChanged: (bool hasWorkoutVoiceExplanationToggledOn) =>
            BlocProvider.of<PreferencesBloc>(context).add(
          PreferencesChangedEvent(
            preferences: preferences.copyWith(
              PreferencesEntity(
                hasWorkoutVoiceExplanationToggledOn:
                    hasWorkoutVoiceExplanationToggledOn,
              ),
            ),
          ),
        ),
      );

  static Widget _hasWorkoutDingSoundEffectToggle({
    @required PreferencesEntity preferences,
    @required BuildContext context,
  }) =>
      SwitchListTile(
        title: const Text("Sound Effect"),
        value: preferences.hasWorkoutTransitionDingSoundEffectToggledOn,
        onChanged: (bool hasWorkoutTransitionDingSoundEffectToggledOn) =>
            BlocProvider.of<PreferencesBloc>(context).add(
          PreferencesChangedEvent(
            preferences: preferences.copyWith(
              PreferencesEntity(
                hasWorkoutTransitionDingSoundEffectToggledOn:
                    hasWorkoutTransitionDingSoundEffectToggledOn,
              ),
            ),
          ),
        ),
      );
}
