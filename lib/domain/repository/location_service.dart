import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';
import '../../data/model/user_location_model.dart';

abstract class LocationService {
  Future<Either<Failure, UserLocationModel>> getLocation();
}
