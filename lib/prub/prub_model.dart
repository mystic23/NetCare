import '/flutter_flow/flutter_flow_util.dart';
import 'prub_widget.dart' show PrubWidget;
import 'package:flutter/material.dart';

class PrubModel extends FlutterFlowModel<PrubWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
