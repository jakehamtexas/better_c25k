import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../../core/error/failure.dart';
import '../../../core/extension/dartz/dartz.dart';
import '../../../domain/entities/exercise/exercise_entity.dart';
import '../../../domain/repository/exercise_repository.dart' as domain;
import '../../datasources/datasources.dart';

part 'exercise_repository.g.dart';

@UseDao(tables: [Exercises])
class ExerciseRepository extends DatabaseAccessor<RegimenDatabase>
    with _$ExerciseRepositoryMixin
    implements domain.ExerciseRepository {
  ExerciseRepository(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, List<int>>> insertExercisesByMap(
      Map<int, List<ExerciseEntity>> exerciseEntities) async {
    final companions = exerciseEntities.entries
        .map(
          (entry) => entry.value.map(
            (exercise) => ExercisesCompanion(
              durationInSeconds: Value(exercise.durationInSeconds),
              exerciseAction: Value(exercise.exerciseAction),
              workoutId: Value(entry.key),
            ),
          ),
        )
        .expand((_) => _)
        .toList();
    return await Task(() async {
      final lastRowId = await transaction(() async {
        await batch((batch) {
          batch.insertAll(exercises, companions);
        });
        return (await customSelect(
          "SELECT last_insert_rowid()",
          readsFrom: {exercises},
        ).getSingle())
            .data
            .values
            .first as int;
      });
      return List.generate(companions.length, (i) => lastRowId - i);
    }).attempt().mapLeftToFailure().run() as Either<Failure, List<int>>;
  }

  @override
  Future<Either<Failure, List<ExerciseEntity>>> getExercisesForWorkoutId(
    int workoutId,
  ) async {
    final query = select(exercises)
      ..where((exercise) => exercise.workoutId.equals(workoutId));
    return await Task(() => query
            .map((exercise) => ExerciseEntity(
                  durationInSeconds: exercise.durationInSeconds,
                  exerciseAction: exercise.exerciseAction,
                ))
            .get()).attempt().mapLeftToFailure().run()
        as Either<Failure, List<ExerciseEntity>>;
  }
}
