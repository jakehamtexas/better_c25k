import '../exercise/exercise.dart';

class WorkoutInProgressEntity {
  final List<ExerciseEntity> exercises;
  final String workoutTitle;

  WorkoutInProgressEntity({this.exercises, this.workoutTitle});
}
