import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../core/error/error.dart';
import '../entities/common/common.dart';
import '../entities/regimen/static/c25k_regimen_static_entity.dart';
import '../repository/repository.dart';
import 'insert_regimen.dart';

class Initialize {
  final AppStateRepository appStateRepository;
  final RegimenRepository regimenRepository;
  final WorkoutRepository workoutRepository;
  final ExerciseRepository exerciseRepository;
  Initialize({
    @required this.appStateRepository,
    @required this.regimenRepository,
    @required this.workoutRepository,
    @required this.exerciseRepository,
  });

  Future<Either<Failure, List<NameAndId<int>>>> call() async {
    return (await appStateRepository.getHasBeenInitialized()).fold(
        (failure) async {
      if (failure is KeyNotFoundFailure) {
        return await _initialize();
      } else {
        return left(failure);
      }
    }, (hasBeenInitialized) async {
      if (!hasBeenInitialized) return await _initialize();
      return await regimenRepository.getAllRegimenNamesAndIds();
    });
  }

  Future<Either<Failure, List<NameAndId<int>>>> _initialize() async {
    await appStateRepository.setHasBeenInitialized();
    return (await InsertRegimen(
      exerciseRepository: exerciseRepository,
      regimenRepository: regimenRepository,
      workoutRepository: workoutRepository,
    )(C25KRegimenStaticEntity()))
        .fold(
      (failure) => left(failure),
      (regimenId) => right(
        [
          NameAndId<int>(
            id: regimenId,
            name: C25KRegimenStaticEntity.c25kName,
          )
        ],
      ),
    );
  }
}
