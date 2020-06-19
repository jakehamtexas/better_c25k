import 'package:flutter/material.dart';

import '../presentation/router/route_generator.dart';

class BetterC25K extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const MaterialApp(
        title: "Better C25K",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
}
