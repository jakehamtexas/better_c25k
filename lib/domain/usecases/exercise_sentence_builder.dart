import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/domain/usecases/usecases.dart';

class ExerciseSentenceBuilder {
  ExerciseAction _exerciseAction;
  int _durationInSeconds;
  ExerciseSentenceBuilder withExercise(ExerciseAction exerciseAction) {
    _exerciseAction = exerciseAction;
    return this;
  }

  ExerciseSentenceBuilder withDuration(int durationInSeconds) {
    _durationInSeconds = durationInSeconds;
    return this;
  }

  String build() {
    switch (_exerciseAction) {
      case ExerciseAction.cooldown:
        return "begin your cooldown";
      case ExerciseAction.warmup:
        return "begin your warmup";
      case ExerciseAction.walk:
        break;
      case ExerciseAction.run:
        break;
    }
    final time = TimeDisplay.timeRemaining(_durationInSeconds ?? 0);
    final timeParts = time.split(TimeDisplay.timePartDelimiter);
    final timePartSuffixesByIndex = {
      0: "second",
      1: "minute",
      2: "hour",
    };
    final durationSpeech = timeParts.reversed
        .toList()
        .asMap()
        .entries
        .where(
          (timePartByIndex) => int.parse(timePartByIndex.value) != 0,
        )
        .map(
          (timePartByIndex) {
            final timePart = int.parse(timePartByIndex.value);
            final index = timePartByIndex.key;
            final isPlural = timePart != 1;
            final suffix = isPlural
                ? "${timePartSuffixesByIndex[index]}s"
                : timePartSuffixesByIndex[index];

            return "$timePart $suffix";
          },
        )
        .toList()
        .reversed
        .join(", ");
    return "${_exerciseAction.message} for $durationSpeech".toLowerCase();
  }
}
