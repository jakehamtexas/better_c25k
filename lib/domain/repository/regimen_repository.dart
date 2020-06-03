import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/common/common.dart';

abstract class RegimenRepository {
  Future<Either<Failure, List<NameAndId<int>>>> getAllRegimenNamesAndIds();
}
