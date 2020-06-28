import 'package:better_c25k/constant/exercise_action.dart';
import 'package:better_c25k/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

abstract class TextToSpeechService {
  bool isInitialized;
  Future<Either<Failure, void>> initialize();
  Future<Either<Failure, void>> sayExercise({
    @required ExerciseAction exerciseAction,
    @required int durationInSeconds,
  });
  Future<Either<Failure, void>> sayWorkoutComplete();
  Future<Either<Failure, void>> say(String speakable);
}
