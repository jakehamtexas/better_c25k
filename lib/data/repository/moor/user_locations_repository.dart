import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../../core/error/failure.dart';
import '../../../core/extension/dartz/dartz.dart';
import '../../../domain/entities/location/user_location_entity.dart';
import '../../../domain/repository/user_locations_repository.dart' as domain;
import '../../datasources/datasources.dart';

part 'user_locations_repository.g.dart';

@UseDao(tables: [UserLocations])
class UserLocationsRepository extends DatabaseAccessor<RegimenDatabase>
    with _$UserLocationsRepositoryMixin
    implements domain.UserLocationsRepository {
  UserLocationsRepository(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, int>> insertLocation(
    UserLocationEntity userLocation,
    int workoutId,
  ) async {
    final userLocationCompanion = UserLocationsCompanion(
      latitude: Value(userLocation.latitude),
      longitude: Value(userLocation.longitude),
      speedInMetersPerSecond: Value(userLocation.speedInMetersPerSecond),
      time: Value(userLocation.time),
      workoutId: Value(workoutId),
    );
    return await Task(() => into(userLocations).insert(userLocationCompanion))
        .attempt()
        .mapLeftToFailure()
        .run() as Either<Failure, int>;
  }

  @override
  Future<Either<Failure, List<UserLocationEntity>>> getUserLocationsForWorkout(
      int workoutId) async {
    final query = select(userLocations)
      ..where((userLocation) => userLocation.workoutId.equals(workoutId));
    return await Task(
      () => query
          .map((userLocation) => UserLocationEntity(
                latitude: userLocation.latitude,
                longitude: userLocation.longitude,
                speedInMetersPerSecond: userLocation.speedInMetersPerSecond,
                time: userLocation.time,
              ))
          .get(),
    ).attempt().mapLeftToFailure().run()
        as Either<Failure, List<UserLocationEntity>>;
  }
}
