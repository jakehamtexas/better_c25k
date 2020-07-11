import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';
import 'bloc/preferences_bloc.dart';
import 'failed_to_get_preferences.dart';
import 'control_view/control_view.dart';
import 'snack_bar/snack_bar.dart';

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
