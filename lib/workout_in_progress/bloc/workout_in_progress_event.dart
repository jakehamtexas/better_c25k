part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressEvent extends Equatable {
  const WorkoutInProgressEvent();
}

class PauseToggledEvent extends WorkoutInProgressEvent {
  @override
  List<Object> get props => [];
}
