import 'package:flutter/material.dart';

import '../../../constant/completion_status.dart';

const _defaultDescription = "A workout! What does it mean?";

/// A workout is a collection of exercises that occur in a single day.
class WorkoutPresentationEntity {
  final int workoutId;

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

  WorkoutPresentationEntity({
    @required this.workoutId,
    @required this.ordinalDayOfWeekNumber,
    @required this.ordinalWeekNumber,
    this.time,
    this.description = _defaultDescription,
    this.completionStatus = CompletionStatus.notStarted,
  });
}
