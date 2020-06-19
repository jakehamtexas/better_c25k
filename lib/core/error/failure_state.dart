import 'package:better_c25k/core/error/error.dart';
import 'package:equatable/equatable.dart';

abstract class FailureState implements Equatable {
  final Failure failure;
  FailureState(this.failure);
}
