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

  const ExercisesRetrievalSuccessState(this.firstExercise);
  @override
  List<Object> get props => [firstExercise];
}

class ExercisesRetrievalFailureState extends WorkoutInProgressState
    implements FailureState {
  @override
  final Failure failure;
  const ExercisesRetrievalFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}

class WorkoutCompletedState extends WorkoutInProgressState {
  @override
  List<Object> get props => [];
}

class PauseToggledOnState extends WorkoutInProgressStateDTO {
  const PauseToggledOnState({
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
  String get buttonMessage => "Pause";
  const PauseToggledOffState({
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
  String get buttonMessage => "Start";

  const IsStartedState({
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

  const WorkoutInProgressStateDTO({
    @required this.exerciseActionMessage,
    @required this.currentCountdownTime,
  });

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}
