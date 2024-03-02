import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/auth/custom_auth/auth_util.dart';

dynamic decodeJwtPayload(String jwtToken) {
  final parts = jwtToken.split('.');
  if (parts.length != 3) {
    print('El token no es válido');
    return null;
  }

  var payload = parts[1];
  payload = base64.normalize(payload);
  final decodedPayload = utf8.decode(base64.decode(payload));
  final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;

  return payloadMap;
}
