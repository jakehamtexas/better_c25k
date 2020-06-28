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

abstract class ChangeExerciseEvent extends WorkoutInProgressEvent {
  final bool shouldPause;

  const ChangeExerciseEvent({@required this.shouldPause});
}

class IncrementExerciseEvent extends ChangeExerciseEvent {
  const IncrementExerciseEvent({@required bool shouldPause})
      : super(shouldPause: shouldPause);
  @override
  List<Object> get props => [];
}

class DecrementExerciseEvent extends ChangeExerciseEvent {
  const DecrementExerciseEvent({@required bool shouldPause})
      : super(shouldPause: shouldPause);
  @override
  List<Object> get props => [];
}

class WorkoutCompletedEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}

class GoBackToWorkoutsEvent extends WorkoutInProgressEvent
    implements IGoBackToWorkoutsEvent {
  @override
  final NameAndId<int> regimenNameAndId;

  const GoBackToWorkoutsEvent([this.regimenNameAndId]);
  @override
  List<Object> get props => [regimenNameAndId];
}
