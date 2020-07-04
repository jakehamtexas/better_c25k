part of 'map_bloc.dart';

abstract class MapState extends Equatable {
  const MapState();
}

class MapLoadingState extends MapState {
  @override
  List<Object> get props => [];
}

class MapLoadedState extends MapState {
  final Set<Polyline> polylines;
  const MapLoadedState(this.polylines);
  @override
  List<Object> get props => [];
}

class NetworkErrorState extends MapState {
  @override
  List<Object> get props => [];
}
