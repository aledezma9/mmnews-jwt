// ignore_for_file: unnecessary_getters_setters


import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResultsStruct extends BaseStruct {
  ResultsStruct({
    ResultadosBusquedasStruct? results,
  }) : _results = results;

  // "results" field.
  ResultadosBusquedasStruct? _results;
  ResultadosBusquedasStruct get results =>
      _results ?? ResultadosBusquedasStruct();
  set results(ResultadosBusquedasStruct? val) => _results = val;
  void updateResults(Function(ResultadosBusquedasStruct) updateFn) =>
      updateFn(_results ??= ResultadosBusquedasStruct());
  bool hasResults() => _results != null;

  static ResultsStruct fromMap(Map<String, dynamic> data) => ResultsStruct(
        results: ResultadosBusquedasStruct.maybeFromMap(data['results']),
      );

  static ResultsStruct? maybeFromMap(dynamic data) =>
      data is Map ? ResultsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'results': _results?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'results': serializeParam(
          _results,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static ResultsStruct fromSerializableMap(Map<String, dynamic> data) =>
      ResultsStruct(
        results: deserializeStructParam(
          data['results'],
          ParamType.DataStruct,
          false,
          structBuilder: ResultadosBusquedasStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'ResultsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResultsStruct && results == other.results;
  }

  @override
  int get hashCode => const ListEquality().hash([results]);
}

ResultsStruct createResultsStruct({
  ResultadosBusquedasStruct? results,
}) =>
    ResultsStruct(
      results: results ?? ResultadosBusquedasStruct(),
    );
