import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/map_bloc.dart';
import 'successful_workout_map.dart';
import 'workout_map_loading_indicator.dart';
import 'workout_map_network_error.dart';

class WorkoutMap extends StatelessWidget {
  const WorkoutMap(this._exerciseId, {Key key}) : super(key: key);

  final int _exerciseId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MapBloc>(
      create: (context) => MapBloc()
        ..add(
          BeginMapLoadEvent(_exerciseId),
        ),
      child: BlocBuilder<MapBloc, MapState>(
        builder: (context, state) {
          switch (state.runtimeType) {
            case MapLoadingState:
              return const WorkoutMapLoadingIndicator();
            case MapLoadedState:
              return const SuccessfulWorkoutMap();
            case NetworkErrorState:
              return const WorkoutMapNetworkError();
            default:
              return Container();
          }
        },
      ),
    );
  }
}
