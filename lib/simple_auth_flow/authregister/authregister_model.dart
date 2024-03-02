import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'authregister_widget.dart' show AuthregisterWidget;
import 'package:flutter/material.dart';

class AuthregisterModel extends FlutterFlowModel<AuthregisterWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for Username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  // State field(s) for Email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  String? _emailControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'o8mbmn4a' /* El campo es requerido */,
      );
    }

    if (!RegExp(
            '^[a-zA-Z]+\\.[a-zA-Z]+@(multimedios\\.com|milenio\\.com|herkom\\.com)\$')
        .hasMatch(val)) {
      return FFLocalizations.of(context).getText(
        'u1u3o9vy' /* El correo electronico debe ser... */,
      );
    }
    return null;
  }

  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  String? _passwordControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '0vk13bor' /* El campo es requerido */,
      );
    }

    if (val.length < 6) {
      return FFLocalizations.of(context).getText(
        '31qnvq5w' /* El password debe ser de mas de... */,
      );
    }
    if (val.length > 8) {
      return FFLocalizations.of(context).getText(
        '4m4vn0xy' /* el password debe ser menor a 8... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Register User)] action in Button widget.
  ApiCallResponse? accountcreate;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    emailControllerValidator = _emailControllerValidator;
    passwordVisibility = false;
    passwordControllerValidator = _passwordControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    usernameFocusNode?.dispose();
    usernameController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    passwordFocusNode?.dispose();
    passwordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
