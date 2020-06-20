import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';
import '../../data/model/user_location_model.dart';
import 'package:location/location.dart';

abstract class LocationService {
  Location location;
  Future<Either<Failure, UserLocationModel>> getLocation();
}
