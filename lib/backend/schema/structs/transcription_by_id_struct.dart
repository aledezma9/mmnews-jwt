// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranscriptionByIdStruct extends BaseStruct {
  TranscriptionByIdStruct({
    int? id,
    String? transcriptionsTxt,
    String? transcriptionsSrtTxt,
    String? updatedAt,
    String? source,
    String? mediaFilePath,
    String? summarize,
    String? transcriptionSrtJsonPath,
    String? title,
    int? idUser,
    String? createdAt,
    List<KeywordsStruct>? keywords,
    double? duration,
    String? transcriptionFilePath,
    String? transcriptionDocPath,
    String? mediaThumbnailPath,
    String? headlines,
    String? summarizeAdvanced,
    String? characterList,
    String? transcriptionSrtPath,
    TranscriptionsSrtJsonStruct? transcriptionsSrtJson,
  })  : _id = id,
        _transcriptionsTxt = transcriptionsTxt,
        _transcriptionsSrtTxt = transcriptionsSrtTxt,
        _updatedAt = updatedAt,
        _source = source,
        _mediaFilePath = mediaFilePath,
        _summarize = summarize,
        _transcriptionSrtJsonPath = transcriptionSrtJsonPath,
        _title = title,
        _idUser = idUser,
        _createdAt = createdAt,
        _keywords = keywords,
        _duration = duration,
        _transcriptionFilePath = transcriptionFilePath,
        _transcriptionDocPath = transcriptionDocPath,
        _mediaThumbnailPath = mediaThumbnailPath,
        _headlines = headlines,
        _summarizeAdvanced = summarizeAdvanced,
        _characterList = characterList,
        _transcriptionSrtPath = transcriptionSrtPath,
        _transcriptionsSrtJson = transcriptionsSrtJson;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "transcriptions_txt" field.
  String? _transcriptionsTxt;
  String get transcriptionsTxt => _transcriptionsTxt ?? '';
  set transcriptionsTxt(String? val) => _transcriptionsTxt = val;
  bool hasTranscriptionsTxt() => _transcriptionsTxt != null;

  // "transcriptions_srt_txt" field.
  String? _transcriptionsSrtTxt;
  String get transcriptionsSrtTxt => _transcriptionsSrtTxt ?? '';
  set transcriptionsSrtTxt(String? val) => _transcriptionsSrtTxt = val;
  bool hasTranscriptionsSrtTxt() => _transcriptionsSrtTxt != null;

  // "updated_at" field.
  String? _updatedAt;
  String get updatedAt => _updatedAt ?? '';
  set updatedAt(String? val) => _updatedAt = val;
  bool hasUpdatedAt() => _updatedAt != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  set source(String? val) => _source = val;
  bool hasSource() => _source != null;

  // "media_file_path" field.
  String? _mediaFilePath;
  String get mediaFilePath => _mediaFilePath ?? '';
  set mediaFilePath(String? val) => _mediaFilePath = val;
  bool hasMediaFilePath() => _mediaFilePath != null;

  // "summarize" field.
  String? _summarize;
  String get summarize => _summarize ?? '';
  set summarize(String? val) => _summarize = val;
  bool hasSummarize() => _summarize != null;

  // "transcription_srt_json_path" field.
  String? _transcriptionSrtJsonPath;
  String get transcriptionSrtJsonPath => _transcriptionSrtJsonPath ?? '';
  set transcriptionSrtJsonPath(String? val) => _transcriptionSrtJsonPath = val;
  bool hasTranscriptionSrtJsonPath() => _transcriptionSrtJsonPath != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "id_user" field.
  int? _idUser;
  int get idUser => _idUser ?? 0;
  set idUser(int? val) => _idUser = val;
  void incrementIdUser(int amount) => _idUser = idUser + amount;
  bool hasIdUser() => _idUser != null;

  // "created_at" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;
  bool hasCreatedAt() => _createdAt != null;

  // "keywords" field.
  List<KeywordsStruct>? _keywords;
  List<KeywordsStruct> get keywords => _keywords ?? const [];
  set keywords(List<KeywordsStruct>? val) => _keywords = val;
  void updateKeywords(Function(List<KeywordsStruct>) updateFn) =>
      updateFn(_keywords ??= []);
  bool hasKeywords() => _keywords != null;

  // "duration" field.
  double? _duration;
  double get duration => _duration ?? 0.0;
  set duration(double? val) => _duration = val;
  void incrementDuration(double amount) => _duration = duration + amount;
  bool hasDuration() => _duration != null;

  // "transcription_file_path" field.
  String? _transcriptionFilePath;
  String get transcriptionFilePath => _transcriptionFilePath ?? '';
  set transcriptionFilePath(String? val) => _transcriptionFilePath = val;
  bool hasTranscriptionFilePath() => _transcriptionFilePath != null;

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

  // "headlines" field.
  String? _headlines;
  String get headlines => _headlines ?? '';
  set headlines(String? val) => _headlines = val;
  bool hasHeadlines() => _headlines != null;

  // "summarize_advanced" field.
  String? _summarizeAdvanced;
  String get summarizeAdvanced => _summarizeAdvanced ?? '';
  set summarizeAdvanced(String? val) => _summarizeAdvanced = val;
  bool hasSummarizeAdvanced() => _summarizeAdvanced != null;

  // "character_list" field.
  String? _characterList;
  String get characterList => _characterList ?? '';
  set characterList(String? val) => _characterList = val;
  bool hasCharacterList() => _characterList != null;

  // "transcription_srt_path" field.
  String? _transcriptionSrtPath;
  String get transcriptionSrtPath => _transcriptionSrtPath ?? '';
  set transcriptionSrtPath(String? val) => _transcriptionSrtPath = val;
  bool hasTranscriptionSrtPath() => _transcriptionSrtPath != null;

  // "transcriptions_srt_json" field.
  TranscriptionsSrtJsonStruct? _transcriptionsSrtJson;
  TranscriptionsSrtJsonStruct get transcriptionsSrtJson =>
      _transcriptionsSrtJson ?? TranscriptionsSrtJsonStruct();
  set transcriptionsSrtJson(TranscriptionsSrtJsonStruct? val) =>
      _transcriptionsSrtJson = val;
  void updateTranscriptionsSrtJson(
          Function(TranscriptionsSrtJsonStruct) updateFn) =>
      updateFn(_transcriptionsSrtJson ??= TranscriptionsSrtJsonStruct());
  bool hasTranscriptionsSrtJson() => _transcriptionsSrtJson != null;

  static TranscriptionByIdStruct fromMap(Map<String, dynamic> data) =>
      TranscriptionByIdStruct(
        id: castToType<int>(data['id']),
        transcriptionsTxt: data['transcriptions_txt'] as String?,
        transcriptionsSrtTxt: data['transcriptions_srt_txt'] as String?,
        updatedAt: data['updated_at'] as String?,
        source: data['source'] as String?,
        mediaFilePath: data['media_file_path'] as String?,
        summarize: data['summarize'] as String?,
        transcriptionSrtJsonPath:
            data['transcription_srt_json_path'] as String?,
        title: data['title'] as String?,
        idUser: castToType<int>(data['id_user']),
        createdAt: data['created_at'] as String?,
        keywords: getStructList(
          data['keywords'],
          KeywordsStruct.fromMap,
        ),
        duration: castToType<double>(data['duration']),
        transcriptionFilePath: data['transcription_file_path'] as String?,
        transcriptionDocPath: data['transcription_doc_path'] as String?,
        mediaThumbnailPath: data['media_thumbnail_path'] as String?,
        headlines: data['headlines'] as String?,
        summarizeAdvanced: data['summarize_advanced'] as String?,
        characterList: data['character_list'] as String?,
        transcriptionSrtPath: data['transcription_srt_path'] as String?,
        transcriptionsSrtJson: TranscriptionsSrtJsonStruct.maybeFromMap(
            data['transcriptions_srt_json']),
      );

  static TranscriptionByIdStruct? maybeFromMap(dynamic data) => data is Map
      ? TranscriptionByIdStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'transcriptions_txt': _transcriptionsTxt,
        'transcriptions_srt_txt': _transcriptionsSrtTxt,
        'updated_at': _updatedAt,
        'source': _source,
        'media_file_path': _mediaFilePath,
        'summarize': _summarize,
        'transcription_srt_json_path': _transcriptionSrtJsonPath,
        'title': _title,
        'id_user': _idUser,
        'created_at': _createdAt,
        'keywords': _keywords?.map((e) => e.toMap()).toList(),
        'duration': _duration,
        'transcription_file_path': _transcriptionFilePath,
        'transcription_doc_path': _transcriptionDocPath,
        'media_thumbnail_path': _mediaThumbnailPath,
        'headlines': _headlines,
        'summarize_advanced': _summarizeAdvanced,
        'character_list': _characterList,
        'transcription_srt_path': _transcriptionSrtPath,
        'transcriptions_srt_json': _transcriptionsSrtJson?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'transcriptions_txt': serializeParam(
          _transcriptionsTxt,
          ParamType.String,
        ),
        'transcriptions_srt_txt': serializeParam(
          _transcriptionsSrtTxt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
        'source': serializeParam(
          _source,
          ParamType.String,
        ),
        'media_file_path': serializeParam(
          _mediaFilePath,
          ParamType.String,
        ),
        'summarize': serializeParam(
          _summarize,
          ParamType.String,
        ),
        'transcription_srt_json_path': serializeParam(
          _transcriptionSrtJsonPath,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'id_user': serializeParam(
          _idUser,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'keywords': serializeParam(
          _keywords,
          ParamType.DataStruct,
          true,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.double,
        ),
        'transcription_file_path': serializeParam(
          _transcriptionFilePath,
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
        'headlines': serializeParam(
          _headlines,
          ParamType.String,
        ),
        'summarize_advanced': serializeParam(
          _summarizeAdvanced,
          ParamType.String,
        ),
        'character_list': serializeParam(
          _characterList,
          ParamType.String,
        ),
        'transcription_srt_path': serializeParam(
          _transcriptionSrtPath,
          ParamType.String,
        ),
        'transcriptions_srt_json': serializeParam(
          _transcriptionsSrtJson,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static TranscriptionByIdStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TranscriptionByIdStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        transcriptionsTxt: deserializeParam(
          data['transcriptions_txt'],
          ParamType.String,
          false,
        ),
        transcriptionsSrtTxt: deserializeParam(
          data['transcriptions_srt_txt'],
          ParamType.String,
          false,
        ),
        updatedAt: deserializeParam(
          data['updated_at'],
          ParamType.String,
          false,
        ),
        source: deserializeParam(
          data['source'],
          ParamType.String,
          false,
        ),
        mediaFilePath: deserializeParam(
          data['media_file_path'],
          ParamType.String,
          false,
        ),
        summarize: deserializeParam(
          data['summarize'],
          ParamType.String,
          false,
        ),
        transcriptionSrtJsonPath: deserializeParam(
          data['transcription_srt_json_path'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        idUser: deserializeParam(
          data['id_user'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.String,
          false,
        ),
        keywords: deserializeStructParam<KeywordsStruct>(
          data['keywords'],
          ParamType.DataStruct,
          true,
          structBuilder: KeywordsStruct.fromSerializableMap,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.double,
          false,
        ),
        transcriptionFilePath: deserializeParam(
          data['transcription_file_path'],
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
        headlines: deserializeParam(
          data['headlines'],
          ParamType.String,
          false,
        ),
        summarizeAdvanced: deserializeParam(
          data['summarize_advanced'],
          ParamType.String,
          false,
        ),
        characterList: deserializeParam(
          data['character_list'],
          ParamType.String,
          false,
        ),
        transcriptionSrtPath: deserializeParam(
          data['transcription_srt_path'],
          ParamType.String,
          false,
        ),
        transcriptionsSrtJson: deserializeStructParam(
          data['transcriptions_srt_json'],
          ParamType.DataStruct,
          false,
          structBuilder: TranscriptionsSrtJsonStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'TranscriptionByIdStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is TranscriptionByIdStruct &&
        id == other.id &&
        transcriptionsTxt == other.transcriptionsTxt &&
        transcriptionsSrtTxt == other.transcriptionsSrtTxt &&
        updatedAt == other.updatedAt &&
        source == other.source &&
        mediaFilePath == other.mediaFilePath &&
        summarize == other.summarize &&
        transcriptionSrtJsonPath == other.transcriptionSrtJsonPath &&
        title == other.title &&
        idUser == other.idUser &&
        createdAt == other.createdAt &&
        listEquality.equals(keywords, other.keywords) &&
        duration == other.duration &&
        transcriptionFilePath == other.transcriptionFilePath &&
        transcriptionDocPath == other.transcriptionDocPath &&
        mediaThumbnailPath == other.mediaThumbnailPath &&
        headlines == other.headlines &&
        summarizeAdvanced == other.summarizeAdvanced &&
        characterList == other.characterList &&
        transcriptionSrtPath == other.transcriptionSrtPath &&
        transcriptionsSrtJson == other.transcriptionsSrtJson;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        transcriptionsTxt,
        transcriptionsSrtTxt,
        updatedAt,
        source,
        mediaFilePath,
        summarize,
        transcriptionSrtJsonPath,
        title,
        idUser,
        createdAt,
        keywords,
        duration,
        transcriptionFilePath,
        transcriptionDocPath,
        mediaThumbnailPath,
        headlines,
        summarizeAdvanced,
        characterList,
        transcriptionSrtPath,
        transcriptionsSrtJson
      ]);
}

TranscriptionByIdStruct createTranscriptionByIdStruct({
  int? id,
  String? transcriptionsTxt,
  String? transcriptionsSrtTxt,
  String? updatedAt,
  String? source,
  String? mediaFilePath,
  String? summarize,
  String? transcriptionSrtJsonPath,
  String? title,
  int? idUser,
  String? createdAt,
  double? duration,
  String? transcriptionFilePath,
  String? transcriptionDocPath,
  String? mediaThumbnailPath,
  String? headlines,
  String? summarizeAdvanced,
  String? characterList,
  String? transcriptionSrtPath,
  TranscriptionsSrtJsonStruct? transcriptionsSrtJson,
}) =>
    TranscriptionByIdStruct(
      id: id,
      transcriptionsTxt: transcriptionsTxt,
      transcriptionsSrtTxt: transcriptionsSrtTxt,
      updatedAt: updatedAt,
      source: source,
      mediaFilePath: mediaFilePath,
      summarize: summarize,
      transcriptionSrtJsonPath: transcriptionSrtJsonPath,
      title: title,
      idUser: idUser,
      createdAt: createdAt,
      duration: duration,
      transcriptionFilePath: transcriptionFilePath,
      transcriptionDocPath: transcriptionDocPath,
      mediaThumbnailPath: mediaThumbnailPath,
      headlines: headlines,
      summarizeAdvanced: summarizeAdvanced,
      characterList: characterList,
      transcriptionSrtPath: transcriptionSrtPath,
      transcriptionsSrtJson:
          transcriptionsSrtJson ?? TranscriptionsSrtJsonStruct(),
    );
