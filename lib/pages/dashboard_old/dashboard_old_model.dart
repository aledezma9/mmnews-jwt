import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/navegacion/side_nav_mail/side_nav_mail_widget.dart';
import '/components/ratingbar_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import 'dart:async';
import 'dashboard_old_widget.dart' show DashboardOldWidget;
import 'package:flutter/material.dart';

class DashboardOldModel extends FlutterFlowModel<DashboardOldWidget> {
  ///  Local state fields for this page.

  bool tableMode = false;

  bool modal = false;

  bool busquedas = false;

  int sizetranscripciones = 10;

  int pagetranscripciones = 1;

  int? page = 1;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  InstantTimer? instantTimer;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Model for sideNav_Mail component.
  late SideNavMailModel sideNavMailModel;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController1 =
      FlutterFlowDataTableController<TranscriptionTableStruct>();
  // Models for ratingbar dynamic component.
  late FlutterFlowDynamicModels<RatingbarModel> ratingbarModels1;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController2 =
      FlutterFlowDataTableController<dynamic>();
  // State field(s) for GridViewAll widget.
  ScrollController? gridViewAll1;
  // State field(s) for Row widget.
  ScrollController? rowController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for GridViewAll widget.
  ScrollController? gridViewAll2;
  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for Buscador widget.
  FocusNode? buscadorFocusNode;
  TextEditingController? buscadorController;
  String? Function(BuildContext, String?)? buscadorControllerValidator;
  // Stores action output result for [Backend Call - API (Search)] action in Buscador widget.
  ApiCallResponse? resultadosApiBusquedas;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavMailModel = createModel(context, () => SideNavMailModel());
    ratingbarModels1 = FlutterFlowDynamicModels(() => RatingbarModel());
    gridViewAll1 = ScrollController();
    rowController = ScrollController();
    gridViewAll2 = ScrollController();
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    instantTimer?.cancel();
    sideNavMailModel.dispose();
    ratingbarModels1.dispose();
    gridViewAll1?.dispose();
    rowController?.dispose();
    gridViewAll2?.dispose();
    listViewController?.dispose();
    buscadorFocusNode?.dispose();
    buscadorController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
