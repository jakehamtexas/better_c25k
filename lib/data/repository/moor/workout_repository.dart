import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../../constant/completion_status.dart';
import '../../../core/error/failure.dart';
import '../../../core/extension/map_left_to_failure_task_extension.dart';
import '../../../domain/entities/workout/workout.dart';
import '../../../domain/entities/workout/workout_entity.dart';
import '../../../domain/repository/workout_repository.dart' as domain;
import '../../datasources/datasources.dart';

part 'workout_repository.g.dart';

@UseDao(tables: [Workouts, Exercises])
class WorkoutRepository extends DatabaseAccessor<RegimenDatabase>
    with _$WorkoutRepositoryMixin
    implements domain.WorkoutRepository {
  WorkoutRepository(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, List<WorkoutPresentationEntity>>>
      getWorkoutsForRegimenId(int regimenId) async {
    final workoutsMatchedQuery = select(workouts)
      ..where((workout) => workout.regimenId.equals(regimenId));
    return await Task(() async => await workoutsMatchedQuery
        .map((workout) => WorkoutPresentationEntity(
              workoutId: workout.id,
              ordinalDayOfWeekNumber: workout.dayNumber,
              ordinalWeekNumber: workout.weekNumber,
            ))
        .get()).attempt().mapLeftToFailure().run();
  }

  @override
  Future<Either<Failure, int>> setCompletionStatusForWorkout(
      {int workoutId, CompletionStatus completionStatus}) async {
    return await Task(() async => await (update(workouts)
              ..where((workout) => workout.id.equals(workoutId)))
            .write(
          WorkoutsCompanion(
            completionStatus: Value(completionStatus),
          ),
        )).attempt().mapLeftToFailure().run();
  }

  @override
  Future<Either<Failure, List<int>>> insertWorkouts(
      {List<WorkoutEntity> workoutEntities, int regimenId}) async {
    final companions = workoutEntities
        .map((workout) => WorkoutsCompanion(
              regimenId: Value(regimenId),
              dayNumber: Value(workout.ordinalDayOfWeekNumber),
              weekNumber: Value(workout.ordinalWeekNumber),
              description: Value(workout.description),
              startTime: Value(workout.time),
              completionStatus: Value(workout.completionStatus),
            ))
        .toList();
    return await Task(() async {
      final lastRowId = await transaction(() async {
        await batch((batch) {
          batch.insertAll(workouts, companions);
        });
        return (await customSelect(
          "SELECT last_insert_rowid()",
          readsFrom: {workouts},
        ).getSingle())
            .data
            .values
            .first as int;
      });
      return List.generate(companions.length, (i) => lastRowId - i);
    }).attempt().mapLeftToFailure().run();
  }
}
