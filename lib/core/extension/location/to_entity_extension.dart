import 'package:location/location.dart';

import '../../../domain/entities/location/user_location_entity.dart';

extension ToEntityExtension on LocationData {
  UserLocationEntity toEntity() => UserLocationEntity(
        latitude: latitude,
        longitude: longitude,
        speedInMetersPerSecond: speed,
        time: DateTime.fromMillisecondsSinceEpoch(time.round()),
      );
}
