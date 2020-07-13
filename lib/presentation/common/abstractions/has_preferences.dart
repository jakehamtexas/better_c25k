import '../../../domain/entities/preferences/preferences_entity.dart';

abstract class HasPreferences {
  final PreferencesEntity preferences;

  HasPreferences(this.preferences);
}
