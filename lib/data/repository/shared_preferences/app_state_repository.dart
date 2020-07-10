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

  Either<Failure, bool> _valueOrKeyNotFoundFailure(bool hasBeenInitialized) {
    return hasBeenInitialized != null
        ? right(hasBeenInitialized)
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
  Future<Either<Failure, PreferencesEntity>> getPreferences() {
    // TODO: implement getPreferences
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Null>> setPreferences(PreferencesEntity entity) {
    // TODO: implement setPreferences
    throw UnimplementedError();
  }
}
