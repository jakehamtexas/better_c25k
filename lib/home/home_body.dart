import 'package:better_c25k/regimen/model/regimen/c25k_regimen.dart';
import 'package:better_c25k/router/routes.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: RaisedButton(
          child: Text("Go To C25k"),
          onPressed: () => Navigator.of(context).pushNamed(Routes.regimen,
              arguments: C25KRegimen()),
        ),
      );
}
