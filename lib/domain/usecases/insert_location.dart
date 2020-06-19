import 'package:flutter/material.dart';

import '../repository/repository.dart';

class InsertLocation {
  const InsertLocation({
    @required LocationRepository locationRepository,
    @required LocationService locationService,
  });

  call(int workoutId) {}
}
