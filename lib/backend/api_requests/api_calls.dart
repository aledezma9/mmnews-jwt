import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start Transcription API Group Code

class TranscriptionAPIGroup {
  static String baseUrl = 'https://stage-gpt-api-v1.mmlabs.mx';
  static Map<String, String> headers = {};
  static RegisterUserCall registerUserCall = RegisterUserCall();
  static LoginUserCall loginUserCall = LoginUserCall();
  static GetAllUsersCall getAllUsersCall = GetAllUsersCall();
  static GetUserDataCall getUserDataCall = GetUserDataCall();
  static ActivateUserV1UsersUserEmailPutCall
      activateUserV1UsersUserEmailPutCall =
      ActivateUserV1UsersUserEmailPutCall();
  static GetUserByIdV1UsersIdIdGetCall getUserByIdV1UsersIdIdGetCall =
      GetUserByIdV1UsersIdIdGetCall();
  static DeactivateUserV1UsersDeactivateUserEmailPutCall
      deactivateUserV1UsersDeactivateUserEmailPutCall =
      DeactivateUserV1UsersDeactivateUserEmailPutCall();
  static GetTranscriptionStatusV1TranscriptionStatusGetCall
      getTranscriptionStatusV1TranscriptionStatusGetCall =
      GetTranscriptionStatusV1TranscriptionStatusGetCall();
  static CreateTranscriptionStatusV1TranscriptionStatusPostCall
      createTranscriptionStatusV1TranscriptionStatusPostCall =
      CreateTranscriptionStatusV1TranscriptionStatusPostCall();
  static GetTranscriptionStatusTodayV1TranscriptionStatusTodayGetCall
      getTranscriptionStatusTodayV1TranscriptionStatusTodayGetCall =
      GetTranscriptionStatusTodayV1TranscriptionStatusTodayGetCall();
  static GetTranscriptionStatusByUserIdV1TranscriptionStatusTodayIdGetCall
      getTranscriptionStatusByUserIdV1TranscriptionStatusTodayIdGetCall =
      GetTranscriptionStatusByUserIdV1TranscriptionStatusTodayIdGetCall();
  static GetTranscriptionTodayStatusByUserIdV1TranscriptionTodayStatusIdGetCall
      getTranscriptionTodayStatusByUserIdV1TranscriptionTodayStatusIdGetCall =
      GetTranscriptionTodayStatusByUserIdV1TranscriptionTodayStatusIdGetCall();
  static GetTranscriptionStatusByTitleV1TranscriptionStatusTitleGetCall
      getTranscriptionStatusByTitleV1TranscriptionStatusTitleGetCall =
      GetTranscriptionStatusByTitleV1TranscriptionStatusTitleGetCall();
  static UpdateTranscriptionStatusIsReadedV1TranscriptionStatusIdUserIdPostCall
      updateTranscriptionStatusIsReadedV1TranscriptionStatusIdUserIdPostCall =
      UpdateTranscriptionStatusIsReadedV1TranscriptionStatusIdUserIdPostCall();
  static GetAllTranscriptionsV1TranscriptionsGetCall
      getAllTranscriptionsV1TranscriptionsGetCall =
      GetAllTranscriptionsV1TranscriptionsGetCall();
  static UploadMediaTranscriptionV1TranscriptionsPostCall
      uploadMediaTranscriptionV1TranscriptionsPostCall =
      UploadMediaTranscriptionV1TranscriptionsPostCall();
  static GetAllTranscriptionsV1TranscriptionsTableGetCall
      getAllTranscriptionsV1TranscriptionsTableGetCall =
      GetAllTranscriptionsV1TranscriptionsTableGetCall();
  static GetTranscriptionsByIdV1TranscriptionsIdGetCall
      getTranscriptionsByIdV1TranscriptionsIdGetCall =
      GetTranscriptionsByIdV1TranscriptionsIdGetCall();
  static GetTranscriptionsByTitleV1TranscriptionsTitleTitleGetCall
      getTranscriptionsByTitleV1TranscriptionsTitleTitleGetCall =
      GetTranscriptionsByTitleV1TranscriptionsTitleTitleGetCall();
  static RatingTranscriptionV1TranscriptionsRatingPostCall
      ratingTranscriptionV1TranscriptionsRatingPostCall =
      RatingTranscriptionV1TranscriptionsRatingPostCall();
  static GetTranscriptionsChatV1TranscriptionsIdChatGetCall
      getTranscriptionsChatV1TranscriptionsIdChatGetCall =
      GetTranscriptionsChatV1TranscriptionsIdChatGetCall();
  static SearchV1SearchGetCall searchV1SearchGetCall = SearchV1SearchGetCall();
  static SearchByKeywordV1SearchKeywordGetCall
      searchByKeywordV1SearchKeywordGetCall =
      SearchByKeywordV1SearchKeywordGetCall();
  static GetChatV1ChatGetCall getChatV1ChatGetCall = GetChatV1ChatGetCall();
  static GetChatV1ChatIdGetCall getChatV1ChatIdGetCall =
      GetChatV1ChatIdGetCall();
  static GetAllTenantsV1TenantsGetCall getAllTenantsV1TenantsGetCall =
      GetAllTenantsV1TenantsGetCall();
  static CreateTenantV1TenantsPostCall createTenantV1TenantsPostCall =
      CreateTenantV1TenantsPostCall();
  static GetTenantByIdV1TenantsIdGetCall getTenantByIdV1TenantsIdGetCall =
      GetTenantByIdV1TenantsIdGetCall();
  static UpdateTenantV1TenantsIdPutCall updateTenantV1TenantsIdPutCall =
      UpdateTenantV1TenantsIdPutCall();
  static HealthHealthcheckGetCall healthHealthcheckGetCall =
      HealthHealthcheckGetCall();
  static HomeGetCall homeGetCall = HomeGetCall();
  static RefreshTokenCall refreshTokenCall = RefreshTokenCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static PasswordChangeCall passwordChangeCall = PasswordChangeCall();
}

class RegisterUserCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    int? tenantId,
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_email": "$userEmail",
  "password": "$password",
  "tenant_id": $tenantId
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Register User',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginUserCall {
  Future<ApiCallResponse> call({
    String? username = '',
    String? password = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Login User',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/login',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'username': username,
        'password': password,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
  String? refreshtoken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.refresh_token''',
      ));
}

class GetAllUsersCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get All Users',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserDataCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
    String? token = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Get User Data',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/$userEmail',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer $token',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ActivateUserV1UsersUserEmailPutCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'activate_user_v1_users__user_email__put',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/$userEmail',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserByIdV1UsersIdIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_user_by_id_v1_users_id__id__get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/id/$id',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class DeactivateUserV1UsersDeactivateUserEmailPutCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'deactivate_user_v1_users_deactivate__user_email__put',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/users/deactivate/$userEmail',
      callType: ApiCallType.PUT,
      headers: {},
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionStatusV1TranscriptionStatusGetCall {
  Future<ApiCallResponse> call({
    int? page,
    int? size,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_transcription_status_v1_transcription_status_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {
        'page': page,
        'size': size,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTranscriptionStatusV1TranscriptionStatusPostCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    const ffApiRequestBody = '''
{
  "title": "",
  "user_id": 0,
  "duration": 0,
  "status": "",
  "information": "",
  "media_thumbnail_path": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create_transcription_status_v1_transcription_status_post',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionStatusTodayV1TranscriptionStatusTodayGetCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'get_transcription_status_today_v1_transcription_status_today_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status/today',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionStatusByUserIdV1TranscriptionStatusTodayIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'get_transcription_status_by_user_id_v1_transcription_status_today__id__get',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status/today/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionTodayStatusByUserIdV1TranscriptionTodayStatusIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'get_transcription_today_status_by_user_id_v1_transcription_today_status__id__get',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/transcription/today/status/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionStatusByTitleV1TranscriptionStatusTitleGetCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'get_transcription_status_by_title_v1_transcription_status__title__get',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status/$title',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTranscriptionStatusIsReadedV1TranscriptionStatusIdUserIdPostCall {
  Future<ApiCallResponse> call({
    int? id,
    int? userId,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'update_transcription_status_is_readed_v1_transcription_status__id___user_id__post',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/transcription/status/$id/$userId',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllTranscriptionsV1TranscriptionsGetCall {
  Future<ApiCallResponse> call({
    int? page,
    int? size,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_all_transcriptions_v1_transcriptions_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {
        'page': page,
        'size': size,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UploadMediaTranscriptionV1TranscriptionsPostCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'upload_media_transcription_v1_transcriptions_post',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllTranscriptionsV1TranscriptionsTableGetCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_all_transcriptions_v1_transcriptions_table_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions/table',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionsByIdV1TranscriptionsIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_transcriptions_by_id_v1_transcriptions__id__get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionsByTitleV1TranscriptionsTitleTitleGetCall {
  Future<ApiCallResponse> call({
    String? title = '',
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName:
          'get_transcriptions_by_title_v1_transcriptions_title__title__get',
      apiUrl:
          '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions/title/$title',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RatingTranscriptionV1TranscriptionsRatingPostCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    const ffApiRequestBody = '''
{
  "id": 0,
  "rating": 0
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'rating_transcription_v1_transcriptions_rating_post',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions/rating',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTranscriptionsChatV1TranscriptionsIdChatGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_transcriptions_chat_v1_transcriptions__id__chat_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/transcriptions/$id/chat',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchV1SearchGetCall {
  Future<ApiCallResponse> call({
    String? q = '',
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search_v1_search_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/search',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchByKeywordV1SearchKeywordGetCall {
  Future<ApiCallResponse> call({
    String? q = '',
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'search_by_keyword_v1_search_keyword_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/search/keyword',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {
        'q': q,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChatV1ChatGetCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_chat_v1_chat_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/chat',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetChatV1ChatIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_chat_v1_chat__id__get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/chat/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetAllTenantsV1TenantsGetCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_all_tenants_v1_tenants_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/tenants',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class CreateTenantV1TenantsPostCall {
  Future<ApiCallResponse> call({
    String? xApiKey = '',
  }) async {
    const ffApiRequestBody = '''
{
  "tenant_id": 0,
  "tenant_name": "",
  "created_at": "",
  "updated_at": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'create_tenant_v1_tenants_post',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/tenants',
      callType: ApiCallType.POST,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class GetTenantByIdV1TenantsIdGetCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'get_tenant_by_id_v1_tenants__id__get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/tenants/$id',
      callType: ApiCallType.GET,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class UpdateTenantV1TenantsIdPutCall {
  Future<ApiCallResponse> call({
    int? id,
    String? xApiKey = '',
  }) async {
    const ffApiRequestBody = '''
{
  "tenant_id": 0,
  "tenant_name": "",
  "created_at": "",
  "updated_at": ""
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'update_tenant_v1_tenants__id__put',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/tenants/$id',
      callType: ApiCallType.PUT,
      headers: {
        'x-api-key': '$xApiKey',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class HealthHealthcheckGetCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'health_healthcheck_get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/healthcheck',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class HomeGetCall {
  Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'home__get',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RefreshTokenCall {
  Future<ApiCallResponse> call({
    String? refreshToken = '',
  }) async {
    final ffApiRequestBody = '''
{
  "refresh_token": "$refreshToken"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Refresh Token',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/refresh_token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? newAccessToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.access_token''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? userEmail = '',
  }) async {
    final ffApiRequestBody = '''
{
  "user_email": "$userEmail"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Reset Password',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/password/reset',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class PasswordChangeCall {
  Future<ApiCallResponse> call({
    String? token = '',
    String? userEmail = '',
    String? password = '',
  }) async {
    final ffApiRequestBody = '''
{
  "token": "$token",
  "user_email": "$userEmail",
  "password": "$password"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Password Change',
      apiUrl: '${TranscriptionAPIGroup.baseUrl}/v1/users/password/change',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Transcription API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
