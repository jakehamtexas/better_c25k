import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleableControl extends StatelessWidget {
  final String onText;
  final String offText;
  final void Function(bool) onToggled;
  final bool isToggled;

  List<bool> get _isSelected => isToggled ? [false, true] : [true, false];

  const ToggleableControl({
    @required this.onText,
    @required this.offText,
    @required this.onToggled,
    @required this.isToggled,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: _isSelected,
      onPressed: (index) => onToggled(index == 1),
      children: <Widget>[
        Text(offText),
        Text(onText),
      ],
    );
  }
}
