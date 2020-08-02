import 'package:better_c25k/domain/entities/stats/lat_lng_entity.dart';
import 'package:better_c25k/domain/usecases/stats_engine.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("distance", () {
    test('should show 0 distance when no difference', () {
      // arrange
      const firstLatLng = LatLngEntity(latitude: 0, longitude: 0);
      const secondLatLng = LatLngEntity(latitude: 0, longitude: 0);
      const matcher = 0;

      //act
      final actual = StatsEngine.getDistance(firstLatLng, secondLatLng);
      // assert
      expect(actual, matcher);
    });

    test(
        'should show correct distance rounded to two decimal places in meters when difference of 1 long',
        () {
      // arrange
      const firstLatLng = LatLngEntity(latitude: 0, longitude: 0);
      const secondLatLng = LatLngEntity(latitude: 0, longitude: 1);
      const matcher = 111194.93;

      //act
      final actual = StatsEngine.getDistance(firstLatLng, secondLatLng);
      // assert
      expect(actual, matcher);
    });
  });
}
