import 'package:better_c25k/regimen/regimen.dart';
import 'package:flutter/material.dart';

import 'package:better_c25k/router/routes.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: RaisedButton(
          child: Text("Go To C25k"),
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.regimen, arguments: C25KRegimenModel()),
        ),
      );
}
