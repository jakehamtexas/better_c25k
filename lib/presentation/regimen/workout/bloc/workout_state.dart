part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
  const WorkoutState();
}

class WorkoutExpandToggledOff extends WorkoutState {
  @override
  List<Object> get props => [];
}

class WorkoutExpandToggledOn extends WorkoutState {
  @override
  List<Object> get props => [];
}
