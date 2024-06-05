import '/flutter_flow/flutter_flow_util.dart';
import 'profile_specialist_widget.dart' show ProfileSpecialistWidget;
import 'package:flutter/material.dart';

class ProfileSpecialistModel extends FlutterFlowModel<ProfileSpecialistWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
