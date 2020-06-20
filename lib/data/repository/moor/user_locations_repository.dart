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
      workoutId: Value(workoutId),
    );
    return await Task(() => into(userLocations).insert(userLocationCompanion))
        .attempt()
        .mapLeftToFailure()
        .run() as Either<Failure, int>;
  }
}
