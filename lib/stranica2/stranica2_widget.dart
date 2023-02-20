import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stranica2_model.dart';
export 'stranica2_model.dart';

class Stranica2Widget extends StatefulWidget {
  const Stranica2Widget({
    Key? key,
    this.search,
  }) : super(key: key);

  final List<String>? search;

  @override
  _Stranica2WidgetState createState() => _Stranica2WidgetState();
}

class _Stranica2WidgetState extends State<Stranica2Widget> {
  late Stranica2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Stranica2Model());
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          FFLocalizations.of(context).getText(
            '6tv7voxa' /* SASTANCI */,
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
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
            child: SingleChildScrollView(
              controller: _model.columnController,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _model.rowController2?.animateTo(
                              _model.rowController2!.position.maxScrollExtent,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'g5mj3g3l' /* FAZE SASTANKA */,
                            ),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: Color(0xFFED135D),
                                      fontSize: 24,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      await _model.rowController2?.animateTo(
                        _model.rowController2!.position.maxScrollExtent,
                        duration: Duration(milliseconds: 10000),
                        curve: Curves.ease,
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _model.rowController2?.animateTo(
                              0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'jwa6ump4' /* 1. Priprema sastanka */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () async {
                          await _model.rowController2?.animateTo(
                            _model.rowController2!.position.maxScrollExtent,
                            duration: Duration(milliseconds: 100),
                            curve: Curves.ease,
                          );
                        },
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '1wpwe9jo' /* 2. Tijek sastanka */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        InkWell(
                          onTap: () async {
                            await _model.columnController?.animateTo(
                              0,
                              duration: Duration(milliseconds: 100),
                              curve: Curves.ease,
                            );
                          },
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'r97r7uk7' /* 3. Aktivnosti poslije sastanka */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _model.rowController1,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            'k9dwbtrh' /* 1. Priprema sastanka */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF2C0909),
                                    fontWeight: FontWeight.bold,
                                  ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'd9tufvn1' /* 1. Definirati vrijeme trajanja... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SelectionArea(
                          child: Text(
                        FFLocalizations.of(context).getText(
                          'pyj204d5' /* 2. Tijek sastanka */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF2C0909),
                              fontWeight: FontWeight.bold,
                            ),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: Text(
                            FFLocalizations.of(context).getText(
                              'cikqeqyu' /* 2. Obvezna priprema sudionika ... */,
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    controller: _model.rowController2,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SelectionArea(
                            child: Text(
                          FFLocalizations.of(context).getText(
                            'qgkj5kcv' /* 3. Aktivnosti poslije sastanka */,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF2C0909),
                                    fontWeight: FontWeight.bold,
                                  ),
                        )),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Text(
                          FFLocalizations.of(context).getText(
                            '9u7b0qt7' /* 3. Obvezno strukturiranje done... */,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
