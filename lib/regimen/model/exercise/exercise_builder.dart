import 'exercise_action.dart';
import 'exercise.dart';

class ExerciseBuilder {
  List<Exercise> exercises = [];
  Exercise warmup;
  Exercise cooldown;
  ExerciseBuilder withWarmup(int durationInSeconds) {
    warmup = Exercise(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.warmup,
    );
    return this;
  }

  ExerciseBuilder withCooldown(int durationInSeconds) {
    cooldown = Exercise(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.cooldown,
    );
    return this;
  }

  ExerciseBuilder repeat(List<Exercise> exercises, int repetitionsAfterFirst) {
    exercises = [
      ...exercises,
      ...Iterable<int>.generate(repetitionsAfterFirst - 1)
          .fold(exercises, (alternations, _) => [...alternations, ...exercises])
    ];
    return this;
  }

  ExerciseBuilder addInOrder(Exercise exercise) {
    exercises.add(exercise);
    return this;
  }

  ExerciseBuilder addRangeInOrder(List<Exercise> exercises) {
    exercises.addAll(exercises);
    return this;
  }

  List<Exercise> build() => [warmup, ...exercises, cooldown]
      .where((exercise) => exercise != null)
      .toList(growable: false);
}
