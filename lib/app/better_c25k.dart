import 'package:flutter/material.dart';

import '../presentation/router/route_generator.dart';

class BetterC25K extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: "Better C25K",
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.blueGrey,
          primarySwatch: Colors.blueGrey,
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.accent),
          accentColor: Colors.white,
        ),
      );
}
