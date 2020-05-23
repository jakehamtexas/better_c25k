import 'package:flutter/material.dart';

import 'routes.dart';

import '../regimen/regimen.dart';
import '../home/home.dart';

final _home = (Object _args) => (BuildContext _) => Home();
final _regimen = (Object args) => (BuildContext _) => RegimenPage(args);

final Map<String, Widget Function(BuildContext) Function(Object)>
    routeBuilders = {Routes.home: _home, Routes.regimen: _regimen};
