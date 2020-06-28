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
  final bool hasNextExercise;

  const ExercisesRetrievalSuccessState({
    @required this.firstExercise,
    @required this.hasNextExercise,
  });
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
  final int workoutId;
  final NameAndId<int> regimenNameAndId;
  const WorkoutCompletedState({
    @required this.workoutId,
    @required this.regimenNameAndId,
  });
  @override
  List<Object> get props => [workoutId, regimenNameAndId];
}

class PauseToggledOnState extends WorkoutInProgressStateDTO {
  const PauseToggledOnState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
    @required bool hasPreviousExercise,
    @required bool hasNextExercise,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
          hasPreviousExercise: hasPreviousExercise,
          hasNextExercise: hasNextExercise,
        );

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}

class PauseToggledOffState extends WorkoutInProgressStateDTO {
  const PauseToggledOffState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
    @required bool hasPreviousExercise,
    @required bool hasNextExercise,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
          hasPreviousExercise: hasPreviousExercise,
          hasNextExercise: hasNextExercise,
        );
  @override
  List<Object> get props => [exerciseActionMessage, currentCountdownTime];
}

class IsStartedState extends WorkoutInProgressStateDTO {
  const IsStartedState({
    @required String exerciseActionMessage,
    @required int currentCountdownTime,
    @required bool hasNextExercise,
  }) : super(
          exerciseActionMessage: exerciseActionMessage,
          currentCountdownTime: currentCountdownTime,
          hasPreviousExercise: false,
          hasNextExercise: hasNextExercise,
        );
}

class WorkoutInProgressStateDTO extends WorkoutInProgressState {
  final String exerciseActionMessage;
  final int currentCountdownTime;
  final bool hasPreviousExercise;
  final bool hasNextExercise;

  const WorkoutInProgressStateDTO({
    @required this.exerciseActionMessage,
    @required this.currentCountdownTime,
    @required this.hasPreviousExercise,
    @required this.hasNextExercise,
  });

  @override
  List<Object> get props => [currentCountdownTime, exerciseActionMessage];
}

class GoBackToWorkoutsState extends WorkoutInProgressState
    implements IGoBackToWorkoutsState {
  @override
  List<Object> get props => [regimenNameAndId];

  const GoBackToWorkoutsState(this.regimenNameAndId);

  @override
  final NameAndId<int> regimenNameAndId;
}
