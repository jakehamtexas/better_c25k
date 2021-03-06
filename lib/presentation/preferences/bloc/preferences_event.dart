part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesEvent {}

class GetPreferencesEvent extends PreferencesEvent {}

class PreferencesChangedEvent extends PreferencesEvent
    implements HasPreferences {
  PreferencesChangedEvent({
    @required this.preferences,
  });

  @override
  final PreferencesEntity preferences;
}

class SaveSelectedEvent extends PreferencesEvent {}

class CancelSelectedEvent extends PreferencesEvent {}

class UpdateBottomSheetControllerEvent extends PreferencesEvent {
  final PersistentBottomSheetController bottomSheetController;

  UpdateBottomSheetControllerEvent(this.bottomSheetController);
}
