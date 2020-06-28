import 'package:get_it/get_it.dart';

import '../data/datasources/datasources.dart';
import '../data/repository/location/concrete_location_service.dart';
import '../data/repository/shared_preferences/app_state_repository.dart';
import '../domain/repository/repository.dart' as domain;
import '../domain/usecases/usecases.dart';

class Services {
  static GetIt register() {
    final getIt = GetIt.instance;
    getIt.registerSingleton<RegimenDatabase>(RegimenDatabase());
    getIt.registerSingleton<domain.RegimenRepository>(
        getIt<RegimenDatabase>().regimenRepository);
    getIt.registerSingleton<domain.WorkoutRepository>(
        getIt<RegimenDatabase>().workoutRepository);
    getIt.registerSingleton<domain.ExerciseRepository>(
        getIt<RegimenDatabase>().exerciseRepository);
    getIt.registerSingleton<domain.UserLocationsRepository>(
        getIt<RegimenDatabase>().userLocationsRepository);

    getIt.registerSingleton<domain.AppStateRepository>(AppStateRepository());
    getIt.registerSingleton<domain.LocationService>(ConcreteLocationService());

    getIt.registerFactory<GetWorkouts>(
        () => GetWorkouts(getIt<domain.WorkoutRepository>()));

    getIt.registerFactory<ContinuouslyInsertLocation>(() {
      final locationService = getIt<domain.LocationService>();
      final userLocationRepository = getIt<domain.UserLocationsRepository>();
      return ContinuouslyInsertLocation(
        locationService: locationService,
        locationRepository: userLocationRepository,
      );
    });
    getIt.registerFactory<UpdateCompletionStatusForWorkout>(() {
      final workoutRepository = getIt<domain.WorkoutRepository>();
      return UpdateCompletionStatusForWorkout(workoutRepository);
    });
    getIt.registerFactory<InsertRegimen>(() {
      final exerciseRepository = getIt<domain.ExerciseRepository>();
      final workoutRepository = getIt<domain.WorkoutRepository>();
      final regimenRepository = getIt<domain.RegimenRepository>();
      return InsertRegimen(
        exerciseRepository: exerciseRepository,
        regimenRepository: regimenRepository,
        workoutRepository: workoutRepository,
      );
    });
    getIt.registerFactory<GetRegimenNameAndIdForWorkoutId>(
      () => GetRegimenNameAndIdForWorkoutId(
        regimenRepository: getIt<domain.RegimenRepository>(),
        workoutRepository: getIt<domain.WorkoutRepository>(),
      ),
    );
    return getIt;
  }

  static void unregister() {
    final getIt = GetIt.instance;
    getIt.unregister<RegimenDatabase>(disposingFunction: (db) => db.close());
  }
}
