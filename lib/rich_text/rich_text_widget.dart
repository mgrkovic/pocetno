import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'rich_text_model.dart';
export 'rich_text_model.dart';

class RichTextWidget extends StatefulWidget {
  const RichTextWidget({Key? key}) : super(key: key);

  @override
  _RichTextWidgetState createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  late RichTextModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RichTextModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF2F8F1),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '6adv0stj' /* Rich Text */,
          ),
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(30, 30, 30, 30),
                      child: SelectionArea(
                          child: Text(
                        FFLocalizations.of(context).getText(
                          '9yvdnath' /* SELEKTIRANI TEKST */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1,
                      )),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'ahzw9gnk' /* BOGAT TEKST */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText2.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFA6193C),
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'vttphcq1' /*  Bogati tekst */,
                            ),
                            style: TextStyle(
                              color: Color(0xFF48A619),
                              fontSize: 34,
                            ),
                          ),
                          TextSpan(
                            text: FFLocalizations.of(context).getText(
                              'zp2npevr' /* MOGUĆNOST RAZLIČITOG FORMATIRA... */,
                            ),
                            style: GoogleFonts.getFont(
                              'Nunito',
                              color:
                                  FlutterFlowTheme.of(context).secondaryColor,
                            ),
                          )
                        ],
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFF131012),
                              fontWeight: FontWeight.normal,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
