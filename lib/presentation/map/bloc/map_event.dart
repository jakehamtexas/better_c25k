part of 'map_bloc.dart';

abstract class MapEvent extends Equatable {
  const MapEvent();
}

class BeginMapLoadEvent extends MapEvent {
  final int exerciseId;
  const BeginMapLoadEvent(this.exerciseId);
  @override
  List<Object> get props => [exerciseId];
}

class MapLoadNetworkFailureEvent extends MapEvent {
  @override
  List<Object> get props => [];
}

class MapLoadSuccessEvent extends MapEvent {
  final Set<Polyline> polylines;
  const MapLoadSuccessEvent(this.polylines);
  @override
  List<Object> get props => [];
}
