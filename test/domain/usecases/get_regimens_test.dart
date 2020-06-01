import 'package:better_c25k/domain/entities/regimen/regimen.dart';
import 'package:better_c25k/domain/entities/workout/workout.dart';
import 'package:better_c25k/domain/repository/regimen_repository.dart';
import 'package:better_c25k/domain/usecases/get_regimens.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockRegimenRepository extends Mock implements RegimenRepository {}

final _tWorkout = WorkoutEntity(
  exercises: [],
  description: "tDescription",
  ordinalDayOfWeekNumber: 0,
  ordinalWeekNumber: 0,
  workoutId: 0,
);
final List<RegimenEntity> tRegimens = [
  RegimenEntity(name: "tName", workouts: [_tWorkout])
];
void main() {
  GetRegimens usecase;
  MockRegimenRepository mockRegimenRepository;

  setUp(() {
    mockRegimenRepository = MockRegimenRepository();
    usecase = GetRegimens(mockRegimenRepository);
  });

  test('should get regimens from the repository', () async {
    // arrange
    when(mockRegimenRepository.getAllRegimens())
        .thenAnswer((_) async => Right(tRegimens));

    // act
    final result = await usecase.execute();

    // assert
    expect(result, Right(tRegimens));
    verify(mockRegimenRepository.getAllRegimens());
    verifyNoMoreInteractions(mockRegimenRepository);
  });
}
