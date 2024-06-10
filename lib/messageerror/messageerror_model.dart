import '/flutter_flow/flutter_flow_util.dart';
import 'messageerror_widget.dart' show MessageerrorWidget;
import 'package:flutter/material.dart';

class MessageerrorModel extends FlutterFlowModel<MessageerrorWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
