import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:location_platform_interface/location_platform_interface.dart';

import '../../core/error/error.dart';
import '../../domain/repository/repository.dart';
import '../../domain/usecases/insert_location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  @override
  LocationState get initialState => LocationInitial();

  final LocationService locationService;
  final UserLocationsRepository locationRepository;

  LocationBloc({
    this.locationService,
    this.locationRepository,
  });

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is AddLocationDataForWorkoutEvent) {
      final locationDataAddedOrFailure =
          await _addLocationDataForWorkoutEvent(event.workoutId);
      locationDataAddedOrFailure.fold(
        (failure) => LocationDataAddedFailureState(failure),
        (_id) => LocationDataAddedSuccessState(),
      );
    }
  }

  Future<Either<Failure, int>> _addLocationDataForWorkoutEvent(
    int workoutId,
  ) async {
    final permissionStatus = await locationService.location.requestPermission();

    switch (permissionStatus) {
      case PermissionStatus.granted:
        final usecase = InsertLocation(
          locationService: locationService,
          locationRepository: locationRepository,
        );
        return usecase(workoutId);
        // TODO: Handle this case.
        break;
      case PermissionStatus.denied:
        // TODO: Add special failure for denied
        return left(null);
      case PermissionStatus.deniedForever:
        // TODO: Add special failure for denied
        return left(null);
      default:
        return left(null);
    }
  }
}
