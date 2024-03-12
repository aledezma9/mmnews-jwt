import '/components/choice_keywords/choice_keywords_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'details_widget.dart' show DetailsWidget;
import 'package:flutter/material.dart';

class DetailsModel extends FlutterFlowModel<DetailsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for Column widget.
  ScrollController? columnController1;
  // State field(s) for Column widget.
  ScrollController? columnController2;
  // State field(s) for MouseRegion widget.
  bool mouseRegionHovered = false;
  // Model for ChoiceKeywords component.
  late ChoiceKeywordsModel choiceKeywordsModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    columnController1 = ScrollController();
    columnController2 = ScrollController();
    choiceKeywordsModel = createModel(context, () => ChoiceKeywordsModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    columnController1?.dispose();
    columnController2?.dispose();
    choiceKeywordsModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
