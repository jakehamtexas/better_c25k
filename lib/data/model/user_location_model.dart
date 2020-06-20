import 'package:flutter/foundation.dart';

import '../../domain/entities/location/user_location_entity.dart';

class UserLocationModel {
  final double latitude;
  final double longitude;
  final double speedInMetersPerSecond;
  final DateTime time;
  UserLocationModel({
    @required this.latitude,
    @required this.longitude,
    @required this.speedInMetersPerSecond,
    @required this.time,
  });

  factory UserLocationModel.fromEntity(UserLocationEntity entity) =>
      UserLocationModel(
        latitude: entity.latitude,
        longitude: entity.longitude,
        speedInMetersPerSecond: entity.speedInMetersPerSecond,
        time: entity.time,
      );
}
