import 'package:dartz/dartz.dart';

import '../../core/error/error.dart';

abstract class AppStateRepository {
  Future<Either<Failure, bool>> getHasBeenInitialized();
  Future<Either<Failure, bool>> setHasBeenInitialized();
}
