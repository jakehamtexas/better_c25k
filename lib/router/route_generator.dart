import 'package:flutter/material.dart';

import 'error_route.dart';
import 'routes.dart';

class RouteGenerator {
  static Widget Function(BuildContext) _getBuilder(RouteSettings settings) =>
      routes[settings.name](settings.arguments);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      final builder = _getBuilder(settings);
      return MaterialPageRoute(builder: builder);
    } catch (_) {
      return errorRoute();
    }
  }
}
