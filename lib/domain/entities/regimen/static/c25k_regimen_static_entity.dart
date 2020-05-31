import 'package:flutter/material.dart';

import '../../../../constant/exercise_action.dart';
import '../../exercise/exercise.dart';
import '../../workout/workout.dart';
import '../regimen.dart';

class C25KRegimenStaticEntity extends RegimenEntity {
  static final c25kWorkouts = _getC25kWorkouts();
  C25KRegimenStaticEntity() : super(workouts: c25kWorkouts, name: "C25K");

  static Iterable<WorkoutEntity> _getC25kWorkouts() => [
        ..._getWeekOneWorkouts(),
        ..._getWeekTwoWorkouts(),
        ..._getWeekThreeWorkouts(),
        ..._getWeekFourWorkouts(),
        ..._getWeekFiveWorkouts(),
        ..._getWeekSixWorkouts(),
        ..._getWeekSevenWorkouts(),
        ..._getWeekEightWorkouts(),
      ];
  static Iterable<WorkoutEntity> _getWeekOneWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        ExerciseEntity(
          durationInSeconds: 60,
          exerciseAction: ExerciseAction.run,
        ),
        ExerciseEntity(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      7,
    ).build();
    const description =
        "Brisk five-minute warmup walk. Then alternate 60 seconds of jogging and 90 seconds of walking for a total of 20 minutes.";
    return _getAsCopies(
      description: description,
      exercises: exercises,
      ordinalWeekNumber: 1,
    );
  }

  static Iterable<WorkoutEntity> _getWeekTwoWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        ExerciseEntity(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.run,
        ),
        ExerciseEntity(
          durationInSeconds: 120,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      5,
    ).build();
    const description =
        "Brisk five-minute warmup walk. Then alternate 90 seconds of jogging and two minutes of walking for a total of 21 minutes.";
    return _getAsCopies(
      description: description,
      exercises: exercises,
      ordinalWeekNumber: 2,
    );
  }

  static Iterable<WorkoutEntity> _getWeekThreeWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).repeat(
      [
        ExerciseEntity(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.run,
        ),
        ExerciseEntity(
          durationInSeconds: 90,
          exerciseAction: ExerciseAction.walk,
        ),
        ExerciseEntity(
          durationInSeconds: 180,
          exerciseAction: ExerciseAction.run,
        ),
        ExerciseEntity(
          durationInSeconds: 180,
          exerciseAction: ExerciseAction.walk,
        ),
      ],
      1,
    ).build();
    const description =
        "Brisk five-minute warmup walk, then do two repetitions of the following: Jog for 90 secs; Walk for 90 secs; Jog for 3 mins; Walk for 3 mins.";
    return _getAsCopies(
      description: description,
      exercises: exercises,
      ordinalWeekNumber: 3,
    );
  }

  static Iterable<WorkoutEntity> _getWeekFourWorkouts() {
    final exercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).addRangeInOrder([
      ExerciseEntity(
        durationInSeconds: 180,
        exerciseAction: ExerciseAction.run,
      ),
      ExerciseEntity(
        durationInSeconds: 90,
        exerciseAction: ExerciseAction.walk,
      ),
      ExerciseEntity(
        durationInSeconds: 300,
        exerciseAction: ExerciseAction.run,
      ),
      ExerciseEntity(
        durationInSeconds: 150,
        exerciseAction: ExerciseAction.walk,
      ),
      ExerciseEntity(
        durationInSeconds: 180,
        exerciseAction: ExerciseAction.run,
      ),
      ExerciseEntity(
        durationInSeconds: 90,
        exerciseAction: ExerciseAction.walk,
      ),
      ExerciseEntity(
        durationInSeconds: 300,
        exerciseAction: ExerciseAction.walk,
      ),
    ]).build();
    const description =
        "Brisk five-minute warmup walk, then: Jog for 3 mins; Walk for 90 secs; Jog for 5 mins; Walk for 2.5 mins; Jog for 3 mins; Walk for 90 secs; Jog for 5 mins.";
    return _getAsCopies(
      description: description,
      exercises: exercises,
      ordinalWeekNumber: 4,
    );
  }

  static Iterable<WorkoutEntity> _getWeekFiveWorkouts() {
    final dayOneExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .repeat(
          [
            ExerciseEntity(
              durationInSeconds: 300,
              exerciseAction: ExerciseAction.run,
            ),
            ExerciseEntity(
              durationInSeconds: 180,
              exerciseAction: ExerciseAction.walk,
            ),
          ],
          1,
        )
        .addInOrder(ExerciseEntity(
            durationInSeconds: 300, exerciseAction: ExerciseAction.run))
        .build();
    const dayOneDescription =
        "Brisk five-minute warmup walk, then: Jog for 5 mins; Walk for 3 mins; Jog for 5 mins; Walk for 3 mins; Jog for 5 mins.";
    final dayOneWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 1,
      ordinalWeekNumber: 5,
      description: dayOneDescription,
      exercises: dayOneExercises,
    );

    final dayTwoExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(ExerciseEntity(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayTwoDescription =
        "Brisk five-minute warmup warlk, then: Jog 3/4 mile (or 8 minutes); Walk 1/2 mile (or 5 minutes); Jog 3/4 mile (or 8 minutes).";

    final dayTwoWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 2,
      ordinalWeekNumber: 5,
      description: dayTwoDescription,
      exercises: dayTwoExercises,
    );

    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(ExerciseEntity(
          durationInSeconds: 20 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayThreeDescription =
        "Brisk five-minute warmup walk, then jog two miles (or 20 minutes) with no walking.";
    final dayThreeWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 5,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );

    return [dayOneWorkout, dayTwoWorkout, dayThreeWorkout];
  }

  static Iterable<WorkoutEntity> _getWeekSixWorkouts() {
    final dayOneExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(ExerciseEntity(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 3 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 5 * 60,
          exerciseAction: ExerciseAction.walk,
        ))
        .addInOrder(ExerciseEntity(
          durationInSeconds: 8 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayOneDescription =
        "Brisk five-minute warmup walk, then: Jog for 5 mins; Walk for 3 mins; Jog for 5 mins; Walk for 3 mins; Jog for 5 mins.";
    final dayOneWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 1,
      ordinalWeekNumber: 6,
      description: dayOneDescription,
      exercises: dayOneExercises,
    );

    final dayTwoExercises =
        ExerciseBuilder().withWarmup(300).withCooldown(300).addRangeInOrder([
      ExerciseEntity(
        durationInSeconds: 10 * 60,
        exerciseAction: ExerciseAction.run,
      ),
      ExerciseEntity(
        durationInSeconds: 3 * 60,
        exerciseAction: ExerciseAction.walk,
      ),
      ExerciseEntity(
        durationInSeconds: 10 * 60,
        exerciseAction: ExerciseAction.run,
      )
    ]).build();

    const dayTwoDescription =
        "Brisk five-minute warmup walk, then: Jog 1 mile (or 10 minutes); Walk 1/4 mile (or 3 minutes); Jog 1 mile (or 10 minutes).";

    final dayTwoWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 2,
      ordinalWeekNumber: 6,
      description: dayTwoDescription,
      exercises: dayTwoExercises,
    );
    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(ExerciseEntity(
          durationInSeconds: 22 * 60,
          exerciseAction: ExerciseAction.run,
        ))
        .build();
    const dayThreeDescription =
        "Brisk five-minute warmup walk, then jog 2-1/4 miles (or 22 minutes) with no walking.";
    final dayThreeWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 6,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );

    return [dayOneWorkout, dayTwoWorkout, dayThreeWorkout];
  }

  static Iterable<WorkoutEntity> _getWeekSevenWorkouts() {
    final exercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          ExerciseEntity(
            durationInSeconds: 25 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const description =
        "Brisk five-minute warmup walk, then jog 2.5 miles (or 25 minutes).";
    return _getAsCopies(
      ordinalWeekNumber: 7,
      description: description,
      exercises: exercises,
    );
  }

  static Iterable<WorkoutEntity> _getWeekEightWorkouts() {
    final firstTwoDaysExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          ExerciseEntity(
            durationInSeconds: 28 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const firstTwoDaysDescription =
        "Brisk five-minute warmup walk, then jog 2.75 miles (or 28 minutes).";
    final firstTwoDaysWorkouts = _getAsCopies(
      description: firstTwoDaysDescription,
      exercises: firstTwoDaysExercises,
      ordinalWeekNumber: 8,
      numCopies: 2,
    );

    final dayThreeExercises = ExerciseBuilder()
        .withWarmup(300)
        .withCooldown(300)
        .addInOrder(
          ExerciseEntity(
            durationInSeconds: 30 * 60,
            exerciseAction: ExerciseAction.run,
          ),
        )
        .build();
    const dayThreeDescription =
        "The final workout! Congratulations! Brisk five-minute warmup walk, then jog 3 miles (or 30 minutes).";
    final dayThreeWorkout = WorkoutEntity(
      ordinalDayOfWeekNumber: 3,
      ordinalWeekNumber: 8,
      description: dayThreeDescription,
      exercises: dayThreeExercises,
    );
    return [...firstTwoDaysWorkouts, dayThreeWorkout];
  }

  static Iterable<WorkoutEntity> _getAsCopies({
    int numCopies = 3,
    @required int ordinalWeekNumber,
    @required String description,
    @required List<ExerciseEntity> exercises,
  }) =>
      Iterable<int>.generate(numCopies).map((index) => WorkoutEntity(
            ordinalDayOfWeekNumber: index + 1,
            ordinalWeekNumber: ordinalWeekNumber,
            description: description,
            exercises: exercises,
          ));
}
