import 'package:better_c25k/domain/entities/common/name_and_id.dart';
import 'package:better_c25k/domain/usecases/get_regimens.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/repository.dart';

const _tNameAndIds = [NameAndId(id: 0, name: "tName")];
void main() {
  GetRegimens usecase;
  MockRegimenRepository mockRegimenRepository;

  setUp(() {
    mockRegimenRepository = MockRegimenRepository();
    usecase = GetRegimens(mockRegimenRepository);
  });

  test('should get regimens from the repository', () async {
    // arrange
    when(mockRegimenRepository.getAllRegimenNamesAndIds())
        .thenAnswer((_) async => Right(_tNameAndIds));

    // act
    final result = await usecase();

    // assert
    expect(result, Right(_tNameAndIds));
    verify(mockRegimenRepository.getAllRegimenNamesAndIds());
    verifyNoMoreInteractions(mockRegimenRepository);
  });
}
