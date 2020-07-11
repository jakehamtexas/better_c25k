import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/preferences/preferences_entity.dart';
import '../bloc/preferences_bloc.dart';

class SaveBar extends StatelessWidget {
  final PreferencesEntity preferences;
  const SaveBar(this.preferences, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PreferencesBloc>(context);
    return Expanded(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Container(
          height: 45,
          color: Colors.grey,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () => bloc.add(CancelSelectedEvent()),
                child: const Text("Cancel"),
              ),
              RawMaterialButton(
                onPressed: () => bloc.add(SaveSelectedEvent(
                  preferences: preferences,
                )),
                child: const Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
