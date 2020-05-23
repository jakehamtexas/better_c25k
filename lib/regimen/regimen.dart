import 'package:better_c25k/router/routes.dart';
import 'package:flutter/material.dart';

class Regimen extends StatelessWidget {
  Regimen(Object args);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Go To Home"),
        onPressed: () => Navigator.of(context).pushNamed(Routes.home),
      ),
    );
  }
}
