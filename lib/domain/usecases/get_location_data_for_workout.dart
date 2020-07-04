import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';
import '../../core/extension/dartz/dartz.dart';
import '../../domain/entities/location/user_location_entity.dart';
import '../../domain/repository/repository.dart';

class GetLocationDataForWorkout {
  final UserLocationsRepository userLocationsRepository;
  const GetLocationDataForWorkout(this.userLocationsRepository);
  Future<Either<Failure, List<UserLocationEntity>>> call(int workoutId) async {
    final userLocationsOrFailure =
        await userLocationsRepository.getUserLocationsForWorkout(workoutId);
    if (userLocationsOrFailure.isLeft()) {
      return userLocationsOrFailure
          .foldWithValueLeft(const UserLocationFailure());
    }
    return userLocationsOrFailure;
  }
}
