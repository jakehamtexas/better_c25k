import 'dart:async';

import 'package:better_c25k/core/bloc/bloc.dart';
import 'package:better_c25k/domain/entities/common/common.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'workout_completed_event.dart';
part 'workout_completed_state.dart';

class WorkoutCompletedBloc
    extends Bloc<WorkoutCompletedEvent, WorkoutCompletedState> {
  @override
  WorkoutCompletedState get initialState => WorkoutCompletedInitial();

  @override
  Stream<WorkoutCompletedState> mapEventToState(
    WorkoutCompletedEvent event,
  ) async* {
    if (event is GoBackToWorkoutsEvent) {
      yield GoBackToWorkoutsState(event.regimenNameAndId);
    }
  }
}
