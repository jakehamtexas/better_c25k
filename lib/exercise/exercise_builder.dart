import 'exercise_action.dart';
import 'exercise.dart';

class ExerciseBuilder {
  List<ExerciseModel> exercises = [];
  ExerciseModel warmup;
  ExerciseModel cooldown;
  ExerciseBuilder withWarmup(int durationInSeconds) {
    warmup = ExerciseModel(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.warmup,
    );
    return this;
  }

  ExerciseBuilder withCooldown(int durationInSeconds) {
    cooldown = ExerciseModel(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.cooldown,
    );
    return this;
  }

  ExerciseBuilder repeat(List<ExerciseModel> exercises, int repetitionsAfterFirst) {
    exercises = [
      ...exercises,
      ...Iterable<int>.generate(repetitionsAfterFirst - 1)
          .fold(exercises, (alternations, _) => [...alternations, ...exercises])
    ];
    return this;
  }

  ExerciseBuilder addInOrder(ExerciseModel exercise) {
    exercises.add(exercise);
    return this;
  }

  ExerciseBuilder addRangeInOrder(List<ExerciseModel> exercises) {
    exercises.addAll(exercises);
    return this;
  }

  List<ExerciseModel> build() => [warmup, ...exercises, cooldown]
      .where((exercise) => exercise != null)
      .toList(growable: false);
}
