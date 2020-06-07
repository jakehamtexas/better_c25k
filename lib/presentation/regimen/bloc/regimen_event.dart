part of 'regimen_bloc.dart';

abstract class RegimenEvent extends Equatable {
  const RegimenEvent();
}

class RegimenInitializedEvent extends RegimenEvent {
  final int regimenId;
  final BuildContext context;
  final GetWorkouts usecase;

  RegimenInitializedEvent({
    @required this.regimenId,
    @required this.context,
    @required this.usecase,
  });
  @override
  List<Object> get props => [regimenId];
}
