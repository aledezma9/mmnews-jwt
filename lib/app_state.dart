import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  UserStruct _UsuarioAutenticado = UserStruct();
  UserStruct get UsuarioAutenticado => _UsuarioAutenticado;
  set UsuarioAutenticado(UserStruct value) {
    _UsuarioAutenticado = value;
  }

  void updateUsuarioAutenticadoStruct(Function(UserStruct) updateFn) {
    updateFn(_UsuarioAutenticado);
  }

  String _appname = '';
  String get appname => _appname;
  set appname(String value) {
    _appname = value;
  }
}
