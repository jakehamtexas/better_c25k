import 'package:better_c25k/domain/entities/regimen/regimen.dart';
import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../repository/regimen_repository.dart';

class GetRegimens {
  final RegimenRepository _repository;
  GetRegimens(this._repository);

  Future<Either<Failure, List<RegimenEntity>>> execute() async {
    return await _repository.getAllRegimens();
  }
}
