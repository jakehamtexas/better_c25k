import 'package:flutter/material.dart';

import '../../constant/completion_status.dart';
import '../../core/error/error.dart';
import '../entities/workout/workout.dart';
import 'package:dartz/dartz.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutPresentationEntity>>>
      getWorkoutsForRegimenId(int regimenId);
  Future<Either<Failure, int>> setCompletionStatusForWorkout({
    @required int workoutId,
    @required CompletionStatus completionStatus,
  });
  Future<Either<Failure, List<int>>> insertWorkouts({
    @required List<WorkoutEntity> workoutEntities,
    @required int regimenId,
  });
}
