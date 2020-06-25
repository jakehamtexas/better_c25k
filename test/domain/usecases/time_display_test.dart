import 'package:better_c25k/domain/usecases/usecases.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("timeremaining", () {
    test('should have form 00:00 when 0 seconds as input', () {
      // arrange
      const matcher = "00:00";
      const input = 0;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 00:01 when 1 second as input', () {
      // arrange
      const matcher = "00:01";
      const input = 1;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 00:02 when 2 second as input', () {
      // arrange
      const matcher = "00:02";
      const input = 2;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 00:10 when 10 second as input', () {
      // arrange
      const matcher = "00:10";
      const input = 10;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 01:00 when 60 second as input', () {
      // arrange
      const matcher = "01:00";
      const input = 60;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 1:00:00 when one hour as input', () {
      // arrange
      const matcher = "1:00:00";
      const input = 60 * 60;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });

    test('should have form 10:00:00 when ten hours as input', () {
      // arrange
      const matcher = "10:00:00";
      const input = 60 * 60 * 10;

      // act
      final actual = TimeDisplay.timeRemaining(input);

      // assert
      expect(actual, matcher);
    });
  });
}
