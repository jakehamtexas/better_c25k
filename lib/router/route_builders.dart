import 'package:flutter/material.dart';

import 'routes.dart';

import '../workout/workout.dart';
import '../home/home.dart';

final _home = (Object _args) => (BuildContext _) => Home();
final _workout = (Object args) => (BuildContext _) => Workout(args);

final Map<String, Widget Function(BuildContext) Function(Object)>
    routeBuilders = {Routes.home: _home, Routes.workout: _workout};
