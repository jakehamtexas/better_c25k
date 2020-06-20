import 'package:better_c25k/core/error/error.dart';
import 'package:better_c25k/domain/entities/location/user_location.dart';
import 'package:dartz/dartz.dart';

abstract class LocationRepository {
  Future<Either<Failure, int>> insertLocation({
    UserLocation userLocation,
    int workoutId,
  });
}
