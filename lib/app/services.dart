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
    getIt.registerSingleton<domain.AppStateRepository>(AppStateRepository());
    getIt.registerSingleton<domain.LocationService>(ConcreteLocationService());

    getIt.registerFactory<ContinuouslyInsertLocation>(() {
      final locationService = getIt<domain.LocationService>();
      final userLocationRepository =
          getIt<RegimenDatabase>().userLocationsRepository;
      return ContinuouslyInsertLocation(
        locationService: locationService,
        locationRepository: userLocationRepository,
      );
    });
    return getIt;
  }

  static void unregister() {
    final getIt = GetIt.instance;
    getIt.unregister<RegimenDatabase>(disposingFunction: (db) => db.close());
  }
}
