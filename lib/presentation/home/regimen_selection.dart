import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/common/name_and_id.dart';
import '../debug/view_database_button.dart';
import 'bloc/home_bloc.dart';

class RegimenSelection extends StatelessWidget {
  final List<NameAndId<int>> regimenNamesAndIds;
  const RegimenSelection(this.regimenNamesAndIds);

  @override
  Widget build(BuildContext context) {
    final regimenSelectionButtons = regimenNamesAndIds.map(
      (nameAndId) => RaisedButton(
        onPressed: () =>
            BlocProvider.of<HomeBloc>(context).add(RegimenSelectedEvent(
          regimenNameAndId: nameAndId,
          context: context,
        )),
        child: Text(nameAndId.name),
      ),
    );
    final children = <Widget>[
      ...regimenSelectionButtons,
      ViewDatabaseButton(),
    ];
    return Column(
      children: children,
    );
  }
}
