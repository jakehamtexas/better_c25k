import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../app/router/routes.dart';
import '../../../domain/entities/common/common.dart';
import '../../../domain/usecases/initialize.dart';

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
      final regimenNameAndIdsOrFailure = await initializeUsecase();
      yield regimenNameAndIdsOrFailure.fold(
        (failure) => RegimenRetrievalFailureState(),
        (namesAndIds) => RegimenRetrievalSuccessState(namesAndIds),
      );
    }
    if (event is RegimenSelectedEvent) {
      Navigator.of(event.context).pushNamed(
        Routes.regimen,
        arguments: event.id,
      );
    }
  }
}
