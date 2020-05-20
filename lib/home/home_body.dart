import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: RaisedButton(
          child: Text("Go To Workout"),
          onPressed: () => Navigator.of(context).pushNamed("/workout",
              arguments: "No args at this time, but there will be!"),
        ),
      );
}
