part of 'workout_completed_bloc.dart';

abstract class WorkoutCompletedEvent extends Equatable {
  const WorkoutCompletedEvent();
}

class GoBackToWorkoutsEvent extends WorkoutCompletedEvent
    implements IGoBackToWorkoutsEvent {
  @override
  final NameAndId<int> regimenNameAndId;

  const GoBackToWorkoutsEvent(this.regimenNameAndId);
  @override
  List<Object> get props => [regimenNameAndId];
}
