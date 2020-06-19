part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();
}

class WorkoutExpandToggledEvent extends WorkoutEvent {
  @override
  List<Object> get props => [];
}

class WorkoutStartedEvent extends WorkoutEvent {
  final int workoutId;
  final String workoutTitle;
  final BuildContext context;

  const WorkoutStartedEvent({
    @required this.workoutId,
    @required this.workoutTitle,
    @required this.context,
  });

  @override
  List<Object> get props => [workoutId];
}
