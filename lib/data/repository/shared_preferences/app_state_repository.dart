import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constant/app_state_keys.dart';
import '../../../core/error/error.dart';
import '../../../core/error/failure.dart';
import '../../../domain/entities/preferences/preferences_entity.dart';
import '../../../domain/repository/repository.dart' as domain;

class AppStateRepository implements domain.AppStateRepository {
  Future<SharedPreferences> get _gettingSharedPreferences =>
      SharedPreferences.getInstance();
  @override
  Future<Either<Failure, bool>> getHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasBeenInitialized = sharedPreferences.getBool(AppStateKeys.init);

    return _valueOrKeyNotFoundFailure(hasBeenInitialized);
  }

  Either<Failure, TValue> _valueOrKeyNotFoundFailure<TValue>(TValue value) {
    return value != null
        ? right(value)
        : left(SharedPreferencesFailure.keyNotFound());
  }

  @override
  Future<Either<Failure, bool>> setHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    return right(await sharedPreferences.setBool(AppStateKeys.init, true));
  }

  @override
  Future<Either<Failure, bool>> getHasLocationPermission() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasLocationPermission =
        sharedPreferences.getBool(AppStateKeys.hasLocationPermission);
    return _valueOrKeyNotFoundFailure(hasLocationPermission);
  }

  @override
  Future<Either<Failure, bool>> setHasLocationPermission({
    bool hasLocationPermission,
  }) async {
    final sharedPreferences = await _gettingSharedPreferences;
    return right(await sharedPreferences.setBool(
        AppStateKeys.hasLocationPermission, hasLocationPermission));
  }

  @override
  Future<Either<Failure, PreferencesEntity>> getPreferences() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasWorkoutVoiceExplanationToggledOn = sharedPreferences
        .getBool(AppStateKeys.preferences.hasWorkoutVoiceExplanationToggledOn);
    final preferences = [
      _valueOrKeyNotFoundFailure(hasWorkoutVoiceExplanationToggledOn)
    ].toList();
    if (preferences.any((element) => element.isLeft())) {
      return left(SharedPreferencesFailure.keyNotFound());
    }

    return right(PreferencesEntity(
      hasWorkoutVoiceExplanationToggledOn: hasWorkoutVoiceExplanationToggledOn,
    ));
  }

  @override
  Future<Either<Failure, Null>> setPreferences(PreferencesEntity entity) async {
    final sharedPreferences = await _gettingSharedPreferences;
    final preferences = [
      await sharedPreferences.setBool(
        AppStateKeys.preferences.hasWorkoutVoiceExplanationToggledOn,
        entity.hasWorkoutVoiceExplanationToggledOn,
      ),
    ];
    if (preferences.any((element) => element == null)) {
      return left(SharedPreferencesFailure.keyNotFound());
    }
    return right(null);
  }
}
