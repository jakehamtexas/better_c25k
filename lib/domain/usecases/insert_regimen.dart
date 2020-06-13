import 'package:better_c25k/core/error/database_insertion_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/error/error.dart';
import '../../domain/repository/repository.dart';
import '../entities/regimen/regimen.dart';

class InsertRegimen {
  final RegimenRepository regimenRepository;
  final ExerciseRepository exerciseRepository;
  final WorkoutRepository workoutRepository;

  InsertRegimen({
    @required this.regimenRepository,
    @required this.exerciseRepository,
    @required this.workoutRepository,
  });

  Future<Either<Failure, int>> call(RegimenEntity entity) async {
    final regimenIdOrFailure = await regimenRepository.insertRegimen(entity);
    if (regimenIdOrFailure.isRight()) {
      final regimenId = regimenIdOrFailure.getOrElse(() => null);
      final workoutIdsOrFailure = (await workoutRepository.insertWorkouts(
        workoutEntities: entity.workouts,
        regimenId: regimenId,
      ));

      if (workoutIdsOrFailure.isRight()) {
        final workoutIds = workoutIdsOrFailure.getOrElse(() => null);
        final exercisesByWorkoutId = entity.workouts.asMap().map(
            (index, workout) => MapEntry(workoutIds[index], workout.exercises));
        final exerciseIdsOrFailure =
            await exerciseRepository.insertExercisesByMap(exercisesByWorkoutId);

        if (exerciseIdsOrFailure.isRight()) {
          return right<DatabaseInsertionFailure, int>(regimenId);
        }
      }
    }

    return left<DatabaseInsertionFailure, int>(DatabaseInsertionFailure());
  }
}
