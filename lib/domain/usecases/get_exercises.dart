import '../../core/error/error.dart';
import '../entities/exercise/exercise.dart';
import 'package:dartz/dartz.dart';
import '../repository/repository.dart';

class GetExercises {
  final ExerciseRepository exerciseRepository;

  GetExercises(this.exerciseRepository);
  Future<Either<Failure, List<ExerciseEntity>>> call(int workoutId) async {
    return await exerciseRepository.getExercisesForWorkoutId(workoutId);
  }
}
