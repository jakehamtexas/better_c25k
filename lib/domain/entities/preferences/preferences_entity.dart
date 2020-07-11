import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PreferencesEntity extends Equatable {
  final bool hasWorkoutVoiceExplanationToggledOn;
  const PreferencesEntity({
    this.hasWorkoutVoiceExplanationToggledOn,
  });

  @override
  List<Object> get props => [hasWorkoutVoiceExplanationToggledOn];

  factory PreferencesEntity.defaultPreferences() => const PreferencesEntity(
        hasWorkoutVoiceExplanationToggledOn: true,
      );

  PreferencesEntity copyWith(PreferencesEntity entity) => PreferencesEntity(
        hasWorkoutVoiceExplanationToggledOn:
            entity.hasWorkoutVoiceExplanationToggledOn ??
                hasWorkoutVoiceExplanationToggledOn,
      );
}
