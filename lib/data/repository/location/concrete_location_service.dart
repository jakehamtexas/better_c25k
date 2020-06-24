import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:location/location.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

import '../../../core/error/error.dart';
import '../../../domain/repository/location_service.dart';

class ConcreteLocationService implements LocationService {
  Location location;
  ConcreteLocationService() {
    location = Location();
  }

  @override
  Future<Either<Failure, StreamSubscription<LocationData>>>
      getSubscribtionToOnLoctionChangedStreamOrPermissionDeniedFailure(
          Future Function(LocationData) listenerCallback) async {
    var permissionStatus = await hasPermission();
    final subscription = location.onLocationChanged.listen(listenerCallback);
    if (permissionStatus == PermissionStatus.granted) {
      return right(subscription);
    } else if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await requestPermission();
      if (permissionStatus == PermissionStatus.granted) {
        return right(subscription);
      }
    }
    return left(LocationFailure.permissionDenied());
  }

  @override
  Future<PermissionStatus> hasPermission() => location.hasPermission();

  @override
  Future<PermissionStatus> requestPermission() => location.requestPermission();
}
