import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/common/common.dart';
import '../repository/regimen_repository.dart';

class GetRegimens {
  final RegimenRepository _repository;
  GetRegimens(this._repository);

  Future<Either<Failure, List<NameAndId<int>>>> execute() async {
    return await _repository.getAllRegimenNamesAndIds();
  }
}
