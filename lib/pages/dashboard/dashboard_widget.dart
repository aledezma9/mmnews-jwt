import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_end_sesion_widget.dart';
import '/components/navegacion/side_nav_mail/side_nav_mail_widget.dart';
import '/components/user_settings_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'dashboard_model.dart';
export 'dashboard_model.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget>
    with TickerProviderStateMixin {
  late DashboardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'conditionalBuilderOnPageLoadAnimation': AnimationInfo(
      loop: true,
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.black,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
    'containerOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        TintEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          color: Colors.black,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      Function() navigate = () {};
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 1000),
        callback: (timer) async {
          if (FFAppState().logout) {
            GoRouter.of(context).prepareAuthEvent();
            await authManager.signOut();
            GoRouter.of(context).clearRedirectLocation();

            navigate =
                () => context.goNamedAuth('auth-login', context.mounted);
          } else {
            _model.apiAllUsers =
                await TranscriptionAPIGroup.getAllUsersCall.call(
              token: currentAuthenticationToken,
            );
            if ((_model.apiAllUsers?.succeeded ?? true)) {
              setState(() => _model.apiRequestCompleter = null);
              setState(() {});
              if (functions.isExpirationWithinFiveMinutes(
                      currentAuthTokenExpiration!.secondsSinceEpoch,
                      getCurrentTimestamp.secondsSinceEpoch)
                  ? true
                  : false) {
                _model.instantTimer?.cancel();
                setState(() {
                  FFAppState().logout = true;
                });
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (dialogContext) {
                    return Dialog(
                      elevation: 0,
                      insetPadding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      alignment: const AlignmentDirectional(0.0, 0.0)
                          .resolve(Directionality.of(context)),
                      child: GestureDetector(
                        onTap: () => _model.unfocusNode.canRequestFocus
                            ? FocusScope.of(context)
                                .requestFocus(_model.unfocusNode)
                            : FocusScope.of(context).unfocus(),
                        child: const AlertEndSesionWidget(
                          navigare: 'dashboard',
                        ),
                      ),
                    );
                  },
                ).then((value) => setState(() {}));
              } else {
                setState(() {
                  FFAppState().logout = false;
                });
              }
            } else {
              if ((_model.apiAllUsers?.statusCode ?? 200) == 401) {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                navigate =
                    () => context.goNamedAuth('auth-login', context.mounted);
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      (_model.apiAllUsers?.bodyText ?? ''),
                      style: FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Readex Pro',
                            color: FlutterFlowTheme.of(context).primaryText,
                          ),
                    ),
                    duration: const Duration(milliseconds: 4000),
                    backgroundColor: FlutterFlowTheme.of(context).tertiary,
                  ),
                );
              }
            }
          }
        },
        startImmediately: true,
      );

      navigate();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Builder(
      builder: (context) => FutureBuilder<ApiCallResponse>(
        future: (_model.apiRequestCompleter ??= Completer<ApiCallResponse>()
              ..complete(TranscriptionAPIGroup.getAllUsersCall.call(
                token: currentAuthenticationToken,
              )))
            .future,
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              body: Center(
                child: SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              ),
            );
          }
          final dashboardGetAllUsersResponse = snapshot.data!;
          return GestureDetector(
            onTap: () => _model.unfocusNode.canRequestFocus
                ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                : FocusScope.of(context).unfocus(),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
              appBar: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                title: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: const AlignmentDirectional(-1.0, 0.0),
                        child: Builder(
                          builder: (context) {
                            if (FFAppState().menus) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().menus) {
                                      setState(() {
                                        FFAppState().menus = false;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().menus = true;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 34.0,
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16.0, 0.0, 16.0, 0.0),
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    if (FFAppState().menus) {
                                      setState(() {
                                        FFAppState().menus = false;
                                      });
                                    } else {
                                      setState(() {
                                        FFAppState().menus = true;
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.menu_open,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 34.0,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    Builder(
                      builder: (context) => InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          await showAlignedDialog(
                            context: context,
                            isGlobal: false,
                            avoidOverflow: false,
                            targetAnchor: const AlignmentDirectional(1.0, -1.0)
                                .resolve(Directionality.of(context)),
                            followerAnchor: const AlignmentDirectional(1.0, -1.0)
                                .resolve(Directionality.of(context)),
                            builder: (dialogContext) {
                              return Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () =>
                                      _model.unfocusNode.canRequestFocus
                                          ? FocusScope.of(context)
                                              .requestFocus(_model.unfocusNode)
                                          : FocusScope.of(context).unfocus(),
                                  child: SizedBox(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.35,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.2,
                                    child: const UserSettingsWidget(
                                      navigate: 'dashboard',
                                    ),
                                  ),
                                ),
                              );
                            },
                          ).then((value) => setState(() {}));
                        },
                        child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).customColor1,
                            shape: BoxShape.circle,
                          ),
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            valueOrDefault<String>(
                              functions
                                  .getInitiales(currentUserData!.userEmail),
                              'usuario.usuario@test.com',
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 29.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'uwfqnhgg' /* v12 */,
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              fontSize: 19.0,
                            ),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        if (!FFAppState().logout) {
                          return Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).secondary,
                              shape: BoxShape.circle,
                            ),
                          );
                        } else {
                          return Container(
                            width: 30.0,
                            height: 30.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).error,
                              shape: BoxShape.circle,
                            ),
                          ).animateOnPageLoad(
                              animationsMap['containerOnPageLoadAnimation']!);
                        }
                      },
                    ).animateOnPageLoad(animationsMap[
                        'conditionalBuilderOnPageLoadAnimation']!),
                  ],
                ),
                actions: const [],
                centerTitle: false,
                elevation: 2.0,
              ),
              body: SafeArea(
                top: true,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          wrapWithModel(
                            model: _model.sideNavMailModel,
                            updateCallback: () => setState(() {}),
                            child: const SideNavMailWidget(
                              selectedNav: 1,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Align(
                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 3.0,
                                              color: Color(0x33000000),
                                              offset: Offset(0.0, 1.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                          border: Border.all(
                                            width: 2.0,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(1.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'wzjz1p79' /* Panel */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      24.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      4.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'krcwz6k1' /* Panel de Transcripciónes. */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Readex Pro',
                                                                  color: const Color(
                                                                      0xFF57636C),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          6.0, 12.0, 6.0, 0.0),
                                                  child: Builder(
                                                    builder: (context) {
                                                      final usuarios = (dashboardGetAllUsersResponse
                                                                      .jsonBody
                                                                      .toList()
                                                                      .map<UserDataStruct?>(
                                                                          UserDataStruct
                                                                              .maybeFromMap)
                                                                      .toList()
                                                                  as Iterable<
                                                                      UserDataStruct?>)
                                                              .withoutNulls
                                                              .toList() ??
                                                          [];
                                                      return FlutterFlowDataTable<
                                                          UserDataStruct>(
                                                        controller: _model
                                                            .paginatedDataTableController,
                                                        data: usuarios,
                                                        columnsBuilder:
                                                            (onSortChanged) => [
                                                          DataColumn2(
                                                            label:
                                                                DefaultTextStyle
                                                                    .merge(
                                                              softWrap: true,
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'uac74jhj' /* ID */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                              ),
                                                            ),
                                                            fixedWidth: 100.0,
                                                          ),
                                                          DataColumn2(
                                                            label:
                                                                DefaultTextStyle
                                                                    .merge(
                                                              softWrap: true,
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  '061ti0bw' /* Información del usuario */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          DataColumn2(
                                                            label:
                                                                DefaultTextStyle
                                                                    .merge(
                                                              softWrap: true,
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  's3q70b3r' /* Miembro desde: */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          DataColumn2(
                                                            label:
                                                                DefaultTextStyle
                                                                    .merge(
                                                              softWrap: true,
                                                              child: Text(
                                                                FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'oy1fd1bv' /* Estatus */,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Readex Pro',
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                        dataRowBuilder: (usuariosItem,
                                                                usuariosIndex,
                                                                selected,
                                                                onSelectChanged) =>
                                                            DataRow(
                                                          color:
                                                              MaterialStateProperty
                                                                  .all(
                                                            usuariosIndex % 2 ==
                                                                    0
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                          ),
                                                          cells: [
                                                            Text(
                                                              usuariosItem
                                                                  .userId
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                            Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          6.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: 40.0,
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor1,
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          functions
                                                                              .getInitiales(usuariosItem.userEmail),
                                                                          'US',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              color: FlutterFlowTheme.of(context).info,
                                                                              fontSize: 14.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      usuariosItem
                                                                          .userName,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                13.0,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Text(
                                                                        usuariosItem
                                                                            .userEmail,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'Readex Pro',
                                                                              fontSize: 12.0,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              valueOrDefault<
                                                                  String>(
                                                                functions.formatTimeStamp(
                                                                    usuariosItem
                                                                        .createdAt),
                                                                '0',
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Readex Pro',
                                                                    fontSize:
                                                                        12.0,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                          12.0),
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  if (usuariosItem
                                                                      .userActive) {
                                                                    _model.apiResultzkf =
                                                                        await TranscriptionAPIGroup
                                                                            .deactivateUserCall
                                                                            .call(
                                                                      userEmail:
                                                                          usuariosItem
                                                                              .userEmail,
                                                                      token:
                                                                          currentAuthenticationToken,
                                                                    );
                                                                    if ((_model
                                                                            .apiResultzkf
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      setState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                    }
                                                                  } else {
                                                                    _model.apiResultup8 =
                                                                        await TranscriptionAPIGroup
                                                                            .activeUserCall
                                                                            .call(
                                                                      userEmail:
                                                                          usuariosItem
                                                                              .userEmail,
                                                                      token:
                                                                          currentAuthenticationToken,
                                                                    );
                                                                    if ((_model
                                                                            .apiResultup8
                                                                            ?.succeeded ??
                                                                        true)) {
                                                                      setState(() =>
                                                                          _model.apiRequestCompleter =
                                                                              null);
                                                                    }
                                                                  }

                                                                  setState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              23.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        32.0,
                                                                    constraints:
                                                                        const BoxConstraints(
                                                                      maxHeight:
                                                                          double
                                                                              .infinity,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: usuariosItem.userActive
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .secondary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              23.0),
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                    ),
                                                                    alignment:
                                                                        const AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      usuariosItem
                                                                              .userActive
                                                                          ? 'Activo'
                                                                          : 'Inactivo',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'Readex Pro',
                                                                            fontSize:
                                                                                12.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ]
                                                              .map((c) =>
                                                                  DataCell(c))
                                                              .toList(),
                                                        ),
                                                        paginated: true,
                                                        selectable: false,
                                                        hidePaginator: false,
                                                        showFirstLastButtons:
                                                            true,
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                1.0,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        minWidth: 800.0,
                                                        headingRowHeight: 56.0,
                                                        dataRowHeight: 65.0,
                                                        columnSpacing: 2.0,
                                                        headingRowColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        addHorizontalDivider:
                                                            true,
                                                        addTopAndBottomDivider:
                                                            false,
                                                        hideDefaultHorizontalDivider:
                                                            false,
                                                        horizontalDividerColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryBackground,
                                                        horizontalDividerThickness:
                                                            1.0,
                                                        addVerticalDivider:
                                                            false,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.03,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  0.0,
                                                                  16.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Tu sesion caduca en ${functions.expiratinTimeToken(currentAuthTokenExpiration!.secondsSinceEpoch, getCurrentTimestamp.secondsSinceEpoch)}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      22.0,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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
            ),
          );
        },
      ),
    );
  }
}
