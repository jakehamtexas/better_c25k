import 'dart:async';

import 'package:better_c25k/presentation/error/error_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/common/common.dart';
import '../../../domain/usecases/initialize.dart';
import '../../router/routes.dart';

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
        LeftNavigateToDefaultErrorPage()(event.context),
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
