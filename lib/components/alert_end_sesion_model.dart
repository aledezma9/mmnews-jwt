import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'alert_end_sesion_widget.dart' show AlertEndSesionWidget;
import 'package:flutter/material.dart';

class AlertEndSesionModel extends FlutterFlowModel<AlertEndSesionWidget> {
  ///  Local state fields for this component.

  bool caducidad = false;

  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - API (Refresh Token)] action in Button widget.
  ApiCallResponse? newRefreshToken;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
