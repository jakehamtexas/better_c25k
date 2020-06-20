import 'package:better_c25k/domain/entities/location/user_location_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/error/error.dart';
import '../../core/extension/dartz/dartz.dart';
import '../repository/repository.dart';

class InsertLocation {
  final UserLocationsRepository locationRepository;
  final LocationService locationService;
  const InsertLocation({
    @required this.locationRepository,
    @required this.locationService,
  });
// TODO: Refactor to follow format used in insert_regimen.dart
  Future<Either<Failure, int>> call(int workoutId) async {
    final userLocationOrFailure = await locationService.getLocation();
    if (userLocationOrFailure.isLeft()) {
      // TODO: Add special failure type for location get failure
    }
    final userLocation = userLocationOrFailure.getOrThrow();
    final locationIdOrFailure = await locationRepository.insertLocation(
      UserLocationEntity.fromModel(userLocation),
      workoutId,
    );

    if (locationIdOrFailure.isLeft()) {
      // TODO: Add special failure type for location insertion failure
    }

    return locationIdOrFailure;
  }
}
