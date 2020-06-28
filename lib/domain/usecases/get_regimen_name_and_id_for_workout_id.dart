import 'package:better_c25k/domain/entities/common/common.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../core/error/error.dart';
import '../../core/extension/dartz/dartz.dart';
import '../repository/repository.dart';

class GetRegimenNameAndIdForWorkoutId {
  final RegimenRepository regimenRepository;
  final WorkoutRepository workoutRepository;
  GetRegimenNameAndIdForWorkoutId({
    @required this.regimenRepository,
    @required this.workoutRepository,
  });
  Future<Either<Failure, NameAndId<int>>> call(int workoutId) async {
    final regimenIdOrFailure =
        await workoutRepository.getRegimenIdForWorkoutId(workoutId);
    if (regimenIdOrFailure.isLeft()) {
      return regimenIdOrFailure.foldWithValueRight<NameAndId<int>>(null);
    }
    final regimenId = regimenIdOrFailure.getOrThrow();
    final regimenNameOrFailure =
        await regimenRepository.getNameForId(regimenId);
    if (regimenNameOrFailure.isLeft()) {
      return regimenIdOrFailure.foldWithValueRight<NameAndId<int>>(null);
    }
    final regimenName = regimenNameOrFailure.getOrThrow();
    return right(
      NameAndId<int>(
        name: regimenName,
        id: regimenId,
      ),
    );
  }
}
