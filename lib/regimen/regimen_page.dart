import 'package:better_c25k/router/routes.dart';
import 'package:flutter/material.dart';

import 'regimen_model.dart';

class RegimenPage extends StatelessWidget {
  final RegimenModel regimen;
  RegimenPage(this.regimen);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(regimen.name)),
      body: Container(
        child: RaisedButton(
          child: Text("Go To Home"),
          onPressed: () => Navigator.of(context).pushNamed(Routes.home),
        ),
      ),
    );
  }
}
