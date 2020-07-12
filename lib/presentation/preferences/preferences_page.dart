import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/common.dart';
import '../scaffold/scaffold.dart';
import 'bloc/preferences_bloc.dart';
import 'control_view/control_view.dart';
import 'failed_to_get_preferences.dart';
import 'save_bar.dart';
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
          buildWhen: (_, current) => [GetFailedState, GetSucceededState]
              .any((element) => element == current.runtimeType),
          builder: (BuildContext context, PreferencesState state) {
            switch (state.runtimeType) {
              case GetFailedState:
                return FailedToGetPreferences();
              case GetSucceededState:
                return ControlViewListView(
                  (state as GetSucceededState).preferences,
                );
                break;
              default:
                return Container();
            }
          },
          listener: (BuildContext context, PreferencesState state) {
            final scaffold = Scaffold.of(context);
            switch (state.runtimeType) {
              case SaveFailedState:
                scaffold.showSnackBar(const SaveFailedSnackBar());
                break;
              case SaveSuccessfulState:
                scaffold.showSnackBar(const SaveSuccessfulSnackBar());
                break;
              case ShowSaveBarState:
                final bottomSheetController = scaffold.showBottomSheet(
                  SaveBar.builder(
                    context,
                  ),
                );
                BlocProvider.of<PreferencesBloc>(context).add(
                    UpdateBottomSheetControllerEvent(bottomSheetController));
                break;
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
