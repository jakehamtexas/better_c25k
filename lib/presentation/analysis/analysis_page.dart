import 'package:flutter/material.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';

class AnalysisPage extends StatelessWidget implements HasPageIndex {
  const AnalysisPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return C25kLayout(
      body: const Text("This is the analysis page"),
      index: pageIndex,
    );
  }

  @override
  int get pageIndex => 1;
}
