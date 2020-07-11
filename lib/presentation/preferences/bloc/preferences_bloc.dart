import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
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
        yield* _saveSelected(event as SaveSelectedEvent);
        break;
      case CancelSelectedEvent:
        yield* _cancelSelected(event as CancelSelectedEvent);
        break;
      default:
        throw UnimplementedError();
    }
  }

  Stream<PreferencesState> _getPreferences(GetPreferencesEvent event) async* {
    final preferencesOrFailure = await _gettingPreferences;
    yield preferencesOrFailure.fold(
      (failure) => GetFailedState(),
      (preferences) => HiddenSaveableButtonBarState(preferences),
    );
  }

  Stream<PreferencesState> _preferencesChanged(
      PreferencesChangedEvent event) async* {
    final preferencesOrFailure = await _gettingPreferences;
    if (preferencesOrFailure.isRight() &&
        preferencesOrFailure.getOrThrow() == event.preferences) {
      yield HiddenSaveableButtonBarState(event.preferences);
    } else {
      yield ShownSaveableButtonBarState(event.preferences);
    }
  }

  Stream<PreferencesState> _saveSelected(SaveSelectedEvent event) async* {
    final setPreferencesUseCase = GetIt.I<SetPreferences>();
    final potentialLeftFailure = await setPreferencesUseCase(event.preferences);
    yield potentialLeftFailure.fold(
      (_) => SaveFailedState(),
      (_) => SaveSuccessfulState(event.preferences),
    );
  }

  Stream<PreferencesState> _cancelSelected(CancelSelectedEvent event) async* {
    final preferencesOrFailure = await _gettingPreferences;
    if (preferencesOrFailure.isRight()) {
      yield HiddenSaveableButtonBarState(preferencesOrFailure.getOrThrow());
    }
  }
}
