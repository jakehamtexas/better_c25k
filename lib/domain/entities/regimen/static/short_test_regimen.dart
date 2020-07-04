import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/domain/entities/exercise/exercise.dart';
import 'package:better_c25k/domain/entities/regimen/regimen.dart';
import 'package:better_c25k/domain/entities/workout/workout.dart';

class ShortTestRegimen extends RegimenEntity {
  static String shortTestName = "Short Test Regimen";
  ShortTestRegimen()
      : super(
          workouts: _getShortTestWorkouts(),
          name: shortTestName,
        );
  static List<WorkoutEntity> _getShortTestWorkouts() => [
        WorkoutEntity(
          exercises: ExerciseBuilder()
              .withWarmup(5)
              .withCooldown(5)
              .addInOrder(
                const ExerciseEntity(
                  durationInSeconds: 5,
                  exerciseAction: ExerciseAction.run,
                ),
              )
              .build(),
          ordinalDayOfWeekNumber: 1,
          ordinalWeekNumber: 1,
          workoutId: 9999,
          description: "Short Test",
        )
      ].toList();
}
