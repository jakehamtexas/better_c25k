import 'error.dart';

class DatabaseInsertionFailure extends Failure {
  static const _baseMessage =
      "An error occured when attempting to insert into the database!";
  const DatabaseInsertionFailure([String message = _baseMessage])
      : super(
          message,
        );
  factory DatabaseInsertionFailure.regimenInsertionFailure() =>
      DatabaseInsertionFailure(
        _getExtendedMessage("The regimen failed to be inserted."),
      );

  factory DatabaseInsertionFailure.workoutsInsertionFailure() =>
      DatabaseInsertionFailure(
        _getExtendedMessage("The workouts failed to be inserted."),
      );

  factory DatabaseInsertionFailure.exercisesInsertionFailure() =>
      DatabaseInsertionFailure(
        _getExtendedMessage("The exercises failed to be inserted."),
      );

  factory DatabaseInsertionFailure.operationsOutOfOrderFailure() =>
      DatabaseInsertionFailure(
        _getExtendedMessage("Some insertion operations were not completed."),
      );

  static String _getExtendedMessage(String message) =>
      "$_baseMessage \n $message";
}
