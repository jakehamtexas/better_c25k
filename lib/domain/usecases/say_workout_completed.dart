import '../../domain/repository/text_to_speech_service.dart';

class SayWorkoutCompleted {
  final TextToSpeechService textToSpeechService;
  const SayWorkoutCompleted(this.textToSpeechService);
  Future<void> call() async {
    if (!textToSpeechService.isInitialized) {
      final initializationFailureOrVoid =
          await textToSpeechService.initialize();
      if (initializationFailureOrVoid.isLeft()) {
        return;
      }
    }

    await textToSpeechService.sayWorkoutComplete();
  }
}
