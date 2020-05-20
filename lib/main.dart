import 'package:flutter/material.dart';

import 'home/home.dart';

void main() => runApp(BetterC25K());

class BetterC25K extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(title: "Better C25K", home: Home());
}
