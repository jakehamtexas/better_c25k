import 'package:flutter_test/flutter_test.dart';

void main() {
  group("distance", () {
    test('should show correct distance', () {
      // arrange
      const firstLatLng = LatLngEntity();
      const secondLatLng = LatLngEntity();
      const matcher = 0;

      //act
      const actual = StatsEngine.getDistance(firstLatLng, secondLatLng);
      // assert
      expect(actual, matcher);
    });
  });
}
