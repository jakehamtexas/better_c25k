import 'package:flutter/material.dart';

import 'exercise/exercise.dart';

const _defaultDescription = "An exercise! What does it mean?";

/// A workout is a collection of exercises that occur in a single day.
class Workout {
  final List<Exercise> exercises;

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

  ///The total duration of all the exercises in a workout in seconds.
  int get totalDuration => exercises
      .map((exercise) => exercise.durationInSeconds)
      .reduce((totalDuration, durationInSeconds) =>
          totalDuration + durationInSeconds);

  Workout(
      {@required this.exercises,
      @required this.ordinalDayOfWeekNumber,
      @required this.ordinalWeekNumber,
      this.time,
      this.description = _defaultDescription});
}
