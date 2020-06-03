import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../core/error/failure.dart';
import '../../core/extension/as_either_extension.dart';
import '../../domain/entities/common/name_and_id.dart';
import '../../domain/repository/regimen_repository.dart';
import '../datasources/datasources.dart';

part 'regimen_repository_dao.g.dart';

@UseDao(tables: [Regimens])
class RegimenRepositoryDao extends DatabaseAccessor<RegimenDatabase>
    with _$RegimenRepositoryDaoMixin
    implements RegimenRepository {
  RegimenRepositoryDao(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, List<NameAndId<int>>>>
      getAllRegimenNamesAndIds() async {
    return await select(regimens)
        .map((regimen) => NameAndId(
              id: regimen.id,
              name: regimen.name,
            ))
        .get()
        .asEither();
  }
}
