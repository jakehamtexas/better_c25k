part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressEvent extends Equatable {
  const WorkoutInProgressEvent();
}

class WorkoutInProgressInitializedEvent extends WorkoutInProgressEvent {
  final int workoutId;
  final GetExercises usecase;
  const WorkoutInProgressInitializedEvent({
    @required this.workoutId,
    @required this.usecase,
  });

  @override
  List<Object> get props => [workoutId];
}

class PauseEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class UnpauseEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class StartEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class DecrementRemainingTimeEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class IncrementExerciseEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class WorkoutCompletedEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}
