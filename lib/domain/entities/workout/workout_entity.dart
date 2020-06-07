import 'package:better_c25k/domain/entities/workout/workout_presentation_entity.dart';
import 'package:flutter/material.dart';

import '../../../constant/completion_status.dart';
import '../exercise/exercise.dart';

/// A workout is a collection of exercises that occur in a single day.
class WorkoutEntity extends WorkoutPresentationEntity {
  final List<ExerciseEntity> exercises;

  ///The total duration of all the exercises in a workout in seconds.
  int get totalDuration => exercises
      .map((exercise) => exercise.durationInSeconds)
      .reduce((totalDuration, durationInSeconds) =>
          totalDuration + durationInSeconds);

  WorkoutEntity({
    @required int workoutId,
    @required this.exercises,
    @required int ordinalDayOfWeekNumber,
    @required int ordinalWeekNumber,
    DateTime time,
    String description,
    CompletionStatus completionStatus,
  }) : super(
          workoutId: workoutId,
          ordinalDayOfWeekNumber: ordinalDayOfWeekNumber,
          ordinalWeekNumber: ordinalWeekNumber,
          time: time,
          description: description,
          completionStatus: completionStatus,
        );
}
