import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/error.dart';
import '../../../domain/entities/workout/workout.dart';
import '../../../domain/usecases/get_workouts.dart';

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
        (failure) => WorkoutRetrievalFailureState(failure),
        (workouts) => WorkoutsRetrievalSuccessState(workouts),
      );
    }
  }
}
