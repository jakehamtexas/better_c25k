import '../exercise/exercise.dart';

class WorkoutInProgressDTO {
  final List<ExerciseModel> exercises;
  final String workoutTitle;

  WorkoutInProgressDTO({this.exercises, this.workoutTitle});
}
