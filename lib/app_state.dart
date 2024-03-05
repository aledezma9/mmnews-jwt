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

  bool _menus = false;
  bool get menus => _menus;
  set menus(bool value) {
    _menus = value;
  }

  List<int> _elementosHeadlines = [];
  List<int> get elementosHeadlines => _elementosHeadlines;
  set elementosHeadlines(List<int> value) {
    _elementosHeadlines = value;
  }

  void addToElementosHeadlines(int value) {
    _elementosHeadlines.add(value);
  }

  void removeFromElementosHeadlines(int value) {
    _elementosHeadlines.remove(value);
  }

  void removeAtIndexFromElementosHeadlines(int index) {
    _elementosHeadlines.removeAt(index);
  }

  void updateElementosHeadlinesAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _elementosHeadlines[index] = updateFn(_elementosHeadlines[index]);
  }

  void insertAtIndexInElementosHeadlines(int index, int value) {
    _elementosHeadlines.insert(index, value);
  }

  List<int> _elementosListaResumen = [];
  List<int> get elementosListaResumen => _elementosListaResumen;
  set elementosListaResumen(List<int> value) {
    _elementosListaResumen = value;
  }

  void addToElementosListaResumen(int value) {
    _elementosListaResumen.add(value);
  }

  void removeFromElementosListaResumen(int value) {
    _elementosListaResumen.remove(value);
  }

  void removeAtIndexFromElementosListaResumen(int index) {
    _elementosListaResumen.removeAt(index);
  }

  void updateElementosListaResumenAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    _elementosListaResumen[index] = updateFn(_elementosListaResumen[index]);
  }

  void insertAtIndexInElementosListaResumen(int index, int value) {
    _elementosListaResumen.insert(index, value);
  }

  bool _startTimer = true;
  bool get startTimer => _startTimer;
  set startTimer(bool value) {
    _startTimer = value;
  }

  bool _logout = false;
  bool get logout => _logout;
  set logout(bool value) {
    _logout = value;
  }

  bool _passwordNotMatch = true;
  bool get passwordNotMatch => _passwordNotMatch;
  set passwordNotMatch(bool value) {
    _passwordNotMatch = value;
  }
}
