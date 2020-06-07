import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:moor_db_viewer/moor_db_viewer.dart';

import '../../data/datasources/datasources.dart';

class ViewDatabaseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("View Database"),
      onPressed: () {
        final database = GetIt.I<RegimenDatabase>();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MoorDbViewer(
              database,
            ),
          ),
        );
      },
    );
  }
}
