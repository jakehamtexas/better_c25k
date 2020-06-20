import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';
import '../entities/location/user_location.dart';

abstract class LocationService {
  Future<Either<Failure, UserLocation>> getLocation();
}
