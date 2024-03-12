import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'choice_keywords_model.dart';
export 'choice_keywords_model.dart';

class ChoiceKeywordsWidget extends StatefulWidget {
  const ChoiceKeywordsWidget({
    super.key,
    required this.keywords,
    required this.id,
  });

  final List<String>? keywords;
  final int? id;

  @override
  State<ChoiceKeywordsWidget> createState() => _ChoiceKeywordsWidgetState();
}

class _ChoiceKeywordsWidgetState extends State<ChoiceKeywordsWidget> {
  late ChoiceKeywordsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoiceKeywordsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.45,
      decoration: const BoxDecoration(),
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: FlutterFlowChoiceChips(
              options:
                  widget.keywords!.map((label) => ChipData(label)).toList(),
              onChanged: (val) async {
                setState(() => _model.choiceChipsValue = val?.firstOrNull);
                context.goNamed(
                  'keywordspage',
                  queryParameters: {
                    'id': serializeParam(
                      widget.id,
                      ParamType.int,
                    ),
                    'keywords': serializeParam(
                      _model.choiceChipsValue,
                      ParamType.String,
                    ),
                  }.withoutNulls,
                );
              },
              selectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).primaryText,
                    ),
                iconColor: FlutterFlowTheme.of(context).primaryText,
                iconSize: 6.0,
                elevation: 4.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
              unselectedChipStyle: ChipStyle(
                backgroundColor: FlutterFlowTheme.of(context).alternate,
                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Readex Pro',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 10.0,
                    ),
                iconColor: FlutterFlowTheme.of(context).secondaryText,
                iconSize: 18.0,
                elevation: 0.0,
                borderRadius: BorderRadius.circular(16.0),
              ),
              chipSpacing: 12.0,
              rowSpacing: 12.0,
              multiselect: false,
              alignment: WrapAlignment.start,
              controller: _model.choiceChipsValueController ??=
                  FormFieldController<List<String>>(
                [],
              ),
              wrapped: true,
            ),
          ),
        ],
      ),
    );
  }
}
