import '/flutter_flow/flutter_flow_util.dart';
import 'user_home_widget.dart' show UserHomeWidget;
import 'package:flutter/material.dart';

class UserHomeModel extends FlutterFlowModel<UserHomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
