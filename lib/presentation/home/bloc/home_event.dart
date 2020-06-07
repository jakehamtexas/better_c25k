part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class AppStartedEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class RegimenSelectedEvent extends HomeEvent {
  final int id;
  final BuildContext context;
  RegimenSelectedEvent({this.id, this.context});

  @override
  // TODO: implement props
  List<Object> get props => [id];
}
