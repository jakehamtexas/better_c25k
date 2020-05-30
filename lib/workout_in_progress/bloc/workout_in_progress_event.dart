part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressEvent extends Equatable {
  const WorkoutInProgressEvent();
}

class PauseEvent extends WorkoutInProgressEvent {
  final String exerciseActionMessage;
  PauseEvent({
    @required this.exerciseActionMessage,
  });
  @override
  List<Object> get props => [exerciseActionMessage];
}

class UnpauseEvent extends PauseEvent {
  UnpauseEvent({
    @required exerciseActionMessage,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
        );
}

class StartEvent extends PauseEvent {
  final int currentCountdownTime;
  StartEvent({
    @required exerciseActionMessage,
    @required this.currentCountdownTime,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
        );
}

class DecrementRemainingTimeEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}
