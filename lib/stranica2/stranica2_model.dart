import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Stranica2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for Row widget.
  ScrollController? rowController1;
  // State field(s) for Row widget.
  ScrollController? rowController2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    rowController1 = ScrollController();
    rowController2 = ScrollController();
  }

  void dispose() {
    columnController?.dispose();
    rowController1?.dispose();
    rowController2?.dispose();
  }

  /// Additional helper methods are added here.

}
