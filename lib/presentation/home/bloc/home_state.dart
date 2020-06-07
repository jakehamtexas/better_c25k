part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class RegimenRetrievalFailureState extends HomeState {
  List<Object> get props => [];
}

class RegimenRetrievalSuccessState extends HomeState {
  final List<NameAndId<int>> regimenNameAndIds;

  RegimenRetrievalSuccessState(this.regimenNameAndIds);
  List<Object> get props => [regimenNameAndIds];
}
