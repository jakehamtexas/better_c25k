import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../domain/entities/location/user_location_entity.dart';
import '../../../domain/usecases/usecases.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => MapLoadingState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    switch (event.runtimeType) {
      case BeginMapLoadEvent:
        yield* _beginMapLoad((event as BeginMapLoadEvent).exerciseId);
        break;
      case MapLoadNetworkFailureEvent:
        yield NetworkErrorState();
        break;
      case MapLoadSuccessEvent:
        yield MapLoadedState((event as MapLoadSuccessEvent).polylines);
        break;
    }
  }

  Stream<MapState> _beginMapLoad(int workoutId) async* {
    final userLocationsOrFailure =
        await GetIt.I<GetLocationDataForWorkout>()(workoutId);

    yield userLocationsOrFailure.fold((failure) => NetworkErrorState(),
        (userLocations) {
      final polylines = _getPolylines(userLocations);
      return MapLoadedState(polylines);
    });
  }

  Set<Polyline> _getPolylines(List<UserLocationEntity> userLocations) {
    final points = userLocations
        .map(
          (userLocation) => LatLng(
            userLocation.latitude,
            userLocation.longitude,
          ),
        )
        .toList();
    final polyline = Polyline(polylineId: PolylineId("poly"), points: points);
    return {polyline};
  }
}
