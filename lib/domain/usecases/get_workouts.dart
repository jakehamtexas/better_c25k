import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../../domain/repository/repository.dart';
import '../entities/workout/workout.dart';

class GetWorkouts {
  final WorkoutRepository _repository;
  GetWorkouts(this._repository);

  Future<Either<Failure, List<WorkoutPresentationEntity>>> call(
      int regimenId) async {
    return _repository.getWorkoutsForRegimenId(regimenId);
  }
}
