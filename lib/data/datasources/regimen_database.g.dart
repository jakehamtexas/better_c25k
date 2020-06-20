// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regimen_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class RegimenModel extends DataClass implements Insertable<RegimenModel> {
  final int id;
  final String name;
  final String description;
  final bool isCompleted;
  final DateTime dateCreated;
  RegimenModel(
      {@required this.id,
      @required this.name,
      this.description,
      @required this.isCompleted,
      @required this.dateCreated});
  factory RegimenModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final boolType = db.typeSystem.forDartType<bool>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return RegimenModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      isCompleted: boolType
          .mapFromDatabaseResponse(data['${effectivePrefix}is_completed']),
      dateCreated: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}date_created']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || isCompleted != null) {
      map['is_completed'] = Variable<bool>(isCompleted);
    }
    if (!nullToAbsent || dateCreated != null) {
      map['date_created'] = Variable<DateTime>(dateCreated);
    }
    return map;
  }

  RegimensCompanion toCompanion(bool nullToAbsent) {
    return RegimensCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      isCompleted: isCompleted == null && nullToAbsent
          ? const Value.absent()
          : Value(isCompleted),
      dateCreated: dateCreated == null && nullToAbsent
          ? const Value.absent()
          : Value(dateCreated),
    );
  }

  factory RegimenModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return RegimenModel(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
    };
  }

  RegimenModel copyWith(
          {int id,
          String name,
          String description,
          bool isCompleted,
          DateTime dateCreated}) =>
      RegimenModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        isCompleted: isCompleted ?? this.isCompleted,
        dateCreated: dateCreated ?? this.dateCreated,
      );
  @override
  String toString() {
    return (StringBuffer('RegimenModel(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(description.hashCode,
              $mrjc(isCompleted.hashCode, dateCreated.hashCode)))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is RegimenModel &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.isCompleted == this.isCompleted &&
          other.dateCreated == this.dateCreated);
}

class RegimensCompanion extends UpdateCompanion<RegimenModel> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  final Value<bool> isCompleted;
  final Value<DateTime> dateCreated;
  const RegimensCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCreated = const Value.absent(),
  });
  RegimensCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    this.description = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.dateCreated = const Value.absent(),
  }) : name = Value(name);
  static Insertable<RegimenModel> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<String> description,
    Expression<bool> isCompleted,
    Expression<DateTime> dateCreated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (dateCreated != null) 'date_created': dateCreated,
    });
  }

  RegimensCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<String> description,
      Value<bool> isCompleted,
      Value<DateTime> dateCreated}) {
    return RegimensCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
    }
    return map;
  }
}

class $RegimensTable extends Regimens
    with TableInfo<$RegimensTable, RegimenModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $RegimensTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn('name', $tableName, false,
        maxTextLength: 50, $customConstraints: 'UNIQUE');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        maxTextLength: 200);
  }

  final VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  GeneratedBoolColumn _isCompleted;
  @override
  GeneratedBoolColumn get isCompleted =>
      _isCompleted ??= _constructIsCompleted();
  GeneratedBoolColumn _constructIsCompleted() {
    return GeneratedBoolColumn('is_completed', $tableName, false,
        defaultValue: const Constant(false));
  }

  final VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  GeneratedDateTimeColumn _dateCreated;
  @override
  GeneratedDateTimeColumn get dateCreated =>
      _dateCreated ??= _constructDateCreated();
  GeneratedDateTimeColumn _constructDateCreated() {
    return GeneratedDateTimeColumn('date_created', $tableName, false,
        defaultValue: currentDateAndTime);
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, isCompleted, dateCreated];
  @override
  $RegimensTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'regimens';
  @override
  final String actualTableName = 'regimens';
  @override
  VerificationContext validateIntegrity(Insertable<RegimenModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed'], _isCompletedMeta));
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created'], _dateCreatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RegimenModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return RegimenModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $RegimensTable createAlias(String alias) {
    return $RegimensTable(_db, alias);
  }
}

class WorkoutModel extends DataClass implements Insertable<WorkoutModel> {
  final int id;
  final int regimenId;
  final String description;
  final int weekNumber;
  final int dayNumber;
  final DateTime startTime;
  final CompletionStatus completionStatus;
  WorkoutModel(
      {@required this.id,
      @required this.regimenId,
      this.description,
      this.weekNumber,
      this.dayNumber,
      this.startTime,
      @required this.completionStatus});
  factory WorkoutModel.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return WorkoutModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      regimenId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}regimen_id']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      weekNumber: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}week_number']),
      dayNumber:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}day_number']),
      startTime: dateTimeType
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      completionStatus: $WorkoutsTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(
              data['${effectivePrefix}completion_status'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || regimenId != null) {
      map['regimen_id'] = Variable<int>(regimenId);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || weekNumber != null) {
      map['week_number'] = Variable<int>(weekNumber);
    }
    if (!nullToAbsent || dayNumber != null) {
      map['day_number'] = Variable<int>(dayNumber);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || completionStatus != null) {
      final converter = $WorkoutsTable.$converter0;
      map['completion_status'] =
          Variable<int>(converter.mapToSql(completionStatus));
    }
    return map;
  }

  WorkoutsCompanion toCompanion(bool nullToAbsent) {
    return WorkoutsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      regimenId: regimenId == null && nullToAbsent
          ? const Value.absent()
          : Value(regimenId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      weekNumber: weekNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(weekNumber),
      dayNumber: dayNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(dayNumber),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      completionStatus: completionStatus == null && nullToAbsent
          ? const Value.absent()
          : Value(completionStatus),
    );
  }

  factory WorkoutModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return WorkoutModel(
      id: serializer.fromJson<int>(json['id']),
      regimenId: serializer.fromJson<int>(json['regimenId']),
      description: serializer.fromJson<String>(json['description']),
      weekNumber: serializer.fromJson<int>(json['weekNumber']),
      dayNumber: serializer.fromJson<int>(json['dayNumber']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      completionStatus:
          serializer.fromJson<CompletionStatus>(json['completionStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'regimenId': serializer.toJson<int>(regimenId),
      'description': serializer.toJson<String>(description),
      'weekNumber': serializer.toJson<int>(weekNumber),
      'dayNumber': serializer.toJson<int>(dayNumber),
      'startTime': serializer.toJson<DateTime>(startTime),
      'completionStatus': serializer.toJson<CompletionStatus>(completionStatus),
    };
  }

  WorkoutModel copyWith(
          {int id,
          int regimenId,
          String description,
          int weekNumber,
          int dayNumber,
          DateTime startTime,
          CompletionStatus completionStatus}) =>
      WorkoutModel(
        id: id ?? this.id,
        regimenId: regimenId ?? this.regimenId,
        description: description ?? this.description,
        weekNumber: weekNumber ?? this.weekNumber,
        dayNumber: dayNumber ?? this.dayNumber,
        startTime: startTime ?? this.startTime,
        completionStatus: completionStatus ?? this.completionStatus,
      );
  @override
  String toString() {
    return (StringBuffer('WorkoutModel(')
          ..write('id: $id, ')
          ..write('regimenId: $regimenId, ')
          ..write('description: $description, ')
          ..write('weekNumber: $weekNumber, ')
          ..write('dayNumber: $dayNumber, ')
          ..write('startTime: $startTime, ')
          ..write('completionStatus: $completionStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          regimenId.hashCode,
          $mrjc(
              description.hashCode,
              $mrjc(
                  weekNumber.hashCode,
                  $mrjc(
                      dayNumber.hashCode,
                      $mrjc(
                          startTime.hashCode, completionStatus.hashCode)))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is WorkoutModel &&
          other.id == this.id &&
          other.regimenId == this.regimenId &&
          other.description == this.description &&
          other.weekNumber == this.weekNumber &&
          other.dayNumber == this.dayNumber &&
          other.startTime == this.startTime &&
          other.completionStatus == this.completionStatus);
}

class WorkoutsCompanion extends UpdateCompanion<WorkoutModel> {
  final Value<int> id;
  final Value<int> regimenId;
  final Value<String> description;
  final Value<int> weekNumber;
  final Value<int> dayNumber;
  final Value<DateTime> startTime;
  final Value<CompletionStatus> completionStatus;
  const WorkoutsCompanion({
    this.id = const Value.absent(),
    this.regimenId = const Value.absent(),
    this.description = const Value.absent(),
    this.weekNumber = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.startTime = const Value.absent(),
    this.completionStatus = const Value.absent(),
  });
  WorkoutsCompanion.insert({
    this.id = const Value.absent(),
    @required int regimenId,
    this.description = const Value.absent(),
    this.weekNumber = const Value.absent(),
    this.dayNumber = const Value.absent(),
    this.startTime = const Value.absent(),
    this.completionStatus = const Value.absent(),
  }) : regimenId = Value(regimenId);
  static Insertable<WorkoutModel> custom({
    Expression<int> id,
    Expression<int> regimenId,
    Expression<String> description,
    Expression<int> weekNumber,
    Expression<int> dayNumber,
    Expression<DateTime> startTime,
    Expression<int> completionStatus,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (regimenId != null) 'regimen_id': regimenId,
      if (description != null) 'description': description,
      if (weekNumber != null) 'week_number': weekNumber,
      if (dayNumber != null) 'day_number': dayNumber,
      if (startTime != null) 'start_time': startTime,
      if (completionStatus != null) 'completion_status': completionStatus,
    });
  }

  WorkoutsCompanion copyWith(
      {Value<int> id,
      Value<int> regimenId,
      Value<String> description,
      Value<int> weekNumber,
      Value<int> dayNumber,
      Value<DateTime> startTime,
      Value<CompletionStatus> completionStatus}) {
    return WorkoutsCompanion(
      id: id ?? this.id,
      regimenId: regimenId ?? this.regimenId,
      description: description ?? this.description,
      weekNumber: weekNumber ?? this.weekNumber,
      dayNumber: dayNumber ?? this.dayNumber,
      startTime: startTime ?? this.startTime,
      completionStatus: completionStatus ?? this.completionStatus,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (regimenId.present) {
      map['regimen_id'] = Variable<int>(regimenId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (weekNumber.present) {
      map['week_number'] = Variable<int>(weekNumber.value);
    }
    if (dayNumber.present) {
      map['day_number'] = Variable<int>(dayNumber.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (completionStatus.present) {
      final converter = $WorkoutsTable.$converter0;
      map['completion_status'] =
          Variable<int>(converter.mapToSql(completionStatus.value));
    }
    return map;
  }
}

class $WorkoutsTable extends Workouts
    with TableInfo<$WorkoutsTable, WorkoutModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $WorkoutsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _regimenIdMeta = const VerificationMeta('regimenId');
  GeneratedIntColumn _regimenId;
  @override
  GeneratedIntColumn get regimenId => _regimenId ??= _constructRegimenId();
  GeneratedIntColumn _constructRegimenId() {
    return GeneratedIntColumn('regimen_id', $tableName, false,
        $customConstraints: 'REFERENCES regimens(id)');
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn('description', $tableName, true,
        maxTextLength: 200);
  }

  final VerificationMeta _weekNumberMeta = const VerificationMeta('weekNumber');
  GeneratedIntColumn _weekNumber;
  @override
  GeneratedIntColumn get weekNumber => _weekNumber ??= _constructWeekNumber();
  GeneratedIntColumn _constructWeekNumber() {
    return GeneratedIntColumn(
      'week_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _dayNumberMeta = const VerificationMeta('dayNumber');
  GeneratedIntColumn _dayNumber;
  @override
  GeneratedIntColumn get dayNumber => _dayNumber ??= _constructDayNumber();
  GeneratedIntColumn _constructDayNumber() {
    return GeneratedIntColumn(
      'day_number',
      $tableName,
      true,
    );
  }

  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  GeneratedDateTimeColumn _startTime;
  @override
  GeneratedDateTimeColumn get startTime => _startTime ??= _constructStartTime();
  GeneratedDateTimeColumn _constructStartTime() {
    return GeneratedDateTimeColumn(
      'start_time',
      $tableName,
      true,
    );
  }

  final VerificationMeta _completionStatusMeta =
      const VerificationMeta('completionStatus');
  GeneratedIntColumn _completionStatus;
  @override
  GeneratedIntColumn get completionStatus =>
      _completionStatus ??= _constructCompletionStatus();
  GeneratedIntColumn _constructCompletionStatus() {
    return GeneratedIntColumn(
      'completion_status',
      $tableName,
      false,
    )..clientDefault = () => _getIntForEnumValue(
        CompletionStatus.values, CompletionStatus.notStarted);
  }

  @override
  List<GeneratedColumn> get $columns => [
        id,
        regimenId,
        description,
        weekNumber,
        dayNumber,
        startTime,
        completionStatus
      ];
  @override
  $WorkoutsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'workouts';
  @override
  final String actualTableName = 'workouts';
  @override
  VerificationContext validateIntegrity(Insertable<WorkoutModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('regimen_id')) {
      context.handle(_regimenIdMeta,
          regimenId.isAcceptableOrUnknown(data['regimen_id'], _regimenIdMeta));
    } else if (isInserting) {
      context.missing(_regimenIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    }
    if (data.containsKey('week_number')) {
      context.handle(
          _weekNumberMeta,
          weekNumber.isAcceptableOrUnknown(
              data['week_number'], _weekNumberMeta));
    }
    if (data.containsKey('day_number')) {
      context.handle(_dayNumberMeta,
          dayNumber.isAcceptableOrUnknown(data['day_number'], _dayNumberMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time'], _startTimeMeta));
    }
    context.handle(_completionStatusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkoutModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return WorkoutModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $WorkoutsTable createAlias(String alias) {
    return $WorkoutsTable(_db, alias);
  }

  static TypeConverter<CompletionStatus, int> $converter0 =
      const EnumIndexConverter<CompletionStatus>(CompletionStatus.values);
}

class ExerciseModel extends DataClass implements Insertable<ExerciseModel> {
  final int id;
  final int workoutId;
  final int durationInSeconds;
  final ExerciseAction exerciseAction;
  ExerciseModel(
      {@required this.id,
      this.workoutId,
      @required this.durationInSeconds,
      @required this.exerciseAction});
  factory ExerciseModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    return ExerciseModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      workoutId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}workout_id']),
      durationInSeconds: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}duration_in_seconds']),
      exerciseAction: $ExercisesTable.$converter0.mapToDart(intType
          .mapFromDatabaseResponse(data['${effectivePrefix}exercise_action'])),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    if (!nullToAbsent || durationInSeconds != null) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds);
    }
    if (!nullToAbsent || exerciseAction != null) {
      final converter = $ExercisesTable.$converter0;
      map['exercise_action'] =
          Variable<int>(converter.mapToSql(exerciseAction));
    }
    return map;
  }

  ExercisesCompanion toCompanion(bool nullToAbsent) {
    return ExercisesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      durationInSeconds: durationInSeconds == null && nullToAbsent
          ? const Value.absent()
          : Value(durationInSeconds),
      exerciseAction: exerciseAction == null && nullToAbsent
          ? const Value.absent()
          : Value(exerciseAction),
    );
  }

  factory ExerciseModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ExerciseModel(
      id: serializer.fromJson<int>(json['id']),
      workoutId: serializer.fromJson<int>(json['workoutId']),
      durationInSeconds: serializer.fromJson<int>(json['durationInSeconds']),
      exerciseAction:
          serializer.fromJson<ExerciseAction>(json['exerciseAction']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutId': serializer.toJson<int>(workoutId),
      'durationInSeconds': serializer.toJson<int>(durationInSeconds),
      'exerciseAction': serializer.toJson<ExerciseAction>(exerciseAction),
    };
  }

  ExerciseModel copyWith(
          {int id,
          int workoutId,
          int durationInSeconds,
          ExerciseAction exerciseAction}) =>
      ExerciseModel(
        id: id ?? this.id,
        workoutId: workoutId ?? this.workoutId,
        durationInSeconds: durationInSeconds ?? this.durationInSeconds,
        exerciseAction: exerciseAction ?? this.exerciseAction,
      );
  @override
  String toString() {
    return (StringBuffer('ExerciseModel(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('durationInSeconds: $durationInSeconds, ')
          ..write('exerciseAction: $exerciseAction')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(workoutId.hashCode,
          $mrjc(durationInSeconds.hashCode, exerciseAction.hashCode))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ExerciseModel &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.durationInSeconds == this.durationInSeconds &&
          other.exerciseAction == this.exerciseAction);
}

class ExercisesCompanion extends UpdateCompanion<ExerciseModel> {
  final Value<int> id;
  final Value<int> workoutId;
  final Value<int> durationInSeconds;
  final Value<ExerciseAction> exerciseAction;
  const ExercisesCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.durationInSeconds = const Value.absent(),
    this.exerciseAction = const Value.absent(),
  });
  ExercisesCompanion.insert({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    @required int durationInSeconds,
    @required ExerciseAction exerciseAction,
  })  : durationInSeconds = Value(durationInSeconds),
        exerciseAction = Value(exerciseAction);
  static Insertable<ExerciseModel> custom({
    Expression<int> id,
    Expression<int> workoutId,
    Expression<int> durationInSeconds,
    Expression<int> exerciseAction,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (durationInSeconds != null) 'duration_in_seconds': durationInSeconds,
      if (exerciseAction != null) 'exercise_action': exerciseAction,
    });
  }

  ExercisesCompanion copyWith(
      {Value<int> id,
      Value<int> workoutId,
      Value<int> durationInSeconds,
      Value<ExerciseAction> exerciseAction}) {
    return ExercisesCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      durationInSeconds: durationInSeconds ?? this.durationInSeconds,
      exerciseAction: exerciseAction ?? this.exerciseAction,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (durationInSeconds.present) {
      map['duration_in_seconds'] = Variable<int>(durationInSeconds.value);
    }
    if (exerciseAction.present) {
      final converter = $ExercisesTable.$converter0;
      map['exercise_action'] =
          Variable<int>(converter.mapToSql(exerciseAction.value));
    }
    return map;
  }
}

class $ExercisesTable extends Exercises
    with TableInfo<$ExercisesTable, ExerciseModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $ExercisesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _workoutIdMeta = const VerificationMeta('workoutId');
  GeneratedIntColumn _workoutId;
  @override
  GeneratedIntColumn get workoutId => _workoutId ??= _constructWorkoutId();
  GeneratedIntColumn _constructWorkoutId() {
    return GeneratedIntColumn('workout_id', $tableName, true,
        $customConstraints: 'NULL REFERENCES workouts(id)');
  }

  final VerificationMeta _durationInSecondsMeta =
      const VerificationMeta('durationInSeconds');
  GeneratedIntColumn _durationInSeconds;
  @override
  GeneratedIntColumn get durationInSeconds =>
      _durationInSeconds ??= _constructDurationInSeconds();
  GeneratedIntColumn _constructDurationInSeconds() {
    return GeneratedIntColumn(
      'duration_in_seconds',
      $tableName,
      false,
    );
  }

  final VerificationMeta _exerciseActionMeta =
      const VerificationMeta('exerciseAction');
  GeneratedIntColumn _exerciseAction;
  @override
  GeneratedIntColumn get exerciseAction =>
      _exerciseAction ??= _constructExerciseAction();
  GeneratedIntColumn _constructExerciseAction() {
    return GeneratedIntColumn(
      'exercise_action',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, workoutId, durationInSeconds, exerciseAction];
  @override
  $ExercisesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'exercises';
  @override
  final String actualTableName = 'exercises';
  @override
  VerificationContext validateIntegrity(Insertable<ExerciseModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id'], _workoutIdMeta));
    }
    if (data.containsKey('duration_in_seconds')) {
      context.handle(
          _durationInSecondsMeta,
          durationInSeconds.isAcceptableOrUnknown(
              data['duration_in_seconds'], _durationInSecondsMeta));
    } else if (isInserting) {
      context.missing(_durationInSecondsMeta);
    }
    context.handle(_exerciseActionMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExerciseModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ExerciseModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ExercisesTable createAlias(String alias) {
    return $ExercisesTable(_db, alias);
  }

  static TypeConverter<ExerciseAction, int> $converter0 =
      const EnumIndexConverter<ExerciseAction>(ExerciseAction.values);
}

class UserLocationModel extends DataClass
    implements Insertable<UserLocationModel> {
  final int id;
  final int workoutId;
  final double latitude;
  final double longitude;
  final double speedInMetersPerSecond;
  final DateTime time;
  UserLocationModel(
      {@required this.id,
      @required this.workoutId,
      @required this.latitude,
      @required this.longitude,
      @required this.speedInMetersPerSecond,
      @required this.time});
  factory UserLocationModel.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final doubleType = db.typeSystem.forDartType<double>();
    final dateTimeType = db.typeSystem.forDartType<DateTime>();
    return UserLocationModel(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      workoutId:
          intType.mapFromDatabaseResponse(data['${effectivePrefix}workout_id']),
      latitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}latitude']),
      longitude: doubleType
          .mapFromDatabaseResponse(data['${effectivePrefix}longitude']),
      speedInMetersPerSecond: doubleType.mapFromDatabaseResponse(
          data['${effectivePrefix}speed_in_meters_per_second']),
      time:
          dateTimeType.mapFromDatabaseResponse(data['${effectivePrefix}time']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || workoutId != null) {
      map['workout_id'] = Variable<int>(workoutId);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || speedInMetersPerSecond != null) {
      map['speed_in_meters_per_second'] =
          Variable<double>(speedInMetersPerSecond);
    }
    if (!nullToAbsent || time != null) {
      map['time'] = Variable<DateTime>(time);
    }
    return map;
  }

  UserLocationsCompanion toCompanion(bool nullToAbsent) {
    return UserLocationsCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      workoutId: workoutId == null && nullToAbsent
          ? const Value.absent()
          : Value(workoutId),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      speedInMetersPerSecond: speedInMetersPerSecond == null && nullToAbsent
          ? const Value.absent()
          : Value(speedInMetersPerSecond),
      time: time == null && nullToAbsent ? const Value.absent() : Value(time),
    );
  }

  factory UserLocationModel.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return UserLocationModel(
      id: serializer.fromJson<int>(json['id']),
      workoutId: serializer.fromJson<int>(json['workoutId']),
      latitude: serializer.fromJson<double>(json['latitude']),
      longitude: serializer.fromJson<double>(json['longitude']),
      speedInMetersPerSecond:
          serializer.fromJson<double>(json['speedInMetersPerSecond']),
      time: serializer.fromJson<DateTime>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workoutId': serializer.toJson<int>(workoutId),
      'latitude': serializer.toJson<double>(latitude),
      'longitude': serializer.toJson<double>(longitude),
      'speedInMetersPerSecond':
          serializer.toJson<double>(speedInMetersPerSecond),
      'time': serializer.toJson<DateTime>(time),
    };
  }

  UserLocationModel copyWith(
          {int id,
          int workoutId,
          double latitude,
          double longitude,
          double speedInMetersPerSecond,
          DateTime time}) =>
      UserLocationModel(
        id: id ?? this.id,
        workoutId: workoutId ?? this.workoutId,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        speedInMetersPerSecond:
            speedInMetersPerSecond ?? this.speedInMetersPerSecond,
        time: time ?? this.time,
      );
  @override
  String toString() {
    return (StringBuffer('UserLocationModel(')
          ..write('id: $id, ')
          ..write('workoutId: $workoutId, ')
          ..write('latitude: $latitude, ')
          ..write('longitude: $longitude, ')
          ..write('speedInMetersPerSecond: $speedInMetersPerSecond, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          workoutId.hashCode,
          $mrjc(
              latitude.hashCode,
              $mrjc(longitude.hashCode,
                  $mrjc(speedInMetersPerSecond.hashCode, time.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is UserLocationModel &&
          other.id == this.id &&
          other.workoutId == this.workoutId &&
          other.latitude == this.latitude &&
          other.longitude == this.longitude &&
          other.speedInMetersPerSecond == this.speedInMetersPerSecond &&
          other.time == this.time);
}

class UserLocationsCompanion extends UpdateCompanion<UserLocationModel> {
  final Value<int> id;
  final Value<int> workoutId;
  final Value<double> latitude;
  final Value<double> longitude;
  final Value<double> speedInMetersPerSecond;
  final Value<DateTime> time;
  const UserLocationsCompanion({
    this.id = const Value.absent(),
    this.workoutId = const Value.absent(),
    this.latitude = const Value.absent(),
    this.longitude = const Value.absent(),
    this.speedInMetersPerSecond = const Value.absent(),
    this.time = const Value.absent(),
  });
  UserLocationsCompanion.insert({
    this.id = const Value.absent(),
    @required int workoutId,
    @required double latitude,
    @required double longitude,
    @required double speedInMetersPerSecond,
    @required DateTime time,
  })  : workoutId = Value(workoutId),
        latitude = Value(latitude),
        longitude = Value(longitude),
        speedInMetersPerSecond = Value(speedInMetersPerSecond),
        time = Value(time);
  static Insertable<UserLocationModel> custom({
    Expression<int> id,
    Expression<int> workoutId,
    Expression<double> latitude,
    Expression<double> longitude,
    Expression<double> speedInMetersPerSecond,
    Expression<DateTime> time,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workoutId != null) 'workout_id': workoutId,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (speedInMetersPerSecond != null)
        'speed_in_meters_per_second': speedInMetersPerSecond,
      if (time != null) 'time': time,
    });
  }

  UserLocationsCompanion copyWith(
      {Value<int> id,
      Value<int> workoutId,
      Value<double> latitude,
      Value<double> longitude,
      Value<double> speedInMetersPerSecond,
      Value<DateTime> time}) {
    return UserLocationsCompanion(
      id: id ?? this.id,
      workoutId: workoutId ?? this.workoutId,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      speedInMetersPerSecond:
          speedInMetersPerSecond ?? this.speedInMetersPerSecond,
      time: time ?? this.time,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workoutId.present) {
      map['workout_id'] = Variable<int>(workoutId.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (speedInMetersPerSecond.present) {
      map['speed_in_meters_per_second'] =
          Variable<double>(speedInMetersPerSecond.value);
    }
    if (time.present) {
      map['time'] = Variable<DateTime>(time.value);
    }
    return map;
  }
}

class $UserLocationsTable extends UserLocations
    with TableInfo<$UserLocationsTable, UserLocationModel> {
  final GeneratedDatabase _db;
  final String _alias;
  $UserLocationsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _workoutIdMeta = const VerificationMeta('workoutId');
  GeneratedIntColumn _workoutId;
  @override
  GeneratedIntColumn get workoutId => _workoutId ??= _constructWorkoutId();
  GeneratedIntColumn _constructWorkoutId() {
    return GeneratedIntColumn('workout_id', $tableName, false,
        $customConstraints: 'REFERENCES workouts(id)');
  }

  final VerificationMeta _latitudeMeta = const VerificationMeta('latitude');
  GeneratedRealColumn _latitude;
  @override
  GeneratedRealColumn get latitude => _latitude ??= _constructLatitude();
  GeneratedRealColumn _constructLatitude() {
    return GeneratedRealColumn(
      'latitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _longitudeMeta = const VerificationMeta('longitude');
  GeneratedRealColumn _longitude;
  @override
  GeneratedRealColumn get longitude => _longitude ??= _constructLongitude();
  GeneratedRealColumn _constructLongitude() {
    return GeneratedRealColumn(
      'longitude',
      $tableName,
      false,
    );
  }

  final VerificationMeta _speedInMetersPerSecondMeta =
      const VerificationMeta('speedInMetersPerSecond');
  GeneratedRealColumn _speedInMetersPerSecond;
  @override
  GeneratedRealColumn get speedInMetersPerSecond =>
      _speedInMetersPerSecond ??= _constructSpeedInMetersPerSecond();
  GeneratedRealColumn _constructSpeedInMetersPerSecond() {
    return GeneratedRealColumn(
      'speed_in_meters_per_second',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeMeta = const VerificationMeta('time');
  GeneratedDateTimeColumn _time;
  @override
  GeneratedDateTimeColumn get time => _time ??= _constructTime();
  GeneratedDateTimeColumn _constructTime() {
    return GeneratedDateTimeColumn(
      'time',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, workoutId, latitude, longitude, speedInMetersPerSecond, time];
  @override
  $UserLocationsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'user_locations';
  @override
  final String actualTableName = 'user_locations';
  @override
  VerificationContext validateIntegrity(Insertable<UserLocationModel> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('workout_id')) {
      context.handle(_workoutIdMeta,
          workoutId.isAcceptableOrUnknown(data['workout_id'], _workoutIdMeta));
    } else if (isInserting) {
      context.missing(_workoutIdMeta);
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude'], _latitudeMeta));
    } else if (isInserting) {
      context.missing(_latitudeMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude'], _longitudeMeta));
    } else if (isInserting) {
      context.missing(_longitudeMeta);
    }
    if (data.containsKey('speed_in_meters_per_second')) {
      context.handle(
          _speedInMetersPerSecondMeta,
          speedInMetersPerSecond.isAcceptableOrUnknown(
              data['speed_in_meters_per_second'], _speedInMetersPerSecondMeta));
    } else if (isInserting) {
      context.missing(_speedInMetersPerSecondMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time'], _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserLocationModel map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return UserLocationModel.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $UserLocationsTable createAlias(String alias) {
    return $UserLocationsTable(_db, alias);
  }
}

abstract class _$RegimenDatabase extends GeneratedDatabase {
  _$RegimenDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $RegimensTable _regimens;
  $RegimensTable get regimens => _regimens ??= $RegimensTable(this);
  $WorkoutsTable _workouts;
  $WorkoutsTable get workouts => _workouts ??= $WorkoutsTable(this);
  $ExercisesTable _exercises;
  $ExercisesTable get exercises => _exercises ??= $ExercisesTable(this);
  $UserLocationsTable _userLocations;
  $UserLocationsTable get userLocations =>
      _userLocations ??= $UserLocationsTable(this);
  RegimenRepository _regimenRepository;
  RegimenRepository get regimenRepository =>
      _regimenRepository ??= RegimenRepository(this as RegimenDatabase);
  WorkoutRepository _workoutRepository;
  WorkoutRepository get workoutRepository =>
      _workoutRepository ??= WorkoutRepository(this as RegimenDatabase);
  ExerciseRepository _exerciseRepository;
  ExerciseRepository get exerciseRepository =>
      _exerciseRepository ??= ExerciseRepository(this as RegimenDatabase);
  UserLocationsRepository _userLocationsRepository;
  UserLocationsRepository get userLocationsRepository =>
      _userLocationsRepository ??=
          UserLocationsRepository(this as RegimenDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [regimens, workouts, exercises, userLocations];
}
