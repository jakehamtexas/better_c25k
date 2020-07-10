import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PreferencesEntity extends Equatable {
  final bool hasWorkoutVoiceExplanationToggledOn;
  const PreferencesEntity({
    @required this.hasWorkoutVoiceExplanationToggledOn,
  });

  @override
  List<Object> get props => [hasWorkoutVoiceExplanationToggledOn];
}
