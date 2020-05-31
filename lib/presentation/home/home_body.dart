import 'package:flutter/material.dart';

import '../../app/router/routes.dart';
import '../../domain/entities/regimen/static/static.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Container(
        child: RaisedButton(
          child: Text("Go To C25k"),
          onPressed: () => Navigator.of(context)
              .pushNamed(Routes.regimen, arguments: C25KRegimenStaticEntity()),
        ),
      );
}
