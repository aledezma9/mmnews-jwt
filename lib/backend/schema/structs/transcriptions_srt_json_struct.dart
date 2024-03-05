// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TranscriptionsSrtJsonStruct extends BaseStruct {
  TranscriptionsSrtJsonStruct({
    String? text,
    int? index,
    String? endTime,
    String? startTime,
  })  : _text = text,
        _index = index,
        _endTime = endTime,
        _startTime = startTime;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;
  bool hasText() => _text != null;

  // "index" field.
  int? _index;
  int get index => _index ?? 0;
  set index(int? val) => _index = val;
  void incrementIndex(int amount) => _index = index + amount;
  bool hasIndex() => _index != null;

  // "end_time" field.
  String? _endTime;
  String get endTime => _endTime ?? '';
  set endTime(String? val) => _endTime = val;
  bool hasEndTime() => _endTime != null;

  // "start_time" field.
  String? _startTime;
  String get startTime => _startTime ?? '';
  set startTime(String? val) => _startTime = val;
  bool hasStartTime() => _startTime != null;

  static TranscriptionsSrtJsonStruct fromMap(Map<String, dynamic> data) =>
      TranscriptionsSrtJsonStruct(
        text: data['text'] as String?,
        index: castToType<int>(data['index']),
        endTime: data['end_time'] as String?,
        startTime: data['start_time'] as String?,
      );

  static TranscriptionsSrtJsonStruct? maybeFromMap(dynamic data) => data is Map
      ? TranscriptionsSrtJsonStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'text': _text,
        'index': _index,
        'end_time': _endTime,
        'start_time': _startTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
        'index': serializeParam(
          _index,
          ParamType.int,
        ),
        'end_time': serializeParam(
          _endTime,
          ParamType.String,
        ),
        'start_time': serializeParam(
          _startTime,
          ParamType.String,
        ),
      }.withoutNulls;

  static TranscriptionsSrtJsonStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TranscriptionsSrtJsonStruct(
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
        index: deserializeParam(
          data['index'],
          ParamType.int,
          false,
        ),
        endTime: deserializeParam(
          data['end_time'],
          ParamType.String,
          false,
        ),
        startTime: deserializeParam(
          data['start_time'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TranscriptionsSrtJsonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TranscriptionsSrtJsonStruct &&
        text == other.text &&
        index == other.index &&
        endTime == other.endTime &&
        startTime == other.startTime;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([text, index, endTime, startTime]);
}

TranscriptionsSrtJsonStruct createTranscriptionsSrtJsonStruct({
  String? text,
  int? index,
  String? endTime,
  String? startTime,
}) =>
    TranscriptionsSrtJsonStruct(
      text: text,
      index: index,
      endTime: endTime,
      startTime: startTime,
    );
