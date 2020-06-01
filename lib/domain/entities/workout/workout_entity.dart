import 'package:flutter/material.dart';

import '../../../constant/completion_status.dart';
import '../exercise/exercise.dart';

const _defaultDescription = "A workout! What does it mean?";

/// A workout is a collection of exercises that occur in a single day.
class WorkoutEntity {
  final int workoutId;
  final List<ExerciseEntity> exercises;

  /// The time at which the workout occurs. Only omit initializing this
  /// value if there will be only one workout for the day in question.
  DateTime time;

  /// This is the day of the week on which the workout occurs.
  /// Examples: Day 1, Week 1; Day 4, Week 3;
  final int ordinalDayOfWeekNumber;

  /// This is the week on which the workout occurs.
  /// Examples: Day 1, Week 1; Day 4, Week 3;
  final int ordinalWeekNumber;

  /// A description of the workout.
  final String description;

  final CompletionStatus completionStatus;

  ///The total duration of all the exercises in a workout in seconds.
  int get totalDuration => exercises
      .map((exercise) => exercise.durationInSeconds)
      .reduce((totalDuration, durationInSeconds) =>
          totalDuration + durationInSeconds);

  WorkoutEntity({
    @required this.workoutId,
    @required this.exercises,
    @required this.ordinalDayOfWeekNumber,
    @required this.ordinalWeekNumber,
    this.time,
    this.description = _defaultDescription,
    this.completionStatus = CompletionStatus.notStarted,
  });
}
