import 'package:flutter/material.dart';

class Workout extends StatelessWidget {
  Workout(Object args);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Go To Home"),
        onPressed: () => Navigator.of(context).pushNamed("/"),
      ),
    );
  }
}
