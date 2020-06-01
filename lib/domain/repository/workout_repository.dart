import 'package:flutter/material.dart';

import '../../constant/completion_status.dart';
import '../../core/error/error.dart';
import '../entities/workout/workout.dart';
import 'package:dartz/dartz.dart';

abstract class WorkoutRepository {
  Future<Either<Failure, List<WorkoutEntity>>> getWorkoutsForRegimenId(
      int regimenId);
  Future<Either<Failure, Null>> setCompletionStatusForWorkout({
    @required int workoutId,
    @required CompletionStatus completionStatus,
  });
}
