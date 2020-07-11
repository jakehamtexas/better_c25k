import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import '../../common/common.dart';
import '../bloc/preferences_bloc.dart';
import 'toggleable_control.dart';

abstract class PreferencesBase {
  static Widget hasWorkoutVoiceExplanationToggle({
    @required PreferencesEntity preferences,
    @required BuildContext context,
  }) =>
      ExpandedCenter(
        child: ToggleableControl(
          title: "Voice Transitions",
          isToggled: preferences.hasWorkoutVoiceExplanationToggledOn,
          onToggled: (bool hasWorkoutVoiceExplanationToggledOn) =>
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
        ),
      );
}
