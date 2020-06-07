import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/workout/workout.dart';
import '../../../domain/usecases/get_workouts.dart';
import '../../error/error.dart';

part 'regimen_event.dart';
part 'regimen_state.dart';

class RegimenBloc extends Bloc<RegimenEvent, RegimenState> {
  @override
  RegimenState get initialState => RegimenInitial();

  @override
  Stream<RegimenState> mapEventToState(
    RegimenEvent event,
  ) async* {
    if (event is RegimenInitializedEvent) {
      final workoutsOrFailure = await event.usecase(event.regimenId);
      yield workoutsOrFailure.fold(
        LeftNavigateToDefaultErrorPage()(event.context),
        (workouts) => WorkoutsRetrievalSuccessState(workouts),
      );
    }
  }
}
