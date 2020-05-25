part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressEvent extends Equatable {
  const WorkoutInProgressEvent();
}

class PauseEvent extends WorkoutInProgressEvent {
  final int currentCountdownTime;

  final String exerciseActionMessage;
  PauseEvent({
    @required this.exerciseActionMessage,
    @required this.currentCountdownTime,
  });
  @override
  List<Object> get props => [currentCountdownTime];
}

class StartEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}
