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

  WorkoutsRetrievalSuccessState(this.workouts);

  @override
  List<Object> get props => [workouts];
}
