import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

import '../../constant/completion_status.dart';
import '../../constant/exercise_action.dart';
import '../repository/moor/moor.dart';
part 'regimen_database.g.dart';

int _getIntForEnumValue<TEnum>(List<TEnum> values, TEnum matchValue) =>
    values.indexWhere((value) => value == matchValue);

@DataClassName("RegimenModel")
class Regimens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name =>
      text().withLength(max: 50).customConstraint("UNIQUE")();
  TextColumn get description => text().withLength(max: 200).nullable()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  DateTimeColumn get dateCreated =>
      dateTime().withDefault(currentDateAndTime)();
}

@DataClassName("WorkoutModel")
class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get regimenId =>
      integer().customConstraint("REFERENCES regimens(id)")();
  TextColumn get description => text().withLength(max: 200).nullable()();
  IntColumn get weekNumber => integer().nullable()();
  IntColumn get dayNumber => integer().nullable()();
  DateTimeColumn get startTime => dateTime().nullable()();
  IntColumn get completionStatus =>
      intEnum<CompletionStatus>().clientDefault(() => _getIntForEnumValue(
            CompletionStatus.values,
            CompletionStatus.notStarted,
          ))();
}

@DataClassName("ExerciseModel")
class Exercises extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId =>
      integer().nullable().customConstraint("NULL REFERENCES workouts(id)")();
  IntColumn get durationInSeconds => integer()();
  IntColumn get exerciseAction => intEnum<ExerciseAction>()();
}

@UseMoor(
    tables: [Regimens, Workouts, Exercises],
    daos: [RegimenRepository, WorkoutRepository, ExerciseRepository])
class RegimenDatabase extends _$RegimenDatabase {
  RegimenDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
          path: "db.sqlite",
          logStatements: true,
        ));

  @override
  int get schemaVersion => 1;
}
