part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class L extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationDataAddedSuccessState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationDataAddedFailureState extends LocationState
    implements FailureState {
  @override
  final Failure failure;

  const LocationDataAddedFailureState(this.failure);

  @override
  List<Object> get props => [failure];
}
