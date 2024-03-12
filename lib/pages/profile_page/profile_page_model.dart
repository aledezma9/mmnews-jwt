import '/components/navegacion/side_nav_mail/side_nav_mail_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for sideNav_Mail component.
  late SideNavMailModel sideNavMailModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    sideNavMailModel = createModel(context, () => SideNavMailModel());
  }

  @override
  void dispose() {
    sideNavMailModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
