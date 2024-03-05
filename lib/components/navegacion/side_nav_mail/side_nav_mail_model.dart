import '/components/navegacion/uploads_button/uploads_button_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'side_nav_mail_widget.dart' show SideNavMailWidget;
import 'package:flutter/material.dart';

class SideNavMailModel extends FlutterFlowModel<SideNavMailWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for UploadsButton component.
  late UploadsButtonModel uploadsButtonModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    uploadsButtonModel = createModel(context, () => UploadsButtonModel());
  }

  @override
  void dispose() {
    uploadsButtonModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
