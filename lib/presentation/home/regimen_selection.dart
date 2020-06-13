import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/common/name_and_id.dart';
import '../debug/view_database_button.dart';
import 'bloc/home_bloc.dart';

class RegimenSelection extends StatelessWidget {
  final List<NameAndId<int>> regimenNamesAndIds;
  RegimenSelection(this.regimenNamesAndIds);

  @override
  Widget build(BuildContext context) {
    final regimenSelectionButtons = regimenNamesAndIds.map(
      (nameAndId) => RaisedButton(
        child: Text(nameAndId.name),
        onPressed: () =>
            BlocProvider.of<HomeBloc>(context).add(RegimenSelectedEvent(
          regimenNameAndId: nameAndId,
          context: context,
        )),
      ),
    );
    final children = <Widget>[
      ...regimenSelectionButtons,
      ViewDatabaseButton(),
    ];
    return Container(
      child: Column(
        children: children,
      ),
    );
  }
}
