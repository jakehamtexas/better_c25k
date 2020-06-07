import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/domain/entities/exercise/exercise.dart';
import 'package:better_c25k/domain/entities/regimen/regimen.dart';
import 'package:better_c25k/domain/entities/workout/workout.dart';
import 'package:better_c25k/domain/usecases/insert_regimen.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../mock/domain/repository/repository.dart';

const tName = "tName";
const tDescription = "tDescription";
final tExercise = ExerciseEntity(
  durationInSeconds: 0,
  exerciseAction: ExerciseAction.cooldown,
);
final tWorkouts = [
  WorkoutEntity(
    ordinalDayOfWeekNumber: 0,
    ordinalWeekNumber: 0,
    workoutId: 0,
    exercises: <ExerciseEntity>[tExercise],
  )
];
final tRegimensCompanion =
    RegimenEntity(name: tName, description: tDescription, workouts: tWorkouts);
final tExercisesByWorkoutId = {
  0: [tExercise]
};

void main() {
  MockRegimenRepository mockRegimenRepository;
  MockWorkoutRepository mockWorkoutRepository;
  MockExerciseRepository mockExerciseRepository;
  InsertRegimen usecase;

  setUp(() {
    mockRegimenRepository = MockRegimenRepository();
    mockWorkoutRepository = MockWorkoutRepository();
    mockExerciseRepository = MockExerciseRepository();

    usecase = InsertRegimen(
      exerciseRepository: mockExerciseRepository,
      regimenRepository: mockRegimenRepository,
      workoutRepository: mockWorkoutRepository,
    );
  });

  test('should insert a regimen into the respository', () async {
    // arrange
    when(mockRegimenRepository.insertRegimen(tRegimensCompanion))
        .thenAnswer((_) async => Right(0));
    when(mockWorkoutRepository.insertWorkouts(
            workoutEntities: tWorkouts, regimenId: 0))
        .thenAnswer((_) async => Right([0, 1]));
    when(mockExerciseRepository.insertExercisesByMap(tExercisesByWorkoutId))
        .thenAnswer((_) async => Right([0, 1]));

    // act
    final result = await usecase(tRegimensCompanion);

    // assert
    expect(result, Right(0));
    verify(mockRegimenRepository.insertRegimen(tRegimensCompanion));
    verify(mockWorkoutRepository.insertWorkouts(
        workoutEntities: tWorkouts, regimenId: 0));
    verify(mockExerciseRepository.insertExercisesByMap(tExercisesByWorkoutId));
    verifyNoMoreInteractions(mockRegimenRepository);
    verifyNoMoreInteractions(mockWorkoutRepository);
    verifyNoMoreInteractions(mockExerciseRepository);
  });
}
