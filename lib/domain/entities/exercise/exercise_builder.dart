import '../../../constant/exercise_action.dart';
import 'exercise.dart';

class ExerciseBuilder {
  List<ExerciseEntity> _exercises = [];
  ExerciseEntity _warmup;
  ExerciseEntity _cooldown;
  ExerciseBuilder withWarmup(int durationInSeconds) {
    _warmup = ExerciseEntity(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.warmup,
    );
    return this;
  }

  ExerciseBuilder withCooldown(int durationInSeconds) {
    _cooldown = ExerciseEntity(
      durationInSeconds: durationInSeconds,
      exerciseAction: ExerciseAction.cooldown,
    );
    return this;
  }

  ExerciseBuilder repeat(
      List<ExerciseEntity> exercises, int repetitionsAfterFirst) {
    _exercises = [
      ...exercises,
      ...Iterable<int>.generate(repetitionsAfterFirst - 1)
          .fold(exercises, (alternations, _) => [...alternations, ...exercises])
    ];
    return this;
  }

  ExerciseBuilder addInOrder(ExerciseEntity exercise) {
    _exercises.add(exercise);
    return this;
  }

  ExerciseBuilder addRangeInOrder(List<ExerciseEntity> exercises) {
    _exercises.addAll(exercises);
    return this;
  }

  List<ExerciseEntity> build() => [_warmup, ..._exercises, _cooldown]
      .where((exercise) => exercise != null)
      .toList(growable: false);
}
