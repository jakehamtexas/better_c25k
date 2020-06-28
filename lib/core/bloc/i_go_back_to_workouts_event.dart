import '../../domain/entities/common/common.dart';

abstract class IGoBackToWorkoutsEvent {
  final NameAndId<int> regimenNameAndId;

  IGoBackToWorkoutsEvent(this.regimenNameAndId);
}
