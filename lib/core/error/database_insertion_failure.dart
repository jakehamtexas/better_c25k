import 'error.dart';

class DatabaseInsertionFailure extends Failure {
  DatabaseInsertionFailure()
      : super(
          "An error occured when attempting to insert into the database!",
        );
}
