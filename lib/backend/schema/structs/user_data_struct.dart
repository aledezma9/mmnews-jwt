// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDataStruct extends BaseStruct {
  UserDataStruct({
    int? userId,
    String? userName,
    String? userEmail,
    bool? userActive,
    String? avatarUrl,
    int? tenantId,
    String? createdAt,
    String? updatedAt,
  })  : _userId = userId,
        _userName = userName,
        _userEmail = userEmail,
        _userActive = userActive,
        _avatarUrl = avatarUrl,
        _tenantId = tenantId,
        _createdAt = createdAt,
        _updatedAt = updatedAt;

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

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;
  bool hasUserEmail() => _userEmail != null;

  // "user_active" field.
  bool? _userActive;
  bool get userActive => _userActive ?? false;
  set userActive(bool? val) => _userActive = val;
  bool hasUserActive() => _userActive != null;

  // "avatar_url" field.
  String? _avatarUrl;
  String get avatarUrl => _avatarUrl ?? '';
  set avatarUrl(String? val) => _avatarUrl = val;
  bool hasAvatarUrl() => _avatarUrl != null;

  // "tenant_id" field.
  int? _tenantId;
  int get tenantId => _tenantId ?? 0;
  set tenantId(int? val) => _tenantId = val;
  void incrementTenantId(int amount) => _tenantId = tenantId + amount;
  bool hasTenantId() => _tenantId != null;

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

  static UserDataStruct fromMap(Map<String, dynamic> data) => UserDataStruct(
        userId: castToType<int>(data['user_id']),
        userName: data['user_name'] as String?,
        userEmail: data['user_email'] as String?,
        userActive: data['user_active'] as bool?,
        avatarUrl: data['avatar_url'] as String?,
        tenantId: castToType<int>(data['tenant_id']),
        createdAt: data['created_at'] as String?,
        updatedAt: data['updated_at'] as String?,
      );

  static UserDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'user_id': _userId,
        'user_name': _userName,
        'user_email': _userEmail,
        'user_active': _userActive,
        'avatar_url': _avatarUrl,
        'tenant_id': _tenantId,
        'created_at': _createdAt,
        'updated_at': _updatedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_active': serializeParam(
          _userActive,
          ParamType.bool,
        ),
        'avatar_url': serializeParam(
          _avatarUrl,
          ParamType.String,
        ),
        'tenant_id': serializeParam(
          _tenantId,
          ParamType.int,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'updated_at': serializeParam(
          _updatedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserDataStruct(
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
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userActive: deserializeParam(
          data['user_active'],
          ParamType.bool,
          false,
        ),
        avatarUrl: deserializeParam(
          data['avatar_url'],
          ParamType.String,
          false,
        ),
        tenantId: deserializeParam(
          data['tenant_id'],
          ParamType.int,
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
      );

  @override
  String toString() => 'UserDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserDataStruct &&
        userId == other.userId &&
        userName == other.userName &&
        userEmail == other.userEmail &&
        userActive == other.userActive &&
        avatarUrl == other.avatarUrl &&
        tenantId == other.tenantId &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userId,
        userName,
        userEmail,
        userActive,
        avatarUrl,
        tenantId,
        createdAt,
        updatedAt
      ]);
}

UserDataStruct createUserDataStruct({
  int? userId,
  String? userName,
  String? userEmail,
  bool? userActive,
  String? avatarUrl,
  int? tenantId,
  String? createdAt,
  String? updatedAt,
}) =>
    UserDataStruct(
      userId: userId,
      userName: userName,
      userEmail: userEmail,
      userActive: userActive,
      avatarUrl: avatarUrl,
      tenantId: tenantId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
