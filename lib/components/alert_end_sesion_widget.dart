import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'alert_end_sesion_model.dart';
export 'alert_end_sesion_model.dart';

class AlertEndSesionWidget extends StatefulWidget {
  const AlertEndSesionWidget({
    super.key,
    required this.navigare,
  });

  final String? navigare;

  @override
  State<AlertEndSesionWidget> createState() => _AlertEndSesionWidgetState();
}

class _AlertEndSesionWidgetState extends State<AlertEndSesionWidget>
    with TickerProviderStateMixin {
  late AlertEndSesionModel _model;

  final animationsMap = {
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        VisibilityEffect(duration: 300.ms),
        MoveEffect(
          curve: Curves.bounceOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: const Offset(0.0, 100.0),
          end: const Offset(0.0, 0.0),
        ),
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 300.ms,
          duration: 400.ms,
          begin: 0.0,
          end: 1.0,
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
    _model = createModel(context, () => AlertEndSesionModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 100),
        callback: (timer) async {
          setState(() {});
          if (dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                currentUserData?.exp,
                0,
              )).secondsSinceEpoch ==
              getCurrentTimestamp.secondsSinceEpoch) {
            _model.updatePage(() {
              FFAppState().logout = true;
            });
            Navigator.pop(context);
            if (widget.navigare == 'users') {
              _model.updatePage(() {
                FFAppState().logout = true;
              });

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
            } else if (widget.navigare == 'dashboard') {
              _model.updatePage(() {
                FFAppState().logout = true;
              });

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
            } else {
              return;
            }
          }
        },
        startImmediately: true,
      );
    });

    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).accent4,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 2.0, 16.0, 16.0),
            child: Container(
              width: double.infinity,
              constraints: const BoxConstraints(
                maxWidth: 570.0,
              ),
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 12.0,
                    color: Color(0x1E000000),
                    offset: Offset(0.0, 5.0),
                  )
                ],
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 16.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'laeoua8l' /* Tu sesion caducara pronto */,
                        ),
                        style: FlutterFlowTheme.of(context).headlineMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Text(
                        valueOrDefault<String>(
                          widget.navigare,
                          'navegar',
                        ),
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(24.0, 4.0, 24.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '8zd42szu' /* Quieres continuar? */,
                        ),
                        style: FlutterFlowTheme.of(context).labelMedium,
                      ),
                    ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Text(
                          dateTimeFromSecondsSinceEpoch(valueOrDefault<int>(
                            currentUserData?.exp,
                            0,
                          )).secondsSinceEpoch.toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      phone: false,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            24.0, 4.0, 24.0, 0.0),
                        child: Text(
                          getCurrentTimestamp.secondsSinceEpoch.toString(),
                          style: FlutterFlowTheme.of(context).labelMedium,
                        ),
                      ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 32.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 1.0, 0.0),
                                child: Text(
                                  'Tu sesion caduca en ',
                                  style:
                                      FlutterFlowTheme.of(context).bodyMedium,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: Text(
                                  functions.expiratinTimeToken(currentAuthTokenExpiration!.secondsSinceEpoch, getCurrentTimestamp.secondsSinceEpoch),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Readex Pro',
                                        fontSize: 18.0,
                                      ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 24.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.05),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      _model.updatePage(() {
                                        FFAppState().logout = true;
                                      });
                                      Navigator.pop(context);
                                      if (widget.navigare == 'users') {
                                        _model.updatePage(() {
                                          FFAppState().logout = true;
                                        });

                                        context.goNamed(
                                          'users',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else if (widget.navigare ==
                                          'dashboard') {
                                        _model.updatePage(() {
                                          FFAppState().logout = true;
                                        });

                                        context.goNamed(
                                          'dashboard',
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: const TransitionInfo(
                                              hasTransition: true,
                                              transitionType:
                                                  PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                            ),
                                          },
                                        );
                                      } else {
                                        return;
                                      }
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'cq6e5efp' /* Salir de la aplicación */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium,
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      hoverColor: FlutterFlowTheme.of(context)
                                          .alternate,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        width: 2.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      hoverElevation: 3.0,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: const AlignmentDirectional(0.0, 0.05),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      var shouldSetState = false;
                                      _model.newRefreshToken =
                                          await TranscriptionAPIGroup
                                              .refreshTokenCall
                                              .call(
                                        refreshToken: currentAuthRefreshToken,
                                      );
                                      shouldSetState = true;
                                      if ((_model.newRefreshToken?.succeeded ??
                                          true)) {
                                        authManager.updateAuthUserData(
                                          authenticationToken:
                                              TranscriptionAPIGroup
                                                  .refreshTokenCall
                                                  .newAccessToken(
                                            (_model.newRefreshToken?.jsonBody ??
                                                ''),
                                          ),
                                          refreshToken: currentAuthRefreshToken,
                                          tokenExpiration:
                                              dateTimeFromSecondsSinceEpoch(
                                                  functions
                                                      .extractExpirationToken(
                                                          TranscriptionAPIGroup
                                                              .refreshTokenCall
                                                              .newAccessToken(
                                            (_model.newRefreshToken?.jsonBody ??
                                                ''),
                                          )!)),
                                          userData: UserStruct.maybeFromMap(
                                              functions.decodeJwtPayload(
                                                  TranscriptionAPIGroup
                                                      .refreshTokenCall
                                                      .newAccessToken(
                                            (_model.newRefreshToken?.jsonBody ??
                                                ''),
                                          )!)),
                                        );
                                        _model.updatePage(() {});
                                        Navigator.pop(context);
                                        if (widget.navigare == 'users') {
                                          context.pushNamed('users');

                                          _model.updatePage(() {
                                            FFAppState().logout = false;
                                          });
                                        } else if (widget.navigare ==
                                            'dashboard') {
                                          context.pushNamed('dashboard');

                                          _model.updatePage(() {
                                            FFAppState().logout = false;
                                          });
                                        } else {
                                          if (shouldSetState) setState(() {});
                                          return;
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              (_model.newRefreshToken
                                                      ?.bodyText ??
                                                  ''),
                                              style: TextStyle(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                              ),
                                            ),
                                            duration:
                                                const Duration(milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }

                                      if (shouldSetState) setState(() {});
                                    },
                                    text: FFLocalizations.of(context).getText(
                                      'c5t9oyle' /* Continuar */,
                                    ),
                                    options: FFButtonOptions(
                                      height: 44.0,
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).success,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall,
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                      hoverColor:
                                          FlutterFlowTheme.of(context).accent1,
                                      hoverBorderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        width: 1.0,
                                      ),
                                      hoverTextColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      hoverElevation: 0.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ).animateOnPageLoad(animationsMap['containerOnPageLoadAnimation']!),
          ),
        ],
      ),
    );
  }
}
