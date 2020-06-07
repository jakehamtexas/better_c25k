part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
}

class WorkoutInitializedState extends WorkoutState {
  @override
  List<Object> get props => [];
}

class WorkoutExpandToggledOffState extends WorkoutState {
  @override
  List<Object> get props => [];
}

class WorkoutExpandToggledOnState extends WorkoutState {
  @override
  List<Object> get props => [];
}
