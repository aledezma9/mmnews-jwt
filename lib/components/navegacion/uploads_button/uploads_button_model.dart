import '/flutter_flow/flutter_flow_util.dart';
import 'uploads_button_widget.dart' show UploadsButtonWidget;
import 'package:flutter/material.dart';

class UploadsButtonModel extends FlutterFlowModel<UploadsButtonWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
