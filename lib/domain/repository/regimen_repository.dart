import 'package:better_c25k/domain/entities/regimen/regimen.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/common/common.dart';

abstract class RegimenRepository {
  Future<Either<Failure, List<NameAndId<int>>>> getAllRegimenNamesAndIds();
  Future<Either<Failure, int>> insertRegimen(RegimenEntity entity);
}
