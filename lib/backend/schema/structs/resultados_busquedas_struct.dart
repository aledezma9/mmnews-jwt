// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultadosBusquedasStruct extends BaseStruct {
  ResultadosBusquedasStruct({
    int? id,
    String? title,
    String? status,
    List<String>? keywords,
    int? duration,
    String? mediaFilePath,
    String? createdAt,
    String? updatedAt,
    String? transcriptionDocPath,
    String? mediaThumbnailPath,
  })  : _id = id,
        _title = title,
        _status = status,
        _keywords = keywords,
        _duration = duration,
        _mediaFilePath = mediaFilePath,
        _createdAt = createdAt,
        _updatedAt = updatedAt,
        _transcriptionDocPath = transcriptionDocPath,
        _mediaThumbnailPath = mediaThumbnailPath;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "keywords" field.
  List<String>? _keywords;
  List<String> get keywords => _keywords ?? const [];
  set keywords(List<String>? val) => _keywords = val;
  void updateKeywords(Function(List<String>) updateFn) =>
      updateFn(_keywords ??= []);
  bool hasKeywords() => _keywords != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;
  void incrementDuration(int amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "media_file_path" field.
  String? _mediaFilePath;
  String get mediaFilePath => _mediaFilePath ?? '';
  set mediaFilePath(String? val) => _mediaFilePath = val;
  bool hasMediaFilePath() => _mediaFilePath != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "transcription_doc_path" field.
  String? _transcriptionDocPath;
  String get transcriptionDocPath => _transcriptionDocPath ?? '';
  set transcriptionDocPath(String? val) => _transcriptionDocPath = val;
  bool hasTranscriptionDocPath() => _transcriptionDocPath != null;

  // "media_thumbnail_path" field.
  String? _mediaThumbnailPath;
  String get mediaThumbnailPath => _mediaThumbnailPath ?? '';
  set mediaThumbnailPath(String? val) => _mediaThumbnailPath = val;
  bool hasMediaThumbnailPath() => _mediaThumbnailPath != null;

  static ResultadosBusquedasStruct fromMap(Map<String, dynamic> data) =>
      ResultadosBusquedasStruct(
        id: castToType<int>(data['id']),
        title: data['title'] as String?,
        status: data['status'] as String?,
        keywords: getDataList(data['keywords']),
        duration: castToType<int>(data['duration']),
        mediaFilePath: data['media_file_path'] as String?,
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
        transcriptionDocPath: data['transcription_doc_path'] as String?,
        mediaThumbnailPath: data['media_thumbnail_path'] as String?,
      );

  static ResultadosBusquedasStruct? maybeFromMap(dynamic data) => data is Map
      ? ResultadosBusquedasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'status': _status,
        'keywords': _keywords,
        'duration': _duration,
        'media_file_path': _mediaFilePath,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
        'transcription_doc_path': _transcriptionDocPath,
        'media_thumbnail_path': _mediaThumbnailPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'keywords': serializeParam(
          _keywords,
          ParamType.String,
          true,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'media_file_path': serializeParam(
          _mediaFilePath,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'transcription_doc_path': serializeParam(
          _transcriptionDocPath,
          ParamType.String,
        ),
        'media_thumbnail_path': serializeParam(
          _mediaThumbnailPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResultadosBusquedasStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResultadosBusquedasStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        keywords: deserializeParam<String>(
          data['keywords'],
          ParamType.String,
          true,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        mediaFilePath: deserializeParam(
          data['media_file_path'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        transcriptionDocPath: deserializeParam(
          data['transcription_doc_path'],
          ParamType.String,
          false,
        ),
        mediaThumbnailPath: deserializeParam(
          data['media_thumbnail_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResultadosBusquedasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ResultadosBusquedasStruct &&
        id == other.id &&
        title == other.title &&
        status == other.status &&
        listEquality.equals(keywords, other.keywords) &&
        duration == other.duration &&
        mediaFilePath == other.mediaFilePath &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        transcriptionDocPath == other.transcriptionDocPath &&
        mediaThumbnailPath == other.mediaThumbnailPath;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        title,
        status,
        keywords,
        duration,
        mediaFilePath,
        createdAt,
        updatedAt,
        transcriptionDocPath,
        mediaThumbnailPath
      ]);
}

ResultadosBusquedasStruct createResultadosBusquedasStruct({
  int? id,
  String? title,
  String? status,
  int? duration,
  String? mediaFilePath,
  String? createdAt,
  String? updatedAt,
  String? transcriptionDocPath,
  String? mediaThumbnailPath,
}) =>
    ResultadosBusquedasStruct(
      id: id,
      title: title,
      status: status,
      duration: duration,
      mediaFilePath: mediaFilePath,
      createdAt: createdAt,
      updatedAt: updatedAt,
      transcriptionDocPath: transcriptionDocPath,
      mediaThumbnailPath: mediaThumbnailPath,
    );
