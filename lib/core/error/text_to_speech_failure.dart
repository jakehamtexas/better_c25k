import 'package:better_c25k/core/error/error.dart';

class TextToSpeechFailure extends Failure {
  const TextToSpeechFailure(String message) : super(message);

  factory TextToSpeechFailure.initializationFailure() =>
      const TextToSpeechFailure("Text to speech initialization has failed.");
  factory TextToSpeechFailure.speechFailure() =>
      const TextToSpeechFailure("Text to speech speaking has failed.");
  factory TextToSpeechFailure.speakableStringInvalid() =>
      const TextToSpeechFailure("Speakable string is invalid");
  factory TextToSpeechFailure.exerciseInvalid() =>
      const TextToSpeechFailure("Exercise is invalid");
}
