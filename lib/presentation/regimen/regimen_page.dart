import 'package:better_c25k/domain/entities/common/common.dart';
import 'package:better_c25k/presentation/error/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasources/datasources.dart';
import '../../domain/usecases/get_workouts.dart';
import 'bloc/regimen_bloc.dart';
import 'workouts_list.dart';

class RegimenPage extends StatelessWidget {
  final NameAndId<int> regimenNameAndId;

  int get regimenId => regimenNameAndId.id;
  String get regimenName => regimenNameAndId.name;

  const RegimenPage(this.regimenNameAndId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegimenBloc>(
      create: (BuildContext context) {
        final getIt = GetIt.I;
        final workoutRepository = getIt<RegimenDatabase>().workoutRepository;
        final usecase = GetWorkouts(workoutRepository);
        return RegimenBloc()
          ..add(RegimenInitializedEvent(
            regimenId: regimenId,
            context: context,
            usecase: usecase,
          ));
      },
      child: Scaffold(
        appBar: AppBar(title: Text(regimenName)),
        body: BlocConsumer<RegimenBloc, RegimenState>(
          builder: (BuildContext context, RegimenState state) {
            if (state is WorkoutsRetrievalSuccessState) {
              return WorkoutsList(state.workouts);
            }
            return Container();
          },
          listener: (BuildContext context, RegimenState state) {
            if (state is WorkoutRetrievalFailureState) {
              NavigateToDefaultErrorPage()(context)(state.failure);
            }
          },
        ),
      ),
    );
  }
}
