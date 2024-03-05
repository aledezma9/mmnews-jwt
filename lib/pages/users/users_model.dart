import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/navegacion/side_nav_mail/side_nav_mail_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'users_widget.dart' show UsersWidget;
import 'package:flutter/material.dart';

class UsersModel extends FlutterFlowModel<UsersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Get All Users)] action in users widget.
  ApiCallResponse? apiAllUsers;
  Completer<ApiCallResponse>? apiRequestCompleter;
  // Model for sideNav_Mail component.
  late SideNavMailModel sideNavMailModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<UserDataStruct>();
  // Stores action output result for [Backend Call - API (Deactivate User)] action in Container widget.
  ApiCallResponse? apiResultzkf;
  // Stores action output result for [Backend Call - API (Active User)] action in Container widget.
  ApiCallResponse? apiResultup8;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavMailModel = createModel(context, () => SideNavMailModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    sideNavMailModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
