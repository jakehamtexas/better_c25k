import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';
import '../entities/exercise/exercise.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<ExerciseEntity>>> getExercisesForWorkoutId(
    int workoutId,
  );
  Future<Either<Failure, List<int>>> insertExercisesByMap(
    Map<int, List<ExerciseEntity>> exerciseEntities,
  );
}
