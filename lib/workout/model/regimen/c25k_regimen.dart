import '../workout.dart';
import '../exercise/exercise.dart';
import '../exercise/exercise_builder.dart';
import '../exercise/exercise_action.dart';
import 'regimen.dart';

class C25KRegimen extends Regimen {
  static final c25kWorkouts = _getC25kWorkouts();
  C25KRegimen() : super(c25kWorkouts);

  static Iterable<Workout> _getC25kWorkouts() => [
        ..._getWeekOneWorkouts(),
        ..._getWeekTwoWorkouts(),
        ..._getWeekThreeWorkouts(),
        ..._getWeekFourWorkouts(),
        ..._getWeekFiveWorkouts(),
        ..._getWeekSixWorkouts(),
        ..._getWeekSevenWorkouts(),
        ..._getWeekEightWorkouts(),
      ];
  static Iterable<Workout> _getWeekOneWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        Exercise(
          durationInSeconds: 60,
          exerciseAction: ExerciseAction.run,
        ),
        Exercise(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      7,
    ).build();
    const description =
        "Brisk five-minute warmup walk. Then alternate 60 seconds of jogging and 90 seconds of walking for a total of 20 minutes.";
    return Iterable<int>.generate(2).map((index) => Workout(
          ordinalDayOfWeekNumber: index + 1,
          ordinalWeekNumber: 1,
          description: description,
          exercises: exercises,
        ));
  }

  static Iterable<Workout> _getWeekTwoWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        Exercise(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.run,
        ),
        Exercise(
          durationInSeconds: 120,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      5,
    ).build();
    const description =
        "Brisk five-minute warmup walk. Then alternate 90 seconds of jogging and two minutes of walking for a total of 21 minutes.";
    return Iterable<int>.generate(2).map((index) => Workout(
          ordinalDayOfWeekNumber: index + 1,
          ordinalWeekNumber: 2,
          description: description,
          exercises: exercises,
        ));
  }

  static Iterable<Workout> _getWeekThreeWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        Exercise(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.run,
        ),
        Exercise(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.walk,
        ),
        Exercise(
          durationInSeconds: 180,
          exerciseAction: ExerciseAction.run,
        ),
        Exercise(
          durationInSeconds: 180,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      1,
    ).build();
    const description =
        "Brisk five-minute warmup walk, then do two repetitions of the following: Jog for 90 secs; Walk for 90 secs; Jog for 3 mins; Walk for 3 mins.";
    return Iterable<int>.generate(2).map((index) => Workout(
          ordinalDayOfWeekNumber: index + 1,
          ordinalWeekNumber: 3,
          description: description,
          exercises: exercises,
        ));
  }

  static Iterable<Workout> _getWeekFourWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).addRangeInOrder([
      Exercise(
        durationInSeconds: 180,
        exerciseAction: ExerciseAction.run,
      ),
      Exercise(
        durationInSeconds: 90,
        exerciseAction: ExerciseAction.walk,
      ),
      Exercise(
        durationInSeconds: 300,
        exerciseAction: ExerciseAction.run,
      ),
      Exercise(
        durationInSeconds: 150,
        exerciseAction: ExerciseAction.walk,
      ),
      Exercise(
        durationInSeconds: 180,
        exerciseAction: ExerciseAction.run,
      ),
      Exercise(
        durationInSeconds: 90,
        exerciseAction: ExerciseAction.walk,
      ),
      Exercise(
        durationInSeconds: 300,
        exerciseAction: ExerciseAction.walk,
      ),
    ]).build();
    const description =
        "Brisk five-minute warmup walk, then: Jog for 3 mins; Walk for 90 secs; Jog for 5 mins; Walk for 2.5 mins; Jog for 3 mins; Walk for 90 secs; Jog for 5 mins.";
    return Iterable<int>.generate(2).map((index) => Workout(
          ordinalDayOfWeekNumber: index + 1,
          ordinalWeekNumber: 4,
          description: description,
          exercises: exercises,
        ));
  }

  static Iterable<Workout> _getWeekFiveWorkouts() {
    final dayOneExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .repeat(
          [
            Exercise(
              durationInSeconds: 300,
              exerciseAction: ExerciseAction.run,
            ),
            Exercise(
              durationInSeconds: 180,
              exerciseAction: ExerciseAction.walk,
            ),
          ],
          1,
        )
        .addInOrder(Exercise(
            durationInSeconds: 300, exerciseAction: ExerciseAction.run))
        .build();
    const dayOneDescription =
        "Brisk five-minute warmup walk, then: Jog for 5 mins; Walk for 3 mins; Jog for 5 mins; Walk for 3 mins; Jog for 5 mins.";
    final dayOneWorkout = Workout(
      ordinalDayOfWeekNumber: 1,
      ordinalWeekNumber: 5,
      description: dayOneDescription,
      exercises: dayOneExercises,
    );

    final dayTwoExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(Exercise(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayTwoDescription =
        "Brisk five-minute warmup warlk, then: Jog 3/4 mile (or 8 minutes); Walk 1/2 mile (or 5 minutes); Jog 3/4 mile (or 8 minutes).";

    final dayTwoWorkout = Workout(
      ordinalDayOfWeekNumber: 2,
      ordinalWeekNumber: 5,
      description: dayTwoDescription,
      exercises: dayTwoExercises,
    );

    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(Exercise(
          durationInSeconds: 20 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayThreeDescription =
        "Brisk five-minute warmup walk, then jog two miles (or 20 minutes) with no walking.";
    final dayThreeWorkout = Workout(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 5,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );

    return [dayOneWorkout, dayTwoWorkout, dayThreeWorkout];
  }

  static Iterable<Workout> _getWeekSixWorkouts() {
    final dayOneExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(Exercise(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 3 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(Exercise(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayOneDescription =
        "Brisk five-minute warmup walk, then: Jog for 5 mins; Walk for 3 mins; Jog for 5 mins; Walk for 3 mins; Jog for 5 mins.";
    final dayOneWorkout = Workout(
      ordinalDayOfWeekNumber: 1,
      ordinalWeekNumber: 6,
      description: dayOneDescription,
      exercises: dayOneExercises,
    );

    final dayTwoExercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).addRangeInOrder([
      Exercise(
        durationInSeconds: 10 * 60,
        exerciseAction: ExerciseAction.run,
      ),
      Exercise(
        durationInSeconds: 3 * 60,
        exerciseAction: ExerciseAction.walk,
      ),
      Exercise(
        durationInSeconds: 10 * 60,
        exerciseAction: ExerciseAction.run,
      )
    ]).build();

    const dayTwoDescription =
        "Brisk five-minute warmup walk, then: Jog 1 mile (or 10 minutes); Walk 1/4 mile (or 3 minutes); Jog 1 mile (or 10 minutes).";

    final dayTwoWorkout = Workout(
      ordinalDayOfWeekNumber: 2,
      ordinalWeekNumber: 6,
      description: dayTwoDescription,
      exercises: dayTwoExercises,
    );
    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(Exercise(
          durationInSeconds: 22 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayThreeDescription =
        "Brisk five-minute warmup walk, then jog 2-1/4 miles (or 22 minutes) with no walking.";
    final dayThreeWorkout = Workout(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 6,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );

    return [dayOneWorkout, dayTwoWorkout, dayThreeWorkout];
  }

  static Iterable<Workout> _getWeekSevenWorkouts() {
    final exercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          Exercise(
            durationInSeconds: 25 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const description =
        "Brisk five-minute warmup walk, then jog 2.5 miles (or 25 minutes).";
    return Iterable<int>.generate(2).map((index) => Workout(
          ordinalDayOfWeekNumber: index + 1,
          ordinalWeekNumber: 7,
          description: description,
          exercises: exercises,
        ));
  }

  static Iterable<Workout> _getWeekEightWorkouts() {
    final firstTwoDaysExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          Exercise(
            durationInSeconds: 28 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const firstTwoDaysDescription =
        "Brisk five-minute warmup walk, then jog 2.75 miles (or 28 minutes).";
    final firstTwoDaysWorkouts =
        Iterable<int>.generate(1).map((index) => Workout(
              ordinalDayOfWeekNumber: index + 1,
              ordinalWeekNumber: 8,
              description: firstTwoDaysDescription,
              exercises: firstTwoDaysExercises,
            ));

    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          Exercise(
            durationInSeconds: 30 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const dayThreeDescription =
        "The final workout! Congratulations! Brisk five-minute warmup walk, then jog 3 miles (or 30 minutes).";
    final dayThreeWorkout = Workout(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 8,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );
    return [...firstTwoDaysWorkouts, dayThreeWorkout];
  }
}
