import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../constant/completion_status.dart';
import '../../core/error/failure.dart';
import '../../core/extension/as_either_extension.dart';
import '../../domain/entities/workout/workout_entity.dart';
import '../../domain/repository/workout_repository.dart';
import '../datasources/datasources.dart';

part 'workout_repository_dao.g.dart';

@UseDao(tables: [Workouts, Exercises])
class WorkoutRepositoryDao extends DatabaseAccessor<RegimenDatabase>
    with _$WorkoutRepositoryDaoMixin
    implements WorkoutRepository {
  WorkoutRepositoryDao(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, List<WorkoutEntity>>> getWorkoutsForRegimenId(
      int regimenId) async {
    final exercisesByWorkoutId = HashMap.fromIterable(
      await select(exercises).get(),
      key: (exercise) => exercise.id,
      value: (exercise) => exercise,
    );

    final workoutsMatchedQuery = select(workouts)
      ..where((workout) => workout.regimenId.equals(regimenId));
    final workoutEntities = workoutsMatchedQuery
        .map((workout) => WorkoutEntity(
              workoutId: workout.id,
              exercises: exercisesByWorkoutId[workout.id],
              ordinalDayOfWeekNumber: workout.dayNumber,
              ordinalWeekNumber: workout.weekNumber,
            ))
        .get();
    return await workoutEntities.asEither();
  }

  @override
  Future<Either<Failure, int>> setCompletionStatusForWorkout(
      {int workoutId, CompletionStatus completionStatus}) async {
    return await (update(workouts)
          ..where((workout) => workout.id.equals(workoutId)))
        .write(
          WorkoutsCompanion(
            completionStatus: Value(completionStatus),
          ),
        )
        .asEither();
  }

}
