import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/error/error.dart';
import '../../../core/error/failure.dart';
import '../../../domain/repository/repository.dart' as domain;

class AppStateRepository implements domain.AppStateRepository {
  Future<SharedPreferences> get _gettingSharedPreferences async =>
      await SharedPreferences.getInstance();
  static const String _initKey = 'init';
  @override
  Future<Either<Failure, bool>> getHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    final hasBeenInitialized = sharedPreferences.getBool(_initKey);

    return hasBeenInitialized != null
        ? right(hasBeenInitialized)
        : left(KeyNotFoundFailure());
  }

  @override
  Future<Either<Failure, bool>> setHasBeenInitialized() async {
    final sharedPreferences = await _gettingSharedPreferences;
    return right(await sharedPreferences.setBool(_initKey, true));
  }
}
