part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesEvent {}

class GetPreferencesEvent extends PreferencesEvent {}

class PreferencesChangedEvent extends PreferencesEvent
    implements HasPreferences {
  PreferencesChangedEvent({
    @required this.preferences,
    @required this.shouldShowSaveBar,
  });

  @override
  final PreferencesEntity preferences;
  final bool shouldShowSaveBar;
}

class SaveSelectedEvent extends PreferencesEvent implements HasPreferences {
  SaveSelectedEvent({
    @required this.preferences,
  });

  @override
  final PreferencesEntity preferences;
}

class CancelSelectedEvent extends PreferencesEvent implements HasPreferences {
  CancelSelectedEvent({
    @required this.preferences,
  });

  @override
  final PreferencesEntity preferences;
}
