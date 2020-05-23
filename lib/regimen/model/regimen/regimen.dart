import '../workout.dart';

/// A regimen is a full suite of consecutive workouts.
/// A canonical example of this would be the Couch To 5K
/// workout regimen.
class Regimen {
  final List<Workout> workouts;

  Regimen(this.workouts);
}
