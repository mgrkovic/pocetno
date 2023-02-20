import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Template1Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for userName widget.
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  // State field(s) for shortBio widget.
  TextEditingController? shortBioController;
  String? Function(BuildContext, String?)? shortBioControllerValidator;
  // State field(s) for teamSelect widget.
  String? teamSelectValue;
  // State field(s) for userSelect widget.
  String? userSelectValue1;
  // State field(s) for userSelect widget.
  String? userSelectValue2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    userNameController?.dispose();
    shortBioController?.dispose();
  }

  /// Additional helper methods are added here.

}
