part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesState {}

class PreferencesInitial extends PreferencesState {}

class GetSucceededState extends PreferencesState {
  final PreferencesEntity preferences;
  GetSucceededState(
    this.preferences,
  );
}

class GetFailedState extends PreferencesState {}

class SaveFailedState extends PreferencesState {}

class SaveSuccessfulState extends PreferencesState {}

class ShowSaveBarState extends PreferencesState {}
