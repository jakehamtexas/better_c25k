import 'package:better_c25k/presentation/map/bloc/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WorkoutMapNetworkError extends StatelessWidget {
  final int _exerciseId;
  const WorkoutMapNetworkError(this._exerciseId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Expanded(
          child: Text("There was a network error!"),
        ),
        Expanded(
          child: RawMaterialButton(
            onPressed: () {
              final bloc = BlocProvider.of(context);
              bloc.add(
                BeginMapLoadEvent(_exerciseId),
              );
            },
            child: const Text("Retry"),
          ),
        )
      ],
    );
  }
}
