import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/regimen/regimen.dart';

abstract class RegimenRepository {
  Future<Either<Failure, List<RegimenEntity>>> getAllRegimens();
}
