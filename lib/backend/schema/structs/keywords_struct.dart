// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class KeywordsStruct extends BaseStruct {
  KeywordsStruct({
    String? keywords,
  }) : _keywords = keywords;

  // "keywords" field.
  String? _keywords;
  String get keywords => _keywords ?? '';
  set keywords(String? val) => _keywords = val;
  bool hasKeywords() => _keywords != null;

  static KeywordsStruct fromMap(Map<String, dynamic> data) => KeywordsStruct(
        keywords: data['keywords'] as String?,
      );

  static KeywordsStruct? maybeFromMap(dynamic data) =>
      data is Map ? KeywordsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'keywords': _keywords,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'keywords': serializeParam(
          _keywords,
          ParamType.String,
        ),
      }.withoutNulls;

  static KeywordsStruct fromSerializableMap(Map<String, dynamic> data) =>
      KeywordsStruct(
        keywords: deserializeParam(
          data['keywords'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'KeywordsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is KeywordsStruct && keywords == other.keywords;
  }

  @override
  int get hashCode => const ListEquality().hash([keywords]);
}

KeywordsStruct createKeywordsStruct({
  String? keywords,
}) =>
    KeywordsStruct(
      keywords: keywords,
    );
