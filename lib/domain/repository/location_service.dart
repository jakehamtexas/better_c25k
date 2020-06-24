import 'dart:async';

import 'package:better_c25k/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:location/location.dart';

abstract class LocationService {
  Future<PermissionStatus> requestPermission();
  Future<PermissionStatus> hasPermission();
  Future<Either<Failure, StreamSubscription<LocationData>>>
      getSubscribtionToOnLoctionChangedStreamOrPermissionDeniedFailure(
    Future Function(LocationData) listenerCallback,
  );
}
