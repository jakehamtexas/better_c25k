import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/error/database_insertion_failure.dart';
import '../../core/error/error.dart';
import '../../core/extension/dartz/dartz.dart';
import '../../domain/repository/repository.dart';
import '../entities/regimen/regimen.dart';
import '../entities/workout/workout.dart';

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
    final engine = InsertRegimenEngine(
      exerciseRepository: exerciseRepository,
      regimenRepository: regimenRepository,
      workoutRepository: workoutRepository,
    );

    await engine.insertRegimen(entity);
    await engine.insertWorkouts(entity.workouts);
    await engine.insertExercises(entity.workouts);

    return engine.result;
  }
}

class InsertRegimenEngine {
  final RegimenRepository regimenRepository;
  final ExerciseRepository exerciseRepository;
  final WorkoutRepository workoutRepository;

  Either<DatabaseInsertionFailure, int> regimenIdOrFailure;
  Either<DatabaseInsertionFailure, List<int>> workoutIdsOrFailure;
  Either<DatabaseInsertionFailure, List<int>> exerciseIdsOrFailure;

  Either<DatabaseInsertionFailure, int> get result {
    final eithers = [
      regimenIdOrFailure,
      workoutIdsOrFailure,
      exerciseIdsOrFailure,
    ];
    if (eithers.any((either) => either == null)) {
      return left(DatabaseInsertionFailure.operationsOutOfOrderFailure());
    }
    final failure = eithers
        .firstWhere(
          (either) => either.isLeft(),
          orElse: () => null,
        )
        ?.foldWithValueRight(0);
    return failure ?? regimenIdOrFailure;
  }

  InsertRegimenEngine({
    @required this.regimenRepository,
    @required this.exerciseRepository,
    @required this.workoutRepository,
  });

  Future insertRegimen(
    RegimenEntity entity,
  ) async {
    final _regimenIdOrFailure = await regimenRepository.insertRegimen(entity);
    regimenIdOrFailure = _regimenIdOrFailure.foldWithValueLeft(
      DatabaseInsertionFailure.regimenInsertionFailure(),
    );
  }

  Future insertWorkouts(
    List<WorkoutEntity> workoutEntities,
  ) async {
    workoutIdsOrFailure =
        await regimenIdOrFailure.foldWithAsyncFunctionRight<List<int>>(
      (regimenId) async => (await workoutRepository.insertWorkouts(
        workoutEntities: workoutEntities,
        regimenId: regimenId,
      ))
          .foldWithValueLeft(
        DatabaseInsertionFailure.workoutsInsertionFailure(),
      ),
    );
  }

  Future insertExercises(
    List<WorkoutEntity> workoutEntities,
  ) async {
    exerciseIdsOrFailure =
        await workoutIdsOrFailure.foldWithAsyncFunctionRight<List<int>>(
      (workoutIds) async {
        final exercisesByWorkoutId = workoutEntities.asMap().map(
            (index, workout) => MapEntry(workoutIds[index], workout.exercises));
        return (await exerciseRepository
                .insertExercisesByMap(exercisesByWorkoutId))
            .foldWithValueLeft(
          DatabaseInsertionFailure.exercisesInsertionFailure(),
        );
      },
    );
  }
}
