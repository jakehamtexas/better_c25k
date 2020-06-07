import 'package:get_it/get_it.dart';

import '../data/datasources/datasources.dart';
import '../data/repository/shared_preferences/app_state_repository.dart';
import '../domain/repository/repository.dart' as domain;

class Services {
  static register() {
    final getIt = GetIt.instance;
    getIt.registerSingleton<RegimenDatabase>(RegimenDatabase());
    getIt.registerSingleton<domain.AppStateRepository>(AppStateRepository());
    return getIt;
  }

  static unregister() {
    final getIt = GetIt.instance;
    getIt.unregister<RegimenDatabase>(disposingFunction: (db) => db.close());
  }
}
