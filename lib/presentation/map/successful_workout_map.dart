import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SuccessfulWorkoutMap extends StatelessWidget {
  LatLng get _lastPosition => _polylines.last.points.last;

  Set<Marker> get _firstAndLastPositionMarkers => {
        Marker(
          position: _polylines.first.points.first,
          markerId: MarkerId("start"),
        ),
        Marker(
          position: _lastPosition,
          markerId: MarkerId("end"),
        ),
      };
  final Set<Polyline> _polylines;
  SuccessfulWorkoutMap(
    this._polylines, {
    Key key,
  }) : super(key: key);

  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      tiltGesturesEnabled: false,
      markers: _firstAndLastPositionMarkers,
      polylines: _polylines,
      mapType: MapType.normal,
      onMapCreated: (controller) {
        _controller.complete(controller);
      },
      initialCameraPosition: _initialCameraPosition(),
    );
  }

  CameraPosition _initialCameraPosition() {
    const streetLevelZoom = 15.0;
    return CameraPosition(
      target: _lastPosition,
      zoom: streetLevelZoom,
    );
  }
}
