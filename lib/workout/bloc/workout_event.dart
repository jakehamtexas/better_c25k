part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();
}

class WorkoutExpandToggledEvent extends WorkoutEvent {
  @override
  List<Object> get props => [];
}
