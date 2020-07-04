part of 'workout_completed_bloc.dart';

abstract class WorkoutCompletedState extends Equatable {
  const WorkoutCompletedState();
}

class WorkoutCompletedInitial extends WorkoutCompletedState {
  @override
  List<Object> get props => [];
}

class GoBackToWorkoutsState extends WorkoutCompletedState
    implements IGoBackToWorkoutsState {
  @override
  List<Object> get props => throw UnimplementedError();

  const GoBackToWorkoutsState(this.regimenNameAndId);

  @override
  final NameAndId<int> regimenNameAndId;
}
