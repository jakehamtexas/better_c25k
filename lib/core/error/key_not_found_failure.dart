import 'error.dart';

class KeyNotFoundFailure extends Failure {
  const KeyNotFoundFailure()
      : super(
          "The key was not found in shared_preferences when attempting to get or set!",
        );
}
