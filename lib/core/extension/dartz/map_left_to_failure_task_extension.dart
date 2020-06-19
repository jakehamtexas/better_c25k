import 'package:dartz/dartz.dart';

import '../../error/error.dart';

extension MapLeftToFailureTaskExtension<TEither extends Either<Object, TRight>,
    TRight> on Task<TEither> {
  Task<Either<Failure, TRight>> mapLeftToFailure() {
    return map(
      (either) => either.leftMap((obj) {
        try {
          return obj as Failure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
