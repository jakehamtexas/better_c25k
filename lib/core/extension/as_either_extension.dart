import 'package:better_c25k/core/error/error.dart';
import 'map_left_to_failure_task_extension.dart';
import 'package:dartz/dartz.dart';

extension AsEitherExtension<TFailure extends Failure, TRight> on Future<TRight> {
  Future<Either<TFailure, TRight>> asEither<TFailure>() {
    return Task<TRight>(() => this).attempt()._mapLeftToFailure<TFailure>().run();
  }
}
extension _MapLeftToFailureTaskExtension<TEither extends Either<Object, TRight>,
    TRight, TFailure extends Failure> on Task<TEither> {
  Task<Either<TFailure, TRight>> _mapLeftToFailure<TFailure>() {
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
