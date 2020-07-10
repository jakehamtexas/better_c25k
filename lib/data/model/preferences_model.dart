import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class PreferencesModel extends Equatable {
  final bool hasWorkoutVoiceExplanationToggledOn;
  const PreferencesModel({
    @required this.hasWorkoutVoiceExplanationToggledOn,
  });

  @override
  List<Object> get props => [hasWorkoutVoiceExplanationToggledOn];
}
