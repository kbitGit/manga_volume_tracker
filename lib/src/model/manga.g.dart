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
  final int languageId;
  Manga(
      {@required this.id,
      @required this.title,
      @required this.currentVolume,
      @required this.completeVolumeCount,
      @required this.format,
      @required this.languageId});
  factory Manga.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Manga(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      currentVolume: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}current_volume']),
      completeVolumeCount: intType.mapFromDatabaseResponse(
          data['${effectivePrefix}complete_volume_count']),
      format: $MangasTable.$converter0.mapToDart(
          intType.mapFromDatabaseResponse(data['${effectivePrefix}format'])),
      languageId: intType
          .mapFromDatabaseResponse(data['${effectivePrefix}language_id']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || currentVolume != null) {
      map['current_volume'] = Variable<int>(currentVolume);
    }
    if (!nullToAbsent || completeVolumeCount != null) {
      map['complete_volume_count'] = Variable<int>(completeVolumeCount);
    }
    if (!nullToAbsent || format != null) {
      final converter = $MangasTable.$converter0;
      map['format'] = Variable<int>(converter.mapToSql(format));
    }
    if (!nullToAbsent || languageId != null) {
      map['language_id'] = Variable<int>(languageId);
    }
    return map;
  }

  MangasCompanion toCompanion(bool nullToAbsent) {
    return MangasCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      currentVolume: currentVolume == null && nullToAbsent
          ? const Value.absent()
          : Value(currentVolume),
      completeVolumeCount: completeVolumeCount == null && nullToAbsent
          ? const Value.absent()
          : Value(completeVolumeCount),
      format:
          format == null && nullToAbsent ? const Value.absent() : Value(format),
      languageId: languageId == null && nullToAbsent
          ? const Value.absent()
          : Value(languageId),
    );
  }

  factory Manga.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Manga(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      currentVolume: serializer.fromJson<int>(json['currentVolume']),
      completeVolumeCount:
          serializer.fromJson<int>(json['completeVolumeCount']),
      format: serializer.fromJson<MangaFormat>(json['format']),
      languageId: serializer.fromJson<int>(json['languageId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'currentVolume': serializer.toJson<int>(currentVolume),
      'completeVolumeCount': serializer.toJson<int>(completeVolumeCount),
      'format': serializer.toJson<MangaFormat>(format),
      'languageId': serializer.toJson<int>(languageId),
    };
  }

  Manga copyWith(
          {int id,
          String title,
          int currentVolume,
          int completeVolumeCount,
          MangaFormat format,
          int languageId}) =>
      Manga(
        id: id ?? this.id,
        title: title ?? this.title,
        currentVolume: currentVolume ?? this.currentVolume,
        completeVolumeCount: completeVolumeCount ?? this.completeVolumeCount,
        format: format ?? this.format,
        languageId: languageId ?? this.languageId,
      );
  @override
  String toString() {
    return (StringBuffer('Manga(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('currentVolume: $currentVolume, ')
          ..write('completeVolumeCount: $completeVolumeCount, ')
          ..write('format: $format, ')
          ..write('languageId: $languageId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          title.hashCode,
          $mrjc(
              currentVolume.hashCode,
              $mrjc(completeVolumeCount.hashCode,
                  $mrjc(format.hashCode, languageId.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Manga &&
          other.id == this.id &&
          other.title == this.title &&
          other.currentVolume == this.currentVolume &&
          other.completeVolumeCount == this.completeVolumeCount &&
          other.format == this.format &&
          other.languageId == this.languageId);
}

class MangasCompanion extends UpdateCompanion<Manga> {
  final Value<int> id;
  final Value<String> title;
  final Value<int> currentVolume;
  final Value<int> completeVolumeCount;
  final Value<MangaFormat> format;
  final Value<int> languageId;
  const MangasCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.currentVolume = const Value.absent(),
    this.completeVolumeCount = const Value.absent(),
    this.format = const Value.absent(),
    this.languageId = const Value.absent(),
  });
  MangasCompanion.insert({
    this.id = const Value.absent(),
    @required String title,
    @required int currentVolume,
    @required int completeVolumeCount,
    this.format = const Value.absent(),
    this.languageId = const Value.absent(),
  })  : title = Value(title),
        currentVolume = Value(currentVolume),
        completeVolumeCount = Value(completeVolumeCount);
  static Insertable<Manga> custom({
    Expression<int> id,
    Expression<String> title,
    Expression<int> currentVolume,
    Expression<int> completeVolumeCount,
    Expression<int> format,
    Expression<int> languageId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (currentVolume != null) 'current_volume': currentVolume,
      if (completeVolumeCount != null)
        'complete_volume_count': completeVolumeCount,
      if (format != null) 'format': format,
      if (languageId != null) 'language_id': languageId,
    });
  }

  MangasCompanion copyWith(
      {Value<int> id,
      Value<String> title,
      Value<int> currentVolume,
      Value<int> completeVolumeCount,
      Value<MangaFormat> format,
      Value<int> languageId}) {
    return MangasCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      currentVolume: currentVolume ?? this.currentVolume,
      completeVolumeCount: completeVolumeCount ?? this.completeVolumeCount,
      format: format ?? this.format,
      languageId: languageId ?? this.languageId,
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
      map['format'] = Variable<int>(converter.mapToSql(format.value));
    }
    if (languageId.present) {
      map['language_id'] = Variable<int>(languageId.value);
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
          ..write('languageId: $languageId')
          ..write(')'))
        .toString();
  }
}

class $MangasTable extends Mangas with TableInfo<$MangasTable, Manga> {
  final GeneratedDatabase _db;
  final String _alias;
  $MangasTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _currentVolumeMeta =
      const VerificationMeta('currentVolume');
  GeneratedIntColumn _currentVolume;
  @override
  GeneratedIntColumn get currentVolume =>
      _currentVolume ??= _constructCurrentVolume();
  GeneratedIntColumn _constructCurrentVolume() {
    return GeneratedIntColumn(
      'current_volume',
      $tableName,
      false,
    );
  }

  final VerificationMeta _completeVolumeCountMeta =
      const VerificationMeta('completeVolumeCount');
  GeneratedIntColumn _completeVolumeCount;
  @override
  GeneratedIntColumn get completeVolumeCount =>
      _completeVolumeCount ??= _constructCompleteVolumeCount();
  GeneratedIntColumn _constructCompleteVolumeCount() {
    return GeneratedIntColumn(
      'complete_volume_count',
      $tableName,
      false,
    );
  }

  final VerificationMeta _formatMeta = const VerificationMeta('format');
  GeneratedIntColumn _format;
  @override
  GeneratedIntColumn get format => _format ??= _constructFormat();
  GeneratedIntColumn _constructFormat() {
    return GeneratedIntColumn('format', $tableName, false,
        defaultValue: Constant(0));
  }

  final VerificationMeta _languageIdMeta = const VerificationMeta('languageId');
  GeneratedIntColumn _languageId;
  @override
  GeneratedIntColumn get languageId => _languageId ??= _constructLanguageId();
  GeneratedIntColumn _constructLanguageId() {
    return GeneratedIntColumn('language_id', $tableName, false,
        defaultValue: Constant(0));
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, title, currentVolume, completeVolumeCount, format, languageId];
  @override
  $MangasTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'mangas';
  @override
  final String actualTableName = 'mangas';
  @override
  VerificationContext validateIntegrity(Insertable<Manga> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('current_volume')) {
      context.handle(
          _currentVolumeMeta,
          currentVolume.isAcceptableOrUnknown(
              data['current_volume'], _currentVolumeMeta));
    } else if (isInserting) {
      context.missing(_currentVolumeMeta);
    }
    if (data.containsKey('complete_volume_count')) {
      context.handle(
          _completeVolumeCountMeta,
          completeVolumeCount.isAcceptableOrUnknown(
              data['complete_volume_count'], _completeVolumeCountMeta));
    } else if (isInserting) {
      context.missing(_completeVolumeCountMeta);
    }
    context.handle(_formatMeta, const VerificationResult.success());
    if (data.containsKey('language_id')) {
      context.handle(
          _languageIdMeta,
          languageId.isAcceptableOrUnknown(
              data['language_id'], _languageIdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Manga map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Manga.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MangasTable createAlias(String alias) {
    return $MangasTable(_db, alias);
  }

  static TypeConverter<MangaFormat, int> $converter0 =
      const EnumIndexConverter<MangaFormat>(MangaFormat.values);
}

class Language extends DataClass implements Insertable<Language> {
  final int id;
  final String language;
  Language({@required this.id, @required this.language});
  factory Language.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Language(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      language: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}language']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || language != null) {
      map['language'] = Variable<String>(language);
    }
    return map;
  }

  LanguagesCompanion toCompanion(bool nullToAbsent) {
    return LanguagesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      language: language == null && nullToAbsent
          ? const Value.absent()
          : Value(language),
    );
  }

  factory Language.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Language(
      id: serializer.fromJson<int>(json['id']),
      language: serializer.fromJson<String>(json['language']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'language': serializer.toJson<String>(language),
    };
  }

  Language copyWith({int id, String language}) => Language(
        id: id ?? this.id,
        language: language ?? this.language,
      );
  @override
  String toString() {
    return (StringBuffer('Language(')
          ..write('id: $id, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode, language.hashCode));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Language &&
          other.id == this.id &&
          other.language == this.language);
}

class LanguagesCompanion extends UpdateCompanion<Language> {
  final Value<int> id;
  final Value<String> language;
  const LanguagesCompanion({
    this.id = const Value.absent(),
    this.language = const Value.absent(),
  });
  LanguagesCompanion.insert({
    this.id = const Value.absent(),
    @required String language,
  }) : language = Value(language);
  static Insertable<Language> custom({
    Expression<int> id,
    Expression<String> language,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (language != null) 'language': language,
    });
  }

  LanguagesCompanion copyWith({Value<int> id, Value<String> language}) {
    return LanguagesCompanion(
      id: id ?? this.id,
      language: language ?? this.language,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (language.present) {
      map['language'] = Variable<String>(language.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LanguagesCompanion(')
          ..write('id: $id, ')
          ..write('language: $language')
          ..write(')'))
        .toString();
  }
}

class $LanguagesTable extends Languages
    with TableInfo<$LanguagesTable, Language> {
  final GeneratedDatabase _db;
  final String _alias;
  $LanguagesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _languageMeta = const VerificationMeta('language');
  GeneratedTextColumn _language;
  @override
  GeneratedTextColumn get language => _language ??= _constructLanguage();
  GeneratedTextColumn _constructLanguage() {
    return GeneratedTextColumn(
      'language',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [id, language];
  @override
  $LanguagesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'languages';
  @override
  final String actualTableName = 'languages';
  @override
  VerificationContext validateIntegrity(Insertable<Language> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('language')) {
      context.handle(_languageMeta,
          language.isAcceptableOrUnknown(data['language'], _languageMeta));
    } else if (isInserting) {
      context.missing(_languageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Language map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Language.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $LanguagesTable createAlias(String alias) {
    return $LanguagesTable(_db, alias);
  }
}

abstract class _$Database extends GeneratedDatabase {
  _$Database(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MangasTable _mangas;
  $MangasTable get mangas => _mangas ??= $MangasTable(this);
  $LanguagesTable _languages;
  $LanguagesTable get languages => _languages ??= $LanguagesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [mangas, languages];
}
