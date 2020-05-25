import 'package:flutter/material.dart';

import '../home/home.dart';
import '../regimen/regimen.dart';
import '../workout_in_progress/workout_in_progress.dart';
import 'routes.dart';

final _home = (Object _args) => (BuildContext _) => Home();
final _regimen = (Object args) => (BuildContext _) => RegimenPage(args);
final _doWorkout =
    (Object args) => (BuildContext _) => WorkoutInProgressPage(args);

final Map<String, Widget Function(BuildContext) Function(Object)>
    routeBuilders = {
  Routes.home: _home,
  Routes.regimen: _regimen,
  Routes.doWorkout: _doWorkout,
};
