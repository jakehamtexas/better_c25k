import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../app/app_config.dart';
import '../../core/error/error.dart';
import '../../core/extension/dartz/dartz.dart';
import '../../domain/repository/repository.dart';
import '../entities/common/common.dart';
import '../entities/regimen/static/c25k_regimen_static_entity.dart';
import '../entities/regimen/static/static.dart';
import 'insert_regimen.dart';

class Initialize {
  AppStateRepository get appStateRepository => GetIt.I<AppStateRepository>();
  RegimenRepository get regimenRepository => GetIt.I<RegimenRepository>();
  WorkoutRepository get workoutRepository => GetIt.I<WorkoutRepository>();
  ExerciseRepository get exerciseRepository => GetIt.I<ExerciseRepository>();

  Future<Either<Failure, List<NameAndId<int>>>> call(
    BuildContext context,
  ) async {
    return (await appStateRepository.getHasBeenInitialized()).fold((failure) {
      if (failure is KeyNotFoundFailure) {
        return _initialize(context);
      } else {
        return left(failure);
      }
    }, (hasBeenInitialized) async {
      if (!hasBeenInitialized) return _initialize(context);
      return regimenRepository.getAllRegimenNamesAndIds();
    });
  }

  Future<Either<Failure, List<NameAndId<int>>>> _initialize(
          BuildContext context) =>
      AppConfig.of(context).isDev ? _initializeDev() : _initializeProd();

  Future<Either<Failure, List<NameAndId<int>>>> _initializeDev() async {
    await appStateRepository.setHasBeenInitialized();
    final usecase = InsertRegimen(
      exerciseRepository: exerciseRepository,
      regimenRepository: regimenRepository,
      workoutRepository: workoutRepository,
    );
    final c25kRegimenIdOrFailure = await usecase(C25KRegimenStaticEntity());
    if (c25kRegimenIdOrFailure.isLeft()) {
      return c25kRegimenIdOrFailure.foldWithValueRight([null]);
    }
    final testRegimenIdOrFailure = await usecase(ShortTestRegimen());
    if (testRegimenIdOrFailure.isLeft()) {
      return c25kRegimenIdOrFailure.foldWithValueRight([null]);
    }

    final c25kRegimenId = c25kRegimenIdOrFailure.getOrThrow();
    final testRegimenId = testRegimenIdOrFailure.getOrThrow();
    return right([
      NameAndId(
        id: c25kRegimenId,
        name: C25KRegimenStaticEntity.c25kName,
      ),
      NameAndId(
        id: testRegimenId,
        name: ShortTestRegimen.shortTestName,
      )
    ]);
  }

  Future<Either<Failure, List<NameAndId<int>>>> _initializeProd() async {
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
