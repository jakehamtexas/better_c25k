import 'package:better_c25k/constant/exercise_action.dart';
import '../../domain/repository/text_to_speech_service.dart';

class SayWorkoutMeta {
  final TextToSpeechService textToSpeechService;
  const SayWorkoutMeta(this.textToSpeechService);
  Future<void> call(
      ExerciseAction exerciseAction, int durationInSeconds) async {
    if (!textToSpeechService.isInitialized) {
      final initializationFailureOrVoid =
          await textToSpeechService.initialize();
      if (initializationFailureOrVoid.isLeft()) {
        return;
      }
    }

    await textToSpeechService.sayExercise(
        exerciseAction: exerciseAction, durationInSeconds: durationInSeconds);
  }
}
