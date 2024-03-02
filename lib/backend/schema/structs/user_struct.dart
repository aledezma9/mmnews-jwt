// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? exp,
    String? userEmail,
    String? userName,
    int? userId,
    bool? userActive,
    List<TenantStruct>? tenant,
  })  : _exp = exp,
        _userEmail = userEmail,
        _userName = userName,
        _userId = userId,
        _userActive = userActive,
        _tenant = tenant;

  // "exp" field.
  int? _exp;
  int get exp => _exp ?? 0;
  set exp(int? val) => _exp = val;
  void incrementExp(int amount) => _exp = exp + amount;
  bool hasExp() => _exp != null;

  // "user_email" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;
  bool hasUserEmail() => _userEmail != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;
  bool hasUserName() => _userName != null;

  // "user_id" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;
  void incrementUserId(int amount) => _userId = userId + amount;
  bool hasUserId() => _userId != null;

  // "user_active" field.
  bool? _userActive;
  bool get userActive => _userActive ?? false;
  set userActive(bool? val) => _userActive = val;
  bool hasUserActive() => _userActive != null;

  // "tenant" field.
  List<TenantStruct>? _tenant;
  List<TenantStruct> get tenant => _tenant ?? const [];
  set tenant(List<TenantStruct>? val) => _tenant = val;
  void updateTenant(Function(List<TenantStruct>) updateFn) =>
      updateFn(_tenant ??= []);
  bool hasTenant() => _tenant != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        exp: castToType<int>(data['exp']),
        userEmail: data['user_email'] as String?,
        userName: data['user_name'] as String?,
        userId: castToType<int>(data['user_id']),
        userActive: data['user_active'] as bool?,
        tenant: getStructList(
          data['tenant'],
          TenantStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'exp': _exp,
        'user_email': _userEmail,
        'user_name': _userName,
        'user_id': _userId,
        'user_active': _userActive,
        'tenant': _tenant?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'exp': serializeParam(
          _exp,
          ParamType.int,
        ),
        'user_email': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'user_name': serializeParam(
          _userName,
          ParamType.String,
        ),
        'user_id': serializeParam(
          _userId,
          ParamType.int,
        ),
        'user_active': serializeParam(
          _userActive,
          ParamType.bool,
        ),
        'tenant': serializeParam(
          _tenant,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        exp: deserializeParam(
          data['exp'],
          ParamType.int,
          false,
        ),
        userEmail: deserializeParam(
          data['user_email'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['user_name'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['user_id'],
          ParamType.int,
          false,
        ),
        userActive: deserializeParam(
          data['user_active'],
          ParamType.bool,
          false,
        ),
        tenant: deserializeStructParam<TenantStruct>(
          data['tenant'],
          ParamType.DataStruct,
          true,
          structBuilder: TenantStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        exp == other.exp &&
        userEmail == other.userEmail &&
        userName == other.userName &&
        userId == other.userId &&
        userActive == other.userActive &&
        listEquality.equals(tenant, other.tenant);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([exp, userEmail, userName, userId, userActive, tenant]);
}

UserStruct createUserStruct({
  int? exp,
  String? userEmail,
  String? userName,
  int? userId,
  bool? userActive,
}) =>
    UserStruct(
      exp: exp,
      userEmail: userEmail,
      userName: userName,
      userId: userId,
      userActive: userActive,
    );
