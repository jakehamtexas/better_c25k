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
    // TODO: Use either properly, instead of doing this lazy getOrElse
    final regimenId = regimenIdOrFailure.getOrElse(() => null);
    final workoutIds = (await workoutRepository.insertWorkouts(
      workoutEntities: entity.workouts,
      regimenId: regimenId,
    ))
        .getOrElse(() => null);

    final exercisesByWorkoutId = entity.workouts.asMap().map(
        (index, workout) => MapEntry(workoutIds[index], workout.exercises));
    await exerciseRepository.insertExercisesByMap(exercisesByWorkoutId);

    return regimenIdOrFailure;
  }
}
