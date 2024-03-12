import '/components/navegacion/uploads_button/uploads_button_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'side_nav_mail_model.dart';
export 'side_nav_mail_model.dart';

class SideNavMailWidget extends StatefulWidget {
  const SideNavMailWidget({
    super.key,
    required this.selectedNav,
  });

  final int? selectedNav;

  @override
  State<SideNavMailWidget> createState() => _SideNavMailWidgetState();
}

class _SideNavMailWidgetState extends State<SideNavMailWidget>
    with TickerProviderStateMixin {
  late SideNavMailModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        MoveEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: const Offset(-100.0, 0.0),
          end: const Offset(0.0, 0.0),
        ),
      ],
    ),
  };

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavMailModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return
        // Menu lataral se recibe como parametro una variable llamada selectedNav la cual es un integer con el cual se evalua si se cambia de color el fondo del boton de navegacion
        Visibility(
      visible: responsiveVisibility(
        context: context,
        phone: false,
        tablet: false,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(0.0),
            bottomRight: Radius.circular(3.0),
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(3.0),
          ),
          child: Container(
            width: FFAppState().menus ? 80.0 : 220.0,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(3.0),
                topLeft: Radius.circular(0.0),
                topRight: Radius.circular(3.0),
              ),
              border: Border.all(
                width: 2.0,
              ),
            ),
            alignment: const AlignmentDirectional(0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.uploadsButtonModel,
                  updateCallback: () => setState(() {}),
                  child: const UploadsButtonWidget(),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'dashboard',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: FFAppState().menus ? 49.0 : 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: widget.selectedNav == 1
                            ? const Color(0xFF4C5564)
                            : const Color(0xFF242D3C),
                        borderRadius: BorderRadius.circular(6.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: widget.selectedNav == 1
                              ? const Color(0xFF4C5564)
                              : const Color(0xFF242D3C),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.text_fields_sharp,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            if (!FFAppState().menus)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'q6pp7ws2' /* Panel */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'dashboardOld',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: FFAppState().menus ? 49.0 : 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: widget.selectedNav == 3
                            ? const Color(0xFF4C5564)
                            : const Color(0xFF242D3C),
                        borderRadius: BorderRadius.circular(6.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: widget.selectedNav == 3
                              ? const Color(0xFF4C5564)
                              : const Color(0xFF242D3C),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.query_stats,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            if (!FFAppState().menus)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'p2klqhvm' /* Estatus */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'ProfilePage',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: FFAppState().menus ? 49.0 : 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: widget.selectedNav == 4
                            ? const Color(0xFF4C5564)
                            : const Color(0xFF242D3C),
                        borderRadius: BorderRadius.circular(6.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: widget.selectedNav == 4
                              ? const Color(0xFF4C5564)
                              : const Color(0xFF242D3C),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.person_sharp,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            if (!FFAppState().menus)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'ek3ckqq5' /* Perfil */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 190.0,
                  child: Divider(
                    thickness: 1.0,
                    indent: 8.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '7xxwk6ow' /* Administración */,
                    ),
                    style: FlutterFlowTheme.of(context).labelSmall,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 10.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.goNamed(
                        'users',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: const TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                            duration: Duration(milliseconds: 0),
                          ),
                        },
                      );
                    },
                    child: Container(
                      width: FFAppState().menus ? 49.0 : 200.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        color: widget.selectedNav == 2
                            ? const Color(0xFF4C5564)
                            : const Color(0xFF242D3C),
                        borderRadius: BorderRadius.circular(6.0),
                        shape: BoxShape.rectangle,
                        border: Border.all(
                          color: widget.selectedNav == 2
                              ? const Color(0xFF4C5564)
                              : const Color(0xFF242D3C),
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            12.0, 0.0, 12.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Icon(
                              Icons.manage_accounts,
                              color: FlutterFlowTheme.of(context).info,
                              size: 20.0,
                            ),
                            if (!FFAppState().menus)
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  FFLocalizations.of(context).getText(
                                    'nd6d3iik' /* Usuarios */,
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        fontSize: 12.0,
                                      ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
      ),
    );
  }
}
