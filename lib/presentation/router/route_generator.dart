import 'package:flutter/material.dart';

import 'error_route.dart';
import 'route_builders.dart';

class RouteGenerator {
  static Widget Function(BuildContext) _getBuilder(RouteSettings settings) =>
      routeBuilders[settings.name](settings.arguments);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    try {
      final builder = _getBuilder(settings);
      return PageRouteBuilder(
        pageBuilder: (context, _, __) => builder(context),
        transitionDuration: const Duration(),
      );
    } catch (_) {
      return errorRoute();
    }
  }
}
