// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TenantStruct extends BaseStruct {
  TenantStruct({
    int? id,
    String? name,
  })  : _id = id,
        _name = name;

  // "id" field.
  int? _id;
  int get id => _id ?? 1;
  set id(int? val) => _id = val;
  void incrementId(int amount) => _id = id + amount;
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? 'monterrey';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  static TenantStruct fromMap(Map<String, dynamic> data) => TenantStruct(
        id: castToType<int>(data['id']),
        name: data['name'] as String?,
      );

  static TenantStruct? maybeFromMap(dynamic data) =>
      data is Map ? TenantStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.int,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static TenantStruct fromSerializableMap(Map<String, dynamic> data) =>
      TenantStruct(
        id: deserializeParam(
          data['id'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TenantStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TenantStruct && id == other.id && name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, name]);
}

TenantStruct createTenantStruct({
  int? id,
  String? name,
}) =>
    TenantStruct(
      id: id,
      name: name,
    );
