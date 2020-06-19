import 'package:flutter/material.dart';

import '../../core/error/error.dart';
import '../../domain/entities/common/common.dart';
import '../../domain/entities/workout_in_progress/workout_in_progress.dart';
import '../../presentation/home/home.dart';
import '../../presentation/regimen/regimen.dart';
import '../../presentation/regimen/workout/workout_in_progress/workout_completed/workout_completed.dart';
import '../../presentation/regimen/workout/workout_in_progress/workout_in_progress.dart';
import '../error/error.dart';
import 'routes.dart';

ErrorPage Function(BuildContext _) _error(Object failure) =>
    (BuildContext _) => ErrorPage(failure as Failure);

Home Function(BuildContext _) _home(Object _args) => (BuildContext _) => Home();

RegimenPage Function(BuildContext _) _regimen(Object nameAndId) =>
    (BuildContext _) => RegimenPage(nameAndId as NameAndId<int>);

WorkoutInProgressPage Function(BuildContext _) _doWorkout(
        Object workoutInProgressEntity) =>
    (BuildContext _) => WorkoutInProgressPage(
        workoutInProgressEntity as WorkoutInProgressEntity);

WorkoutCompletedPage Function(BuildContext _) _workoutComplete(Object args) =>
    (BuildContext _) => WorkoutCompletedPage();

final Map<String, Widget Function(BuildContext) Function(Object)>
    routeBuilders = {
  Routes.error: _error,
  Routes.home: _home,
  Routes.regimen: _regimen,
  Routes.doWorkout: _doWorkout,
  Routes.workoutComplete: _workoutComplete,
};
