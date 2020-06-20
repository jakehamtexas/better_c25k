import 'package:flutter/foundation.dart';

import '../../../data/model/user_location_model.dart';

class UserLocationEntity {
  final double latitude;
  final double longitude;
  final double speedInMetersPerSecond;
  final DateTime time;
  const UserLocationEntity({
    @required this.latitude,
    @required this.longitude,
    @required this.speedInMetersPerSecond,
    @required this.time,
  });

  factory UserLocationEntity.fromModel(UserLocationModel model) =>
      UserLocationEntity(
        latitude: model.latitude,
        longitude: model.longitude,
        speedInMetersPerSecond: model.speedInMetersPerSecond,
        time: model.time,
      );
}
