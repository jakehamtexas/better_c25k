part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressEvent extends Equatable {
  const WorkoutInProgressEvent();
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
  final List<ExerciseModel> exercises;
  StartEvent({
    @required this.exercises,
  });

  @override
  List<Object> get props => [...exercises];
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
  List<Object> get props => [];
}
