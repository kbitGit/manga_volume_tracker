// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manga.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Manga extends DataClass implements Insertable<Manga> {
  final int id;
  final String title;
  final int currentVolume;
  final int completeVolumeCount;
  final MangaFormat format;
  final String notes;
  Manga(
      {required this.id,
      required this.title,
      required this.currentVolume,
      required this.completeVolumeCount,
      required this.format,
      required this.notes});
  factory Manga.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Manga(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      currentVolume: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}current_volume'])!,
      completeVolumeCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}complete_volume_count'])!,
      format: $MangasTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}format']))!,
      notes: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}notes'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['current_volume'] = Variable<int>(currentVolume);
    map['complete_volume_count'] = Variable<int>(completeVolumeCount);
    {
      final converter = $MangasTable.$converter0;
      map['format'] = Variable<int>(converter.mapToSql(format)!);
    }
    map['notes'] = Variable<String>(notes);
    return map;
  }

  MangasCompanion toCompanion(bool nullToAbsent) {
    return MangasCompanion(
      id: Value(id),
      title: Value(title),
      currentVolume: Value(currentVolume),
      completeVolumeCount: Value(completeVolumeCount),
      format: Value(format),
      notes: Value(notes),
    );
  }

  factory Manga.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Manga(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      currentVolume: serializer.fromJson<int>(json['currentVolume']),
      completeVolumeCount:
          serializer.fromJson<int>(json['completeVolumeCount']),
      format: serializer.fromJson<MangaFormat>(json['format']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'currentVolume': serializer.toJson<int>(currentVolume),
      'completeVolumeCount': serializer.toJson<int>(completeVolumeCount),
      'format': serializer.toJson<MangaFormat>(format),
      'notes': serializer.toJson<String>(notes),
    };
  }

  Manga copyWith(
          {int? id,
          String? title,
          int? currentVolume,
          int? completeVolumeCount,
          MangaFormat? format,
          String? notes}) =>
      Manga(
        id: id ?? this.id,
        title: title ?? this.title,
        currentVolume: currentVolume ?? this.currentVolume,
        completeVolumeCount: completeVolumeCount ?? this.completeVolumeCount,
        format: format ?? this.format,
        notes: notes ?? this.notes,
      );
  @override
  String toString() {
    return (StringBuffer('Manga(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('currentVolume: $currentVolume, ')
          ..write('completeVolumeCount: $completeVolumeCount, ')
          ..write('format: $format, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, currentVolume, completeVolumeCount, format, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Manga &&
          other.id == this.id &&
          other.title == this.title &&
          other.currentVolume == this.currentVolume &&
          other.completeVolumeCount == this.completeVolumeCount &&
          other.format == this.format &&
          other.notes == this.notes);
}

class MangasCompanion extends UpdateCompanion<Manga> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> currentVolume;
  final Value<int> completeVolumeCount;
  final Value<MangaFormat> format;
  final Value<String> notes;
  const MangasCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.currentVolume = const Value.absent(),
    this.completeVolumeCount = const Value.absent(),
    this.format = const Value.absent(),
    this.notes = const Value.absent(),
  });
  MangasCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required int currentVolume,
    required int completeVolumeCount,
    this.format = const Value.absent(),
    this.notes = const Value.absent(),
  })  : title = Value(title),
        currentVolume = Value(currentVolume),
        completeVolumeCount = Value(completeVolumeCount);
  static Insertable<Manga> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<int>? currentVolume,
    Expression<int>? completeVolumeCount,
    Expression<MangaFormat>? format,
    Expression<String>? notes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (currentVolume != null) 'current_volume': currentVolume,
      if (completeVolumeCount != null)
        'complete_volume_count': completeVolumeCount,
      if (format != null) 'format': format,
      if (notes != null) 'notes': notes,
    });
  }

  MangasCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<int>? currentVolume,
      Value<int>? completeVolumeCount,
      Value<MangaFormat>? format,
      Value<String>? notes}) {
    return MangasCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      currentVolume: currentVolume ?? this.currentVolume,
      completeVolumeCount: completeVolumeCount ?? this.completeVolumeCount,
      format: format ?? this.format,
      notes: notes ?? this.notes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (currentVolume.present) {
      map['current_volume'] = Variable<int>(currentVolume.value);
    }
    if (completeVolumeCount.present) {
      map['complete_volume_count'] = Variable<int>(completeVolumeCount.value);
    }
    if (format.present) {
      final converter = $MangasTable.$converter0;
      map['format'] = Variable<int>(converter.mapToSql(format.value)!);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MangasCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('currentVolume: $currentVolume, ')
          ..write('completeVolumeCount: $completeVolumeCount, ')
          ..write('format: $format, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }
}

class $MangasTable extends Mangas with TableInfo<$MangasTable, Manga> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MangasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _currentVolumeMeta =
      const VerificationMeta('currentVolume');
  @override
  late final GeneratedColumn<int?> currentVolume = GeneratedColumn<int?>(
      'current_volume', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _completeVolumeCountMeta =
      const VerificationMeta('completeVolumeCount');
  @override
  late final GeneratedColumn<int?> completeVolumeCount = GeneratedColumn<int?>(
      'complete_volume_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _formatMeta = const VerificationMeta('format');
  @override
  late final GeneratedColumnWithTypeConverter<MangaFormat, int?> format =
      GeneratedColumn<int?>('format', aliasedName, false,
              type: const IntType(),
              requiredDuringInsert: false,
              defaultValue: Constant(0))
          .withConverter<MangaFormat>($MangasTable.$converter0);
  final VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String?> notes = GeneratedColumn<String?>(
      'notes', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: Constant(""));
  @override
  List<GeneratedColumn> get $columns =>
      [id, title, currentVolume, completeVolumeCount, format, notes];
  @override
  String get aliasedName => _alias ?? 'mangas';
  @override
  String get actualTableName => 'mangas';
  @override
  VerificationContext validateIntegrity(Insertable<Manga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('current_volume')) {
      context.handle(
          _currentVolumeMeta,
          currentVolume.isAcceptableOrUnknown(
              data['current_volume']!, _currentVolumeMeta));
    } else if (isInserting) {
      context.missing(_currentVolumeMeta);
    }
    if (data.containsKey('complete_volume_count')) {
      context.handle(
          _completeVolumeCountMeta,
          completeVolumeCount.isAcceptableOrUnknown(
              data['complete_volume_count']!, _completeVolumeCountMeta));
    } else if (isInserting) {
      context.missing(_completeVolumeCountMeta);
    }
    context.handle(_formatMeta, const VerificationResult.success());
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Manga map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Manga.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MangasTable createAlias(String alias) {
    return $MangasTable(_db, alias);
  }

  static TypeConverter<MangaFormat, int> $converter0 =
      const EnumIndexConverter<MangaFormat>(MangaFormat.values);
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MangasTable mangas = $MangasTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mangas];
}
