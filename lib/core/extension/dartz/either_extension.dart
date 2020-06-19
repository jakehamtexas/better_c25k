import 'package:dartz/dartz.dart';

extension GetOrThrow<TRight> on Either<Object, TRight> {
  TRight getOrThrow() => getOrElse(() => throw Error());
}

extension FoldWithValueRight<TLeft> on Either<TLeft, Object> {
  Either<TLeft, TRight> foldWithValueRight<TRight>([
    TRight rightValue,
  ]) =>
      fold(
        (l) => left(l),
        (_) => right(rightValue),
      );
}

extension FoldWithValueLeft<TRight> on Either<Object, TRight> {
  Either<TLeft, TRight> foldWithValueLeft<TLeft>([
    TLeft leftValue,
  ]) =>
      fold(
        (_) => left(leftValue),
        (r) => right(r),
      );
}

// TODO: Make this usable in a context where the fold function does not return Either
// TODO: Figure out if this is even possible
extension FoldWithFunctionRight<TLeft, TRight> on Either<TLeft, TRight> {
  Either<TLeft, TResultRight> foldWithFunctionRight<TResultRight>(
          Either<TLeft, TResultRight> Function(TRight) rightFunc) =>
      fold(
        (l) => left(l),
        rightFunc,
      );
}

extension FoldWithAsyncRightFunction<TLeft, TRight> on Either<TLeft, TRight> {
  Future<Either<TLeft, TResultRight>> foldWithAsyncFunctionRight<TResultRight>(
          Future<Either<TLeft, TResultRight>> Function(TRight) rightFunc) =>
      fold(
        (l) => Future(() => left(l)),
        rightFunc,
      );
}
