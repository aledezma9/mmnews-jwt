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

String? getInitiales(String email) {
  List<String> parts = email.split('@');
  if (parts.length == 2) {
    String firstPart = parts[0];
    List<String> nameSurname = firstPart.split('.');
    if (nameSurname.length == 2) {
      String initials = nameSurname[0][0] + nameSurname[1][0];
      return initials.toUpperCase();
    } else {
      return null;
    }
  } else {
    return null;
  }
}

String? formatTimeStamp(String date) {
  try {
    final dateTime = DateTime.parse(date);
    final formattedDate = DateFormat('yyyy/MM/dd HH:mm:ss').format(dateTime);
    return formattedDate;
  } catch (e) {
    print('Error formatting timestamp: $e');
    return null;
  }
}

String formatName(String input) {
  if (input.contains('.')) {
    // Divide el input en dos partes
    List<String> parts = input.split('.');

    // Capitaliza la primera letra de cada parte y las une con un espacio
    return parts
        .map((part) => part[0].toUpperCase() + part.substring(1))
        .join(' ');
  } else {
    // Si no hay punto, solo capitaliza la primera letra
    return input[0].toUpperCase() + input.substring(1);
  }
}

dynamic extractExpirationToken(String token) {
  // Separa el token JWT en sus partes componentes
  final parts = token.split('.');
  // Verifica que el token tenga la estructura correcta
  if (parts.length != 3) {
    print('El token no es válido');
    return null;
  }

  // Obtiene el payload del token y lo decodifica
  var payload = parts[1];
  payload = base64.normalize(payload);
  final decodedPayload = utf8.decode(base64.decode(payload));
  final payloadMap = json.decode(decodedPayload) as Map<String, dynamic>;

  // Extrae el valor de expiración (exp) del payload
  final expirationTime = payloadMap['exp'];

  return expirationTime;
}

String expiratinTimeToken(
  int expEpoch,
  int localEpoch,
) {
  // Calcula la diferencia
  // DateTime exp = DateTime.fromMillisecondsSinceEpoch(expEpoch * 1000);
  // DateTime local = DateTime.fromMillisecondsSinceEpoch(localEpoch * 1000);

  // // Calcula la diferencia
  // Duration diferencia = exp.difference(local);

  // // Calcula los minutos
  // // int minutos = diferencia.inMinutes;
  // // int seconds = (diferencia.inSeconds % 60);

  // String minutos =
  //     diferencia.inMinutes.remainder(60).toString().padLeft(2, '0');
  // String seconds =
  //     (diferencia.inSeconds.remainder(60)).toString().padLeft(2, '0');

  // return "$minutos:$seconds";

  // DateTime exp = DateTime.fromMillisecondsSinceEpoch(expEpoch * 1000);
  // DateTime local = DateTime.fromMillisecondsSinceEpoch(localEpoch * 1000);

  // // Calcula la diferencia
  // Duration diferencia = exp.difference(local);

  // // Calcula los minutos y segundos, asegurándose de que siempre tengan dos dígitos
  // int totalMinutos = diferencia.inMinutes.remainder(60);
  // String minutos = totalMinutos.toString().padLeft(2, '0');
  // String seconds =
  //     (diferencia.inSeconds.remainder(60)).toString().padLeft(2, '0');

  // // Devuelve solo segundos si no hay minutos restantes, de lo contrario devuelve minutos:segundos
  // if (totalMinutos == 0) {
  //   return seconds;
  // } else {
  //   return "$minutos:$seconds";
  // }

  // Calcula la diferencia
  DateTime exp = DateTime.fromMillisecondsSinceEpoch(expEpoch * 1000);
  DateTime local = DateTime.fromMillisecondsSinceEpoch(localEpoch * 1000);

  // Calcula la diferencia
  Duration diferencia = exp.difference(local);

  // Calcula los minutos y segundos
  int totalMinutos = diferencia.inMinutes.remainder(60);
  int totalSegundos = diferencia.inSeconds.remainder(60);

  // Determina el texto adecuado para minutos o segundos
  String textoTiempo;
  if (totalMinutos > 1) {
    textoTiempo =
        "$totalMinutos:${totalSegundos.toString().padLeft(2, '0')} Minutos";
  } else if (totalMinutos == 1) {
    textoTiempo = "01:${totalSegundos.toString().padLeft(2, '0')} Minuto";
  } else if (totalSegundos > 0) {
    textoTiempo = "${totalSegundos.toString().padLeft(2, '0')} Segundos";
  } else {
    // En caso de no haber diferencia
    textoTiempo = "00 Segundos";
  }

  return textoTiempo;
}

bool isExpirationWithinFiveMinutes(
  int expEpoch,
  int localEpoch,
) {
  DateTime exp = DateTime.fromMillisecondsSinceEpoch(expEpoch * 1000);
  DateTime local = DateTime.fromMillisecondsSinceEpoch(localEpoch * 1000);

  // Calcula la diferencia
  Duration diferencia = exp.difference(local);

  // Verifica si la diferencia en minutos es menor a 5
  return diferencia.inMinutes < 5;
}
