import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/error/error.dart';
import '../../../domain/entities/common/common.dart';
import '../../../domain/usecases/usecases.dart';
import '../../router/routes.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is AppStartedEvent) {
      final initializeUsecase = GetIt.I<Initialize>();
      final regimenNameAndIdsOrFailure = await initializeUsecase(event.context);
      yield regimenNameAndIdsOrFailure.fold(
        (failure) => RegimenRetrievalFailureState(failure),
        (namesAndIds) => RegimenRetrievalSuccessState(namesAndIds),
      );
    }
    if (event is RegimenSelectedEvent) {
      Navigator.of(event.context).pushNamed(
        Routes.regimen,
        arguments: event.regimenNameAndId,
      );
    }
  }
}
