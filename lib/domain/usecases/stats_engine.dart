import 'dart:math';

import '../entities/stats/lat_lng_entity.dart';

class StatsEngine {
  static const distanceSigFigNum = 2;
  static double getDistance(LatLngEntity first, LatLngEntity second) {
    // Spherical Law of Cosines
    // https://www.movable-type.co.uk/scripts/latlong.html

    final phiOne = first.latitude * pi / 180;
    final phiTwo = second.latitude * pi / 180;
    final deltaLambda = (second.longitude - first.longitude) * pi / 180;
    const radiusInMeters = 6371e3;

    final distance = acos(
          sin(phiOne) * sin(phiTwo) +
              cos(phiOne) * cos(phiTwo) * cos(deltaLambda),
        ) *
        radiusInMeters;

    return double.parse(distance.toStringAsFixed(distanceSigFigNum));
  }
}
