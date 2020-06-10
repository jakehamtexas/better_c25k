part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class AppStartedEvent extends HomeEvent {
  final BuildContext context;

  AppStartedEvent(this.context);
  @override
  List<Object> get props => [];
}

class RegimenSelectedEvent extends HomeEvent {
  final BuildContext context;
  final NameAndId regimenNameAndId;
  RegimenSelectedEvent({this.regimenNameAndId, this.context});

  @override
  List<Object> get props => [regimenNameAndId];
}
