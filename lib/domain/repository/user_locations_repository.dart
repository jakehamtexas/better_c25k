import 'package:better_c25k/core/error/error.dart';
import 'package:better_c25k/domain/entities/location/user_location_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserLocationsRepository {
  Future<Either<Failure, int>> insertLocation(
    UserLocationEntity userLocation,
    int workoutId,
  );
}
