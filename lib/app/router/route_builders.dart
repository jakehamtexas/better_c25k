import 'package:flutter/material.dart';

import '../../presentation/home/home.dart';
import '../../presentation/regimen/regimen.dart';
import '../../presentation/regimen/workout/workout_in_progress/workout_completed/workout_completed.dart';
import '../../presentation/regimen/workout/workout_in_progress/workout_in_progress.dart';
import 'routes.dart';

final _home = (Object _args) => (BuildContext _) => Home();
final _regimen = (Object args) => (BuildContext _) => RegimenPage(args);
final _doWorkout =
    (Object args) => (BuildContext _) => WorkoutInProgressPage(args);
final _workoutComplete =
    (Object args) => (BuildContext _) => WorkoutCompletedPage();

final Map<String, Widget Function(BuildContext) Function(Object)>
    routeBuilders = {
  Routes.home: _home,
  Routes.regimen: _regimen,
  Routes.doWorkout: _doWorkout,
  Routes.workoutComplete: _workoutComplete,
};
