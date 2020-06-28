import 'package:better_c25k/core/error/error.dart';
import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/domain/repository/repository.dart';
import 'package:better_c25k/domain/usecases/exercise_sentence_builder.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ConcreteTextToSpeechService implements TextToSpeechService {
  final FlutterTts _flutterTts;
  @override
  bool isInitialized = false;

  ConcreteTextToSpeechService(this._flutterTts);

  @override
  Future<Either<Failure, void>> initialize({
    String language = "en-US",
    String voice = "en-us-x-sfg-network",
    double volume = .5,
    double pitch = 1.0,
    double rate = .5,
  }) async {
    try {
      final languages = await _flutterTts.getLanguages as List<dynamic>;
      if (languages.contains(language)) {
        await _flutterTts.setLanguage(language);
      } else {
        await _flutterTts.setLanguage(languages.first as String);
      }

      final voices = await _flutterTts.getVoices as List<dynamic>;
      if (voices.contains(voice)) {
        await _flutterTts.setVoice(voice);
      } else {
        await _flutterTts.setVoice(voices.first as String);
      }

      await _flutterTts.setVolume(volume);
      await _flutterTts.setPitch(pitch);
      await _flutterTts.setSpeechRate(rate);
      isInitialized = true;
      return right(null);
    } catch (_) {
      return left(TextToSpeechFailure.initializationFailure());
    }
  }

  @override
  Future<Either<Failure, void>> say(String speakable) async {
    if (speakable?.isEmpty ?? false) {
      left(TextToSpeechFailure.speakableStringInvalid());
    }
    try {
      await _flutterTts.speak(speakable);
      return right(null);
    } catch (_) {
      return left(TextToSpeechFailure.speechFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sayExercise(
      {ExerciseAction exerciseAction, int durationInSeconds}) async {
    if (!ExerciseAction.values.contains(exerciseAction) ||
        durationInSeconds == null ||
        durationInSeconds == 0) {
      return left(TextToSpeechFailure.exerciseInvalid());
    }
    final speakable = ExerciseSentenceBuilder()
        .withExercise(exerciseAction)
        .withDuration(durationInSeconds)
        .build();
    return say(speakable);
  }

  @override
  Future<Either<Failure, void>> sayWorkoutComplete() {
    return say("Workout completed!");
  }
}
