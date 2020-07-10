import 'package:better_c25k/core/error/error.dart';
import 'package:dartz/dartz.dart';

import '../entities/preferences/preferences_entity.dart';
import '../repository/repository.dart';

class SetPreferences {
  final AppStateRepository appStateRepository;
  const SetPreferences(this.appStateRepository);

  Future<Either<Failure, Null>> call(PreferencesEntity entity) {
    return appStateRepository.setPreferences(entity);
  }
}
