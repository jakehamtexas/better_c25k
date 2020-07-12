import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

import '../../../core/error/error.dart';
import '../../../core/extension/dartz/dartz.dart';
import '../../../domain/entities/preferences/preferences_entity.dart';
import '../../../domain/usecases/usecases.dart';
import '../../common/abstractions/has_preferences.dart';

part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {
  @override
  PreferencesState get initialState => PreferencesInitial();

  Future<Either<Failure, PreferencesEntity>> get _gettingPreferences =>
      GetIt.I<GetPreferences>()();

  PersistentBottomSheetController _controller;

  PreferencesEntity _unsavedPreferences;

  @override
  Stream<PreferencesState> mapEventToState(
    PreferencesEvent event,
  ) async* {
    switch (event.runtimeType) {
      case GetPreferencesEvent:
        yield* _getPreferences(event as GetPreferencesEvent);
        break;
      case PreferencesChangedEvent:
        yield* _preferencesChanged(event as PreferencesChangedEvent);
        break;
      case SaveSelectedEvent:
        yield* _saveSelected();
        break;
      case CancelSelectedEvent:
        yield* _cancelSelected(event as CancelSelectedEvent);
        break;
      case UpdateBottomSheetControllerEvent:
        _setController(event as UpdateBottomSheetControllerEvent);
        break;
      default:
        throw UnimplementedError();
    }
  }

  Stream<PreferencesState> _getPreferences(GetPreferencesEvent event) async* {
    final preferencesOrFailure = await _gettingPreferences;
    yield preferencesOrFailure.fold(
      (failure) => GetFailedState(),
      (preferences) => GetSucceededState(preferences),
    );
    if (preferencesOrFailure.isRight()) {
      _unsavedPreferences = preferencesOrFailure.getOrThrow();
    }
  }

  Stream<PreferencesState> _preferencesChanged(
      PreferencesChangedEvent event) async* {
    _unsavedPreferences = event.preferences;
    final preferencesOrFailure = await _gettingPreferences;
    if (preferencesOrFailure.isRight() &&
        preferencesOrFailure.getOrThrow() == _unsavedPreferences) {
      _closeSaveBar();
    } else if (_controller == null) {
      yield ShowSaveBarState();
    }

    yield GetSucceededState(_unsavedPreferences);
  }

  Stream<PreferencesState> _saveSelected() async* {
    final setPreferencesUseCase = GetIt.I<SetPreferences>();
    final potentialLeftFailure =
        await setPreferencesUseCase(_unsavedPreferences);
    if (potentialLeftFailure.isRight()) {
      _closeSaveBar();
      yield SaveSuccessfulState();
    } else {
      yield SaveFailedState();
    }
  }

  Stream<PreferencesState> _cancelSelected(CancelSelectedEvent event) async* {
    final preferencesOrFailure = await _gettingPreferences;
    if (preferencesOrFailure.isRight()) {
      final preferences = preferencesOrFailure.getOrThrow();
      yield GetSucceededState(preferences);
      _closeSaveBar();
      _unsavedPreferences = preferences;
    }
  }

  void _setController(UpdateBottomSheetControllerEvent event) {
    _controller = event.bottomSheetController;
  }

  void _closeSaveBar() {
    _controller?.close();
    _controller = null;
  }
}
