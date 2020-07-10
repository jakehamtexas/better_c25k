import 'package:better_c25k/domain/entities/preferences/preferences_entity.dart';
import 'package:better_c25k/presentation/preferences/bloc/preferences_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';

class PreferencesPage extends StatelessWidget implements HasPageIndex {
  const PreferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return C25kLayout(
      body: BlocConsumer<PreferencesBloc, PreferencesState>(
        builder: (BuildContext context, PreferencesState state) {
          switch (state.runtimeType) {
            case GetFailedState:
              return FailedToGetPreferences();
            case ShownSaveableButtonBarState:
              return PreferencesWithSaveBar(
                (state as HydratedPreferencesState).preferences,
              );
            case HiddenSaveableButtonBarState:
              return PreferencesWithoutSaveBar(
                (state as HydratedPreferencesState).preferences,
              );
            default:
              return Container();
          }
        },
        listener: (BuildContext context, PreferencesState state) {
          switch (state.runtimeType) {
            case SaveFailedState:
              Scaffold.of(context).showSnackBar(SaveFailedSnackBar());
              break;
            case SaveSuccessfulState:
              Scaffold.of(context).showSnackBar(SaveSuccessfulSnackBar());
          }
        },
      ),
      index: pageIndex,
    );
  }

  @override
  int get pageIndex => 2;
}

class SaveSuccessfulSnackBar extends SnackBar {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SaveFailedSnackBar extends SnackBar {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class PreferencesWithoutSaveBar extends StatelessWidget {
  final PreferencesEntity preferences;
  const PreferencesWithoutSaveBar(this.preferences);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class PreferencesWithSaveBar extends StatelessWidget {
  final PreferencesEntity preferences;
  const PreferencesWithSaveBar(this.preferences);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class FailedToGetPreferences extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
