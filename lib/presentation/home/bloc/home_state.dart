part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class RegimenRetrievalFailureState extends HomeState implements FailureState {
  const RegimenRetrievalFailureState(this.failure);
  @override
  List<Object> get props => [];

  @override
  final Failure failure;
}

class RegimenRetrievalSuccessState extends HomeState {
  final List<NameAndId<int>> regimenNameAndIds;

  const RegimenRetrievalSuccessState(this.regimenNameAndIds);
  @override
  List<Object> get props => [regimenNameAndIds];
}
