import 'package:flutter/material.dart';

class ExpandedCenter extends Expanded {
  ExpandedCenter({@required Widget child})
      : super(
            child: Center(
          child: child,
        ));
}
