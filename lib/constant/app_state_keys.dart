class AppStateKeys {
  static const String init = 'init';
  static const String hasLocationPermission = 'hasLocationPermission';
  static const _Preferences preferences = _Preferences();
}

class _Preferences {
  String get _prefix => 'preferences';

  String get hasWorkoutVoiceExplanationToggledOn =>
      '$_prefix-hasWorkoutVoiceExplanationToggledOn';
  String get hasWorkoutTransitionDingSoundEffectToggledOn =>
      '$_prefix-hasWorkoutTransitionDingSoundEffectToggledOn';
  const _Preferences();
}
