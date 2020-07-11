part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesState {}

class PreferencesInitial extends PreferencesState {}

abstract class HydratedPreferencesState extends PreferencesState
    implements HasPreferences {
  HydratedPreferencesState({
    @required this.preferences,
  });
  @override
  final PreferencesEntity preferences;
}

class ShownSaveableButtonBarState extends HydratedPreferencesState {
  ShownSaveableButtonBarState(
    PreferencesEntity preferences,
  ) : super(
          preferences: preferences,
        );
}

class HiddenSaveableButtonBarState extends HydratedPreferencesState {
  HiddenSaveableButtonBarState(
    PreferencesEntity preferences,
  ) : super(
          preferences: preferences,
        );
}

class GetFailedState extends PreferencesState {}

class SaveFailedState extends PreferencesState {}

class SaveSuccessfulState extends HydratedPreferencesState {
  SaveSuccessfulState(
    PreferencesEntity preferences,
  ) : super(
          preferences: preferences,
        );
}
