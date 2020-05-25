part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressState extends Equatable {
  const WorkoutInProgressState();
}

class WorkoutInProgressInitial extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class PauseToggledOnState extends WorkoutInProgressState {
  final String exerciseActionMessage;
  final int currentCountdownTime;

  PauseToggledOnState({
    @required this.exerciseActionMessage,
    @required this.currentCountdownTime,
  });

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}

class PauseToggledOffState extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class IsStartedState extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}
