import 'package:dartz/dartz.dart';

import '../error/error.dart';

extension MapLeftToFailureTaskExtension<TEither extends Either<Object, TRight>,
    TRight, TFailure extends Failure> on Task<TEither> {
  Task<Either<TFailure, TRight>> mapLeftToFailure() {
    return this.map(
      (either) => either.leftMap((obj) {
        try {
          return obj as TFailure;
        } catch (e) {
          throw obj;
        }
      }),
    );
  }
}
