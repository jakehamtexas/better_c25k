import 'error.dart';

class SharedPreferencesFailure extends Failure {
  const SharedPreferencesFailure(String message) : super(message);
  factory SharedPreferencesFailure.keyNotFound() =>
      const SharedPreferencesFailure(
        "The key was not found in shared_preferences when attempting to get or set!",
      );
}
