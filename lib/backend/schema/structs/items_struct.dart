// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ItemsStruct extends BaseStruct {
  ItemsStruct({
    String? title,
    String? createdAt,
    int? transcriptionId,
    int? userId,
    String? userName,
    double? duration,
    String? updatedAt,
    String? status,
    String? keywords,
    int? rating,
    String? mediaThumbnailPath,
    String? transcriptionDocPath,
  })  : _title = title,
        _createdAt = createdAt,
        _transcriptionId = transcriptionId,
        _userId = userId,
        _userName = userName,
        _duration = duration,
        _updatedAt = updatedAt,
        _status = status,
        _keywords = keywords,
        _rating = rating,
        _mediaThumbnailPath = mediaThumbnailPath,
        _transcriptionDocPath = transcriptionDocPath;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "transcription_id" field.
  int? _transcriptionId;
  int get transcriptionId => _transcriptionId ?? 0;
  set transcriptionId(int? val) => _transcriptionId = val;
  void incrementTranscriptionId(int amount) =>
      _transcriptionId = transcriptionId + amount;
  bool hasTranscriptionId() => _transcriptionId != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  set duration(double? val) => _duration = val;
  void incrementDuration(double amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;
  bool hasStatus() => _status != null;

  // "keywords" field.
  String? _keywords;
  String get keywords => _keywords ?? '';
  set keywords(String? val) => _keywords = val;
  bool hasKeywords() => _keywords != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;
  void incrementRating(int amount) => _rating = rating + amount;
  bool hasRating() => _rating != null;

  // "media_thumbnail_path" field.
  String? _mediaThumbnailPath;
  String get mediaThumbnailPath => _mediaThumbnailPath ?? '';
  set mediaThumbnailPath(String? val) => _mediaThumbnailPath = val;
  bool hasMediaThumbnailPath() => _mediaThumbnailPath != null;

  // "transcription_doc_path" field.
  String? _transcriptionDocPath;
  String get transcriptionDocPath => _transcriptionDocPath ?? '';
  set transcriptionDocPath(String? val) => _transcriptionDocPath = val;
  bool hasTranscriptionDocPath() => _transcriptionDocPath != null;

  static ItemsStruct fromMap(Map<String, dynamic> data) => ItemsStruct(
        title: data['title'] as String?,
        createdAt: data['created_at'] as String?,
        transcriptionId: castToType<int>(data['transcription_id']),
        userId: castToType<int>(data['user_id']),
        userName: data['user_name'] as String?,
        duration: castToType<double>(data['duration']),
        updatedAt: data['updated_at'] as String?,
        status: data['status'] as String?,
        keywords: data['keywords'] as String?,
        rating: castToType<int>(data['rating']),
        mediaThumbnailPath: data['media_thumbnail_path'] as String?,
        transcriptionDocPath: data['transcription_doc_path'] as String?,
      );

  static ItemsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ItemsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'created_at': _createdAt,
        'transcription_id': _transcriptionId,
        'user_id': _userId,
        'user_name': _userName,
        'duration': _duration,
        'updated_at': _updatedAt,
        'status': _status,
        'keywords': _keywords,
        'rating': _rating,
        'media_thumbnail_path': _mediaThumbnailPath,
        'transcription_doc_path': _transcriptionDocPath,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'transcription_id': serializeParam(
          _transcriptionId,
          ParamType.int,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.double,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'keywords': serializeParam(
          _keywords,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'media_thumbnail_path': serializeParam(
          _mediaThumbnailPath,
          ParamType.String,
        ),
        'transcription_doc_path': serializeParam(
          _transcriptionDocPath,
          ParamType.String,
        ),
      }.withoutNulls;

  static ItemsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ItemsStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        transcriptionId: deserializeParam(
          data['transcription_id'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.double,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        keywords: deserializeParam(
          data['keywords'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        mediaThumbnailPath: deserializeParam(
          data['media_thumbnail_path'],
          ParamType.String,
          false,
        ),
        transcriptionDocPath: deserializeParam(
          data['transcription_doc_path'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ItemsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ItemsStruct &&
        title == other.title &&
        createdAt == other.createdAt &&
        transcriptionId == other.transcriptionId &&
        userId == other.userId &&
        userName == other.userName &&
        duration == other.duration &&
        updatedAt == other.updatedAt &&
        status == other.status &&
        keywords == other.keywords &&
        rating == other.rating &&
        mediaThumbnailPath == other.mediaThumbnailPath &&
        transcriptionDocPath == other.transcriptionDocPath;
  }

  @override
  int get hashCode => const ListEquality().hash([
        title,
        createdAt,
        transcriptionId,
        userId,
        userName,
        duration,
        updatedAt,
        status,
        keywords,
        rating,
        mediaThumbnailPath,
        transcriptionDocPath
      ]);
}

ItemsStruct createItemsStruct({
  String? title,
  String? createdAt,
  int? transcriptionId,
  int? userId,
  String? userName,
  double? duration,
  String? updatedAt,
  String? status,
  String? keywords,
  int? rating,
  String? mediaThumbnailPath,
  String? transcriptionDocPath,
}) =>
    ItemsStruct(
      title: title,
      createdAt: createdAt,
      transcriptionId: transcriptionId,
      userId: userId,
      userName: userName,
      duration: duration,
      updatedAt: updatedAt,
      status: status,
      keywords: keywords,
      rating: rating,
      mediaThumbnailPath: mediaThumbnailPath,
      transcriptionDocPath: transcriptionDocPath,
    );
