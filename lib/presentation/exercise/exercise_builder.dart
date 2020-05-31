import 'exercise_action.dart';
import 'exercise.dart';

class ExerciseBuilder {
  List<ExerciseModel> _exercises = [];
  ExerciseModel _warmup;
  ExerciseModel _cooldown;
  ExerciseBuilder withWarmup(int durationInSeconds) {
    _warmup = ExerciseModel(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.warmup,
    );
    return this;
  }

  ExerciseBuilder withCooldown(int durationInSeconds) {
    _cooldown = ExerciseModel(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.cooldown,
    );
    return this;
  }

  ExerciseBuilder repeat(
      List<ExerciseModel> exercises, int repetitionsAfterFirst) {
    _exercises = [
      ...exercises,
      ...Iterable<int>.generate(repetitionsAfterFirst - 1)
          .fold(exercises, (alternations, _) => [...alternations, ...exercises])
    ];
    return this;
  }

  ExerciseBuilder addInOrder(ExerciseModel exercise) {
    _exercises.add(exercise);
    return this;
  }

  ExerciseBuilder addRangeInOrder(List<ExerciseModel> exercises) {
    _exercises.addAll(exercises);
    return this;
  }

  List<ExerciseModel> build() => [_warmup, ..._exercises, _cooldown]
      .where((exercise) => exercise != null)
      .toList(growable: false);
}
