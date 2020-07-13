import 'package:better_c25k/core/error/error.dart';
import 'package:dartz/dartz.dart';

import '../entities/preferences/preferences_entity.dart';
import '../repository/repository.dart';

class GetPreferences {
  final AppStateRepository appStateRepository;

  GetPreferences(this.appStateRepository);

  Future<Either<Failure, PreferencesEntity>> call() {
    return appStateRepository.getPreferences();
  }
}
