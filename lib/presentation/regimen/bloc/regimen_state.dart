part of 'regimen_bloc.dart';

abstract class RegimenState extends Equatable {
  const RegimenState();
}

class RegimenInitial extends RegimenState {
  @override
  List<Object> get props => [];
}

class WorkoutsRetrievalSuccessState extends RegimenState {
  final List<WorkoutPresentationEntity> workouts;

  const WorkoutsRetrievalSuccessState(this.workouts);

  @override
  List<Object> get props => [workouts];
}

class WorkoutRetrievalFailureState extends RegimenState
    implements FailureState {
  const WorkoutRetrievalFailureState(this.failure);
  @override
  List<Object> get props => [failure];

  @override
  final Failure failure;
}
