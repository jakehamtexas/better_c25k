import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  MapState get initialState => MapLoadingState();

  @override
  Stream<MapState> mapEventToState(
    MapEvent event,
  ) async* {
    switch (event.runtimeType) {
      case BeginMapLoadEvent:
        await _beginMapLoad();
        yield MapLoadingState();
        break;
      case MapLoadNetworkFailureEvent:
        yield NetworkErrorState();
        break;
      case MapLoadSuccessEvent:
        yield MapLoadedState((event as MapLoadSuccessEvent).polylines);
        break;
    }
  }
}
