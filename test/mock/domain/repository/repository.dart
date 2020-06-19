import 'package:better_c25k/domain/repository/repository.dart';
import 'package:mockito/mockito.dart';

//TODO: Write more tests for BLoCs

class MockRegimenRepository extends Mock implements RegimenRepository {}

class MockWorkoutRepository extends Mock implements WorkoutRepository {}

class MockExerciseRepository extends Mock implements ExerciseRepository {}

class MockLocationService extends Mock implements LocationService {}

class MockLocationRepository extends Mock implements LocationRepository {}
