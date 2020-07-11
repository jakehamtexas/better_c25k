import 'package:flutter/material.dart';

class ControlViewAnimation extends StatelessWidget {
  final Widget child;
  static const duration = Duration(milliseconds: 300);

  const ControlViewAnimation(this.child) : super();

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      child: child,
    );
  }
}
