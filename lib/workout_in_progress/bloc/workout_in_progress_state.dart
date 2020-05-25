part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressState extends Equatable {
  const WorkoutInProgressState();
}

class WorkoutInProgressInitial extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class PauseToggledOnState extends WorkoutInProgressState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class PauseToggledOffState extends WorkoutInProgressState {
  @override
  List<Object> get props => throw UnimplementedError();
}
