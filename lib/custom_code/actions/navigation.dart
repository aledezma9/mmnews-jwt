// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future navigation(
  BuildContext context,
  String? page,
) async {
  // Add your function code here!
  Future navigation(String? page) async {
    // navigate to same page and reload
    await Navigator.pushReplacementNamed(context, page!);
  }
}
