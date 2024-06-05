import '/flutter_flow/flutter_flow_util.dart';
import 'search_i_a_widget.dart' show SearchIAWidget;
import 'package:flutter/material.dart';

class SearchIAModel extends FlutterFlowModel<SearchIAWidget> {
  ///  Local state fields for this page.

  String? respuesta;

  String? tokens;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Gemini - Generate Text] action in Button widget.
  String? respuestGemini;
  // Stores action output result for [Gemini - Count Tokens] action in Button widget.
  String? tokensGemini;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
