part of 'workout_in_progress_bloc.dart';

abstract class WorkoutInProgressState extends Equatable {
  const WorkoutInProgressState();
}

class WorkoutInProgressInitialState extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class ExercisesRetrievalSuccessState extends WorkoutInProgressState {
  final ExerciseEntity firstExercise;

  ExercisesRetrievalSuccessState(this.firstExercise);
  @override
  // TODO: implement props
  List<Object> get props => [firstExercise];
}

class WorkoutCompletedState extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class PauseToggledOnState extends WorkoutInProgressStateDTO {
  PauseToggledOnState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
        );

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}

class PauseToggledOffState extends WorkoutInProgressStateDTO {
  final buttonMessage = "Pause";
  PauseToggledOffState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
        );
  @override
  List<Object> get props =>
      [buttonMessage, exerciseActionMessage, currentCountdownTime];
}

class IsStartedState extends WorkoutInProgressStateDTO {
  final buttonMessage = "Start";

  IsStartedState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
        );
}

class WorkoutInProgressStateDTO extends WorkoutInProgressState {
  final String exerciseActionMessage;
  final int currentCountdownTime;

  WorkoutInProgressStateDTO({
    @required this.exerciseActionMessage,
    @required this.currentCountdownTime,
  });

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}
