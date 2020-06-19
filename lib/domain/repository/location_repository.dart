import 'package:better_c25k/domain/entities/location/user_location.dart';

abstract class LocationRepository {
  insertLocation({
    UserLocation userLocation,
    int workoutId,
  }) {}
}
