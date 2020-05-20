import 'package:flutter/material.dart';

import './router/route_generator.dart';

void main() => runApp(BetterC25K());

class BetterC25K extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Better C25K",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      );
}
