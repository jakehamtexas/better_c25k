import 'dart:async';

import 'package:flutter/material.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

import '../../core/extension/dartz/dartz.dart';
import '../../core/extension/location/location.dart';
import '../repository/repository.dart';

class ContinuouslyInsertLocation {
  final UserLocationsRepository locationRepository;
  final LocationService locationService;

  StreamSubscription<LocationData> subscription;

  ContinuouslyInsertLocation({
    @required this.locationRepository,
    @required this.locationService,
  });

  Future<void> call(int workoutId) async {
    await _subscribeToOnLocationedChangedStream(workoutId);
  }

  Future _insertLocation(int workoutId, LocationData locationData) async {
    final locationIdOrFailure = await locationRepository.insertLocation(
      locationData.toEntity(),
      workoutId,
    );

    if (locationIdOrFailure.isLeft()) {
      // TODO: Add special failure type for location insertion failure
    }
  }

  Future<void> cancel() async {
    await subscription.cancel();
    subscription = null;
  }

  Future<void> resume(int workoutId) async {
    await _subscribeToOnLocationedChangedStream(workoutId);
  }

  Future<void> pause() async {
    await cancel();
  }

  Future<void> _subscribeToOnLocationedChangedStream(int workoutId) async {
    if (subscription == null) {
      final subscriptionToOnLocationChangedStreamOrPermissionDeniedFailure =
          await locationService
              .getSubscribtionToOnLoctionChangedStreamOrPermissionDeniedFailure(
        (LocationData locationData) => _insertLocation(workoutId, locationData),
      );
      if (subscriptionToOnLocationChangedStreamOrPermissionDeniedFailure
          .isLeft()) {
        return;
      }
      subscription =
          subscriptionToOnLocationChangedStreamOrPermissionDeniedFailure
              .getOrThrow();
    }
  }
}
