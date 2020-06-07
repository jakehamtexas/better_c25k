import 'dart:async';

import 'package:better_c25k/domain/usecases/initialize.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();
  final Initialize initializeUsecase;

  HomeBloc(this.initializeUsecase);

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      await initializeUsecase();
      yield HomeInitial();
    }
  }
}
