import 'failure.dart';

class LocationFailure extends Failure {
  const LocationFailure(String message) : super(message);
  factory LocationFailure.permissionDenied() {
    return const LocationFailure(
      "Permission is denied to access location data.",
    );
  }
}
