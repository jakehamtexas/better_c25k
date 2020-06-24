import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/error.dart';
import '../../../core/error/failure.dart';
import '../../../domain/repository/repository.dart' as domain;

class AppStateRepository implements domain.AppStateRepository {
  Future<SharedPreferences> get _gettingSharedPreferences =>
      SharedPreferences.getInstance();
  static const String _initKey = 'init';
  static const String _hasLocationPermissionKey = "hasLocationPermission";
  @override
  Future<Either<Failure, bool>> getHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasBeenInitialized = sharedPreferences.getBool(_initKey);

    return _valueOrKeyNotFoundFailure(hasBeenInitialized);
  }

  Either<Failure, bool> _valueOrKeyNotFoundFailure(bool hasBeenInitialized) {
    return hasBeenInitialized != null
        ? right(hasBeenInitialized)
        : left(const KeyNotFoundFailure());
  }

  @override
  Future<Either<Failure, bool>> setHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    return right(await sharedPreferences.setBool(_initKey, true));
  }

  @override
  Future<Either<Failure, bool>> getHasLocationPermission() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasLocationPermission =
        sharedPreferences.getBool(_hasLocationPermissionKey);
    return _valueOrKeyNotFoundFailure(hasLocationPermission);
  }

  @override
  Future<Either<Failure, bool>> setHasLocationPermission({
    bool hasLocationPermission,
  }) async {
    final sharedPreferences = await _gettingSharedPreferences;
    return right(await sharedPreferences.setBool(
        _hasLocationPermissionKey, hasLocationPermission));
  }
}
