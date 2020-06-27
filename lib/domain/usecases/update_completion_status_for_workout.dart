import 'package:better_c25k/constant/completion_status.dart';
import 'package:better_c25k/core/error/error.dart';
import 'package:better_c25k/domain/repository/workout_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateCompletionStatusForWorkout {
  final WorkoutRepository workoutRepository;
  UpdateCompletionStatusForWorkout(this.workoutRepository);
  Future<Either<DatabaseInsertionFailure, int>> call(
      int workoutId, CompletionStatus completionStatus) async {
    final workoutIdOrFailure =
        await workoutRepository.setCompletionStatusForWorkout(
      workoutId: workoutId,
      completionStatus: completionStatus,
    );
    return workoutIdOrFailure.fold(
      (failure) => left(
        DatabaseInsertionFailure.workoutCompletionStatusUpdateFailure(),
      ),
      (workoutId) => right(
        workoutId,
      ),
    );
  }
}
