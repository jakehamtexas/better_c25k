import 'package:flutter/cupertino.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:soundpool/soundpool.dart';

import '../data/datasources/datasources.dart';
import '../data/repository/location/concrete_location_service.dart';
import '../data/repository/shared_preferences/app_state_repository.dart';
import '../data/repository/sound/concrete_sound_playing_service.dart';
import '../data/repository/text_to_speech/concrete_text_to_speech_service.dart';
import '../domain/repository/repository.dart' as domain;
import '../domain/usecases/usecases.dart';

class Services {
  static GetIt register() {
    _registerThirdParty();
    _registerMoor();
    _registerRepositories();
    _registerUsecases();
    return GetIt.I;
  }

  static void _registerUsecases() {
    GetIt.I.registerFactory<GetWorkouts>(
        () => GetWorkouts(GetIt.I<domain.WorkoutRepository>()));

    GetIt.I.registerFactory<ContinuouslyInsertLocation>(() {
      final locationService = GetIt.I<domain.LocationService>();
      final userLocationRepository = GetIt.I<domain.UserLocationsRepository>();
      return ContinuouslyInsertLocation(
        locationService: locationService,
        locationRepository: userLocationRepository,
      );
    });
    GetIt.I.registerFactory<UpdateCompletionStatusForWorkout>(() {
      final workoutRepository = GetIt.I<domain.WorkoutRepository>();
      return UpdateCompletionStatusForWorkout(workoutRepository);
    });
    GetIt.I.registerFactory<InsertRegimen>(() {
      final exerciseRepository = GetIt.I<domain.ExerciseRepository>();
      final workoutRepository = GetIt.I<domain.WorkoutRepository>();
      final regimenRepository = GetIt.I<domain.RegimenRepository>();
      return InsertRegimen(
        exerciseRepository: exerciseRepository,
        regimenRepository: regimenRepository,
        workoutRepository: workoutRepository,
      );
    });
    GetIt.I.registerFactory<GetRegimenNameAndIdForWorkoutId>(
      () => GetRegimenNameAndIdForWorkoutId(
        regimenRepository: GetIt.I<domain.RegimenRepository>(),
        workoutRepository: GetIt.I<domain.WorkoutRepository>(),
      ),
    );
    GetIt.I.registerFactory<SayWorkoutMeta>(
        () => SayWorkoutMeta(GetIt.I<domain.TextToSpeechService>()));
    GetIt.I.registerFactory<Initialize>(() => Initialize(
          appStateRepository: GetIt.I<domain.AppStateRepository>(),
          exerciseRepository: GetIt.I<domain.ExerciseRepository>(),
          regimenRepository: GetIt.I<domain.RegimenRepository>(),
          soundPlayingService: GetIt.I<domain.SoundPlayingService>(),
          workoutRepository: GetIt.I<domain.WorkoutRepository>(),
        ));
    GetIt.I.registerFactory<PlayDing>(
        () => PlayDing(GetIt.I<domain.SoundPlayingService>()));
    GetIt.I.registerFactory<SayWorkoutCompleted>(
        () => SayWorkoutCompleted(GetIt.I<domain.TextToSpeechService>()));
  }

  static void _registerRepositories() {
    GetIt.I.registerSingleton<domain.AppStateRepository>(AppStateRepository());
    GetIt.I
        .registerSingleton<domain.LocationService>(ConcreteLocationService());
    GetIt.I.registerSingleton<domain.TextToSpeechService>(
        ConcreteTextToSpeechService(GetIt.I<FlutterTts>()));
    GetIt.I.registerSingleton<domain.SoundPlayingService>(
        ConcreteSoundPlayingService(GetIt.I<Soundpool>()));
  }

  static void _registerMoor() {
    GetIt.I.registerSingleton<RegimenDatabase>(RegimenDatabase());
    GetIt.I.registerSingleton<domain.RegimenRepository>(
        GetIt.I<RegimenDatabase>().regimenRepository);
    GetIt.I.registerSingleton<domain.WorkoutRepository>(
        GetIt.I<RegimenDatabase>().workoutRepository);
    GetIt.I.registerSingleton<domain.ExerciseRepository>(
        GetIt.I<RegimenDatabase>().exerciseRepository);
    GetIt.I.registerSingleton<domain.UserLocationsRepository>(
        GetIt.I<RegimenDatabase>().userLocationsRepository);
  }

  static void _registerThirdParty() {
    WidgetsFlutterBinding.ensureInitialized();
    GetIt.I.registerSingleton<Soundpool>(Soundpool());
    GetIt.I.registerSingleton<FlutterTts>(FlutterTts());
  }

  static void unregister() {
    GetIt.I.unregister<RegimenDatabase>(disposingFunction: (db) => db.close());
  }
}
