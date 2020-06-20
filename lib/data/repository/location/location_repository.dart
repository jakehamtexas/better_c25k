import 'package:better_c25k/core/error/failure.dart';
import 'package:better_c25k/data/model/user_location_model.dart';
import 'package:better_c25k/domain/repository/location_service.dart';
import 'package:location/location.dart';
import 'package:dartz/dartz.dart';
import '../../../core/extension/dartz/dartz.dart';

class LocationRepository implements LocationService {
  @override
  Future<Either<Failure, UserLocationModel>> getLocation() async {
    return Task(() async {
      final locationData = await Location().getLocation();
      return UserLocationModel(
        latitude: locationData.latitude,
        longitude: locationData.longitude,
        time: DateTime.fromMillisecondsSinceEpoch(locationData.time.toInt()),
        speedInMetersPerSecond: locationData.speed,
      );
    }).attempt().mapLeftToFailure().run() as Either<Failure, UserLocationModel>;
  }
}
