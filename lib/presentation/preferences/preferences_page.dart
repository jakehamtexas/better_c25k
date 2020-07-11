import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';
import 'bloc/preferences_bloc.dart';
import 'control_view/control_view.dart';
import 'failed_to_get_preferences.dart';
import 'snack_bar/snack_bar.dart';

class PreferencesPage extends StatelessWidget implements HasPageIndex {
  const PreferencesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return C25kLayout(
      body: BlocProvider<PreferencesBloc>(
        create: (BuildContext context) =>
            PreferencesBloc()..add(GetPreferencesEvent()),
        child: BlocConsumer<PreferencesBloc, PreferencesState>(
          buildWhen: (_, current) => current is! SaveFailedState,
          builder: (BuildContext context, PreferencesState state) {
            Widget widget;
            switch (state.runtimeType) {
              case GetFailedState:
                return FailedToGetPreferences();
              case ShownSaveableButtonBarState:
                widget = PreferencesWithSaveBar(
                  (state as HydratedPreferencesState).preferences,
                );
                break;
              case HiddenSaveableButtonBarState:
                widget = PreferencesWithoutSaveBar(
                  (state as HydratedPreferencesState).preferences,
                );
                break;
              case SaveSuccessfulState:
                widget = PreferencesWithoutSaveBar(
                  (state as HydratedPreferencesState).preferences,
                );
                break;
              default:
                return Container();
            }
            return ControlViewAnimation(widget);
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
      ),
      index: pageIndex,
    );
  }

  @override
  int get pageIndex => 2;
}
