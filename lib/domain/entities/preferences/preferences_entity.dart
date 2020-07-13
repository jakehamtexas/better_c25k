import 'package:equatable/equatable.dart';

class PreferencesEntity extends Equatable {
  final bool hasWorkoutVoiceExplanationToggledOn;
  final bool hasWorkoutTransitionDingSoundEffectToggledOn;
  const PreferencesEntity({
    this.hasWorkoutVoiceExplanationToggledOn,
    this.hasWorkoutTransitionDingSoundEffectToggledOn,
  });

  @override
  List<Object> get props => [
        hasWorkoutVoiceExplanationToggledOn,
        hasWorkoutTransitionDingSoundEffectToggledOn
      ];

  factory PreferencesEntity.defaultPreferences() => const PreferencesEntity(
        hasWorkoutVoiceExplanationToggledOn: true,
        hasWorkoutTransitionDingSoundEffectToggledOn: true,
      );

  PreferencesEntity copyWith(PreferencesEntity entity) => PreferencesEntity(
        hasWorkoutVoiceExplanationToggledOn:
            entity.hasWorkoutVoiceExplanationToggledOn ??
                hasWorkoutVoiceExplanationToggledOn,
        hasWorkoutTransitionDingSoundEffectToggledOn:
            entity.hasWorkoutTransitionDingSoundEffectToggledOn ??
                hasWorkoutTransitionDingSoundEffectToggledOn,
      );
}
