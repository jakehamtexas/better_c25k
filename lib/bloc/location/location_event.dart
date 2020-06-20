part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class AddLocationDataForWorkoutEvent extends LocationEvent {
  final int workoutId;
  const AddLocationDataForWorkoutEvent(this.workoutId);

  @override
  List<Object> get props => [workoutId];
}
