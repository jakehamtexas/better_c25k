import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';

bool _getHasWord(String sentence, String word) =>
    sentence.split(' ').any((w) => w == word);
void main() {
  group("exercise type", () {
    test('should contain "walk" when exercise is walk', () {
      // arrange
      const pattern = "walk";
      const input = ExerciseAction.walk;

      // act
      final String actual =
          ExerciseSentenceBuilder().withExercise(input).build();

      // assert
      assert(_getHasWord(actual, pattern));
    });

    test('should contain "run" when exercise is run', () {
      // arrange
      const pattern = "run";
      const input = ExerciseAction.run;

      // act
      final String actual =
          ExerciseSentenceBuilder().withExercise(input).build();

      // assert
      assert(_getHasWord(actual, pattern));
    });

    test('should contain "cooldown" when exercise is cooldown', () {
      // arrange
      const pattern = "cooldown";
      const input = ExerciseAction.cooldown;

      // act
      final String actual =
          ExerciseSentenceBuilder().withExercise(input).build();

      // assert
      assert(_getHasWord(actual, pattern));
    });
  });
  group("duration", () {
    test('should contain "1 second" when duration is one second', () {
      const pattern = "1 second";
      const input = 1;

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(input).build();

      // assert
      assert(actual.contains(pattern));
    });

    test('should contain "1 minute" when duration is one minute', () {
      const pattern = "1 minute";
      const duration = 60;

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(duration).build();

      // assert
      assert(actual.contains(pattern));
    });
    test('should contain "1 hour, 1 minute" when duration is 1 hour 1 minute',
        () {
      const pattern = "1 hour, 1 minute";
      const duration = 60 + (60 * 60);

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(duration).build();

      // assert
      assert(actual.contains(pattern));
    });

    test(
        'should contain "30 minutes, 10 seconds" when duration is 30 minutes, 10 seconds',
        () {
      const pattern = "30 minutes, 10 seconds";
      const duration = 10 + (60 * 30);

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(duration).build();

      // assert
      assert(actual.contains(pattern));
    });

    test(
        'should contain "2 hours, 20 minutes, 1 second" when duration is 2 hours, 20 minutes, 1 second',
        () {
      const pattern = "2 hours, 20 minutes, 1 second";
      const duration = 1 + (60 * 20) + (60 * 60 * 2);

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(duration).build();

      // assert
      assert(actual.contains(pattern));
    });

    test(
        'should contain "2 hours, 1 second" when duration is 2 hours, 1 second',
        () {
      const pattern = "2 hours, 1 second";
      const duration = 1 + (60 * 60 * 2);

      // act
      final String actual =
          ExerciseSentenceBuilder().withDuration(duration).build();

      // assert
      assert(actual.contains(pattern));
    });
  });

  group(
    "combination",
    () {
      test(
        'should exactly equal "run for 1 minute." when exercise is run and duration is one minute',
        () {
          const matcher = "run for 1 minute";
          const input = 60;

          // act
          final String actual = ExerciseSentenceBuilder()
              .withExercise(ExerciseAction.run)
              .withDuration(input)
              .build();

          // assert
          expect(actual, matcher);
        },
      );
    },
  );

  group('special', () {
    test(
        'if the exercise is a warmup, the text should exactly be "begin your warmup"',
        () {
      const matcher = "begin your warmup";
      const input = ExerciseAction.warmup;

      // act458
      final String actual =
          ExerciseSentenceBuilder().withExercise(input).build();

      // assert
      expect(actual, matcher);
    });

    test(
        'if the exercise is a cooldown, the text should exactly be "begin your cooldown',
        () {
      // arrange
      const matcher = "begin your cooldown";
      const input = ExerciseAction.cooldown;

      // act
      final String actual =
          ExerciseSentenceBuilder().withExercise(input).build();

      // assert
      expect(actual, matcher);
    });
  });
}
