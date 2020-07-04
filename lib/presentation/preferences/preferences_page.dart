import 'package:flutter/material.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';

class PreferencesPage extends StatelessWidget implements HasPageIndex {
  const PreferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return C25kLayout(
      body: const Text("This is the preferences page"),
      index: pageIndex,
    );
  }

  @override
  int get pageIndex => 2;
}
