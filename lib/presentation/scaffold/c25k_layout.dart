import 'package:flutter/material.dart';

import 'c25k_bottom_nav.dart';

class C25kLayout extends StatelessWidget {
  final Widget body;
  final int index;
  const C25kLayout({Key key, @required this.body, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: body,
        bottomNavigationBar: C25kBottomNav(
          context: context,
          index: index,
        ),
      ),
    );
  }
}
