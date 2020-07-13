import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/preferences_bloc.dart';

class SaveBar {
  static Widget Function(BuildContext) builder(BuildContext context) =>
      (BuildContext _) {
        final bloc = BlocProvider.of<PreferencesBloc>(context);
        return Container(
          color: Colors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () => bloc.add(CancelSelectedEvent()),
                child: const Text("Cancel"),
              ),
              RawMaterialButton(
                onPressed: () => bloc.add(SaveSelectedEvent()),
                child: const Text("Save"),
              )
            ],
          ),
        );
      };
}
