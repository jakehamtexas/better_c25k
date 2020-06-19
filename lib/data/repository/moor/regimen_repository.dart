import 'package:dartz/dartz.dart';
import 'package:moor/moor.dart';

import '../../../core/error/failure.dart';
import '../../../core/extension/dartz/dartz.dart';
import '../../../domain/entities/common/name_and_id.dart';
import '../../../domain/entities/regimen/regimen.dart';
import '../../../domain/repository/regimen_repository.dart' as domain;
import '../../datasources/datasources.dart';

part 'regimen_repository.g.dart';

@UseDao(tables: [Regimens])
class RegimenRepository extends DatabaseAccessor<RegimenDatabase>
    with _$RegimenRepositoryMixin
    implements domain.RegimenRepository {
  RegimenRepository(RegimenDatabase db) : super(db);

  @override
  Future<Either<Failure, List<NameAndId<int>>>>
      getAllRegimenNamesAndIds() async {
    return await Task(() => select(regimens)
            .map((regimen) => NameAndId(
                  id: regimen.id,
                  name: regimen.name,
                ))
            .get()).attempt().mapLeftToFailure().run()
        as Either<Failure, List<NameAndId<int>>>;
  }

  @override
  Future<Either<Failure, int>> insertRegimen(RegimenEntity entity) async {
    final companion = RegimensCompanion(
      description: Value(entity.description),
      name: Value(entity.name),
    );
    return await Task(() => into(regimens).insert(companion))
        .attempt()
        .mapLeftToFailure()
        .run() as Either<Failure, int>;
  }
}
