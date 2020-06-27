import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../error/error.dart';
import 'bloc/home_bloc.dart';
import 'regimen_selection.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        return HomeBloc()..add(AppStartedEvent(context));
      },
      child: BlocConsumer<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is RegimenRetrievalSuccessState) {
            return RegimenSelection(state.regimenNameAndIds);
          }
          return Container();
        },
        listener: (context, state) {
          if (state is RegimenRetrievalFailureState) {
            NavigateToDefaultErrorPage()(context)(state.failure);
          }
        },
      ),
    );
  }
}
