import 'package:flutter/material.dart';

import 'services.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String flavorName;
  final bool isDev;

  AppConfig({
    @required this.appName,
    @required this.flavorName,
    @required this.isDev,
    @required Widget child,
  }) : super(child: child) {
    _startApplication();
  }

  static AppConfig of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  void _startApplication() {
    Services.register();
  }
}
