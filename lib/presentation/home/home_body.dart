import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/datasources.dart';
import '../../domain/repository/app_state_repository.dart';
import '../../domain/usecases/initialize.dart';
import 'bloc/home_bloc.dart';
import 'regimen_selection.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) {
        final getIt = GetIt.I;
        final database = getIt<RegimenDatabase>();
        final appStateRepository = getIt<AppStateRepository>();
        final usecase = Initialize(
          appStateRepository: appStateRepository,
          regimenRepository: database.regimenRepository,
          workoutRepository: database.workoutRepository,
          exerciseRepository: database.exerciseRepository,
        );
        return HomeBloc(usecase)..add(AppStartedEvent(context));
      },
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is RegimenRetrievalSuccessState) {
            return RegimenSelection(state.regimenNameAndIds);
          }
          return null;
        },
      ),
    );
  }
}
