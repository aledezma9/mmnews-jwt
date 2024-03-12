import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/alert_end_sesion_widget.dart';
import '/components/auth/profile_component/profile_component_widget.dart';
import '/components/choice_keywords/choice_keywords_widget.dart';
import '/components/navegacion/side_nav_mail/side_nav_mail_widget.dart';
import '/components/ratingbar_widget.dart';
import '/components/search_component_widget.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'dart:async';
import 'package:aligned_tooltip/aligned_tooltip.dart';
import 'package:styled_divider/styled_divider.dart';
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (RootPageContext.isInactiveRootPage(context)) {
        return;
      }
      _model.instantTimer = InstantTimer.periodic(
        duration: const Duration(milliseconds: 3000),
        callback: (timer) async {
          setState(() => _model.apiRequestCompleter1 = null);
          setState(() => _model.apiRequestCompleter2 = null);
          if (functions.isExpirationWithinFiveMinutes(
              currentAuthTokenExpiration!.secondsSinceEpoch,
              getCurrentTimestamp.secondsSinceEpoch,
              FFAppState().logout,
              FFAppConstants.expirationTime)) {
            FFAppState().update(() {
              FFAppState().logout = true;
            });
            showDialog(
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
          }
          FFAppState().update(() {});
        },
        startImmediately: true,
      );
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    _model.buscadorController ??= TextEditingController();
    _model.buscadorFocusNode ??= FocusNode();

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
      builder: (context) => GestureDetector(
        onTap: () => _model.unfocusNode.canRequestFocus
            ? FocusScope.of(context).requestFocus(_model.unfocusNode)
            : FocusScope.of(context).unfocus(),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                  child: Text(
                    FFAppConstants.appname,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          fontSize: 19.0,
                        ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                  child: StyledVerticalDivider(
                    thickness: 3.0,
                    color: FlutterFlowTheme.of(context).primaryText,
                    lineStyle: DividerLineStyle.dotted,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: const AlignmentDirectional(-1.0, 0.0),
                    child: Builder(
                      builder: (context) => Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(18.0, 0.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            await showDialog(
                              context: context,
                              builder: (dialogContext) {
                                return Dialog(
                                  elevation: 0,
                                  insetPadding: EdgeInsets.zero,
                                  backgroundColor: Colors.transparent,
                                  alignment: const AlignmentDirectional(0.0, 0.0)
                                      .resolve(Directionality.of(context)),
                                  child: GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: const SearchComponentWidget(),
                                  ),
                                );
                              },
                            ).then((value) => setState(() {}));
                          },
                          child: Icon(
                            Icons.search,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 34.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                  tabletLandscape: false,
                  desktop: false,
                ))
                  Expanded(
                    child: Stack(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                8.0, 3.0, 8.0, 3.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.7,
                              child: TextFormField(
                                controller: _model.buscadorController,
                                focusNode: _model.buscadorFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.buscadorController',
                                  const Duration(milliseconds: 100),
                                  () async {
                                    _model.resultadosApiBusquedas =
                                        await TranscriptionAPIGroup.searchCall
                                            .call(
                                      q: _model.buscadorController.text,
                                      token: currentAuthenticationToken,
                                    );
                                    if ((_model.resultadosApiBusquedas
                                            ?.succeeded ??
                                        true)) {
                                      setState(() {
                                        _model.busquedas = true;
                                      });
                                    }

                                    setState(() {});
                                  },
                                ),
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText:
                                      FFLocalizations.of(context).getText(
                                    'jzp5rbeh' /* Busquedas... */,
                                  ),
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  hintStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  contentPadding: const EdgeInsets.all(5.0),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.buscadorControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                        ),
                        if (_model.busquedas)
                          Align(
                            alignment: const AlignmentDirectional(0.78, -0.05),
                            child: FlutterFlowIconButton(
                              borderColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: 8.0,
                              borderWidth: 1.0,
                              buttonSize: 35.0,
                              fillColor: FlutterFlowTheme.of(context).accent1,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                setState(() {
                                  _model.busquedas = false;
                                });
                                setState(() {
                                  _model.buscadorController?.clear();
                                });
                              },
                            ),
                          ),
                      ],
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
                              onTap: () => _model.unfocusNode.canRequestFocus
                                  ? FocusScope.of(context)
                                      .requestFocus(_model.unfocusNode)
                                  : FocusScope.of(context).unfocus(),
                              child: SizedBox(
                                height: MediaQuery.sizeOf(context).height * 0.4,
                                child: const ProfileComponentWidget(),
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
                          functions.getInitiales(currentUserData!.userEmail),
                          'usuario.usuario@test.com',
                        ),
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Readex Pro',
                              color: FlutterFlowTheme.of(context).info,
                            ),
                      ),
                    ),
                  ),
                ),
                if (responsiveVisibility(
                  context: context,
                  phone: false,
                  tablet: false,
                ))
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 29.0, 0.0),
                    child: Text(
                      FFAppConstants.version,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Readex Pro',
                            fontSize: 19.0,
                          ),
                    ),
                  ),
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
                                      borderRadius: BorderRadius.circular(3.0),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                          ))
                                                            Align(
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  if (FFAppState()
                                                                      .menus) {
                                                                    return Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          if (FFAppState()
                                                                              .menus) {
                                                                            setState(() {
                                                                              FFAppState().menus = false;
                                                                            });
                                                                          } else {
                                                                            setState(() {
                                                                              FFAppState().menus = true;
                                                                            });
                                                                          }
                                                                        },
                                                                        child:
                                                                            FaIcon(
                                                                          FontAwesomeIcons
                                                                              .handPointRight,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          size:
                                                                              34.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  } else {
                                                                    return Visibility(
                                                                      visible:
                                                                          responsiveVisibility(
                                                                        context:
                                                                            context,
                                                                        phone:
                                                                            false,
                                                                        tablet:
                                                                            false,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                        child:
                                                                            InkWell(
                                                                          splashColor:
                                                                              Colors.transparent,
                                                                          focusColor:
                                                                              Colors.transparent,
                                                                          hoverColor:
                                                                              Colors.transparent,
                                                                          highlightColor:
                                                                              Colors.transparent,
                                                                          onTap:
                                                                              () async {
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
                                                                          child:
                                                                              FaIcon(
                                                                            FontAwesomeIcons.solidHandPointLeft,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            size:
                                                                                34.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                              ),
                                                            ),
                                                          Builder(
                                                            builder: (context) {
                                                              if (_model
                                                                  .busquedas) {
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          6.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'kxgyog9v' /* Resultados.. */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              24.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                );
                                                              } else {
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          6.0,
                                                                          12.0,
                                                                          0.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    FFLocalizations.of(
                                                                            context)
                                                                        .getText(
                                                                      'dhyztyd0' /* Panel */,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              24.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  )),
                                                                );
                                                              }
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  22.0,
                                                                  4.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: SelectionArea(
                                                          child: Text(
                                                        FFLocalizations.of(
                                                                context)
                                                            .getText(
                                                          'tgyc8m53' /* Panel de Transcripciónes. */,
                                                        ),
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .labelMedium
                                                            .override(
                                                              fontFamily:
                                                                  'Readex Pro',
                                                              color: const Color(
                                                                  0xFF57636C),
                                                              fontSize: 14.0,
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
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: const Alignment(1.0, 0),
                                                  child:
                                                      FlutterFlowButtonTabBar(
                                                    useToggleButtonStyle: true,
                                                    isScrollable: true,
                                                    labelStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMedium,
                                                    unselectedLabelStyle:
                                                        const TextStyle(),
                                                    labelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryText,
                                                    unselectedLabelColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    backgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    unselectedBackgroundColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .background,
                                                    unselectedBorderColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .alternate,
                                                    borderWidth: 1.0,
                                                    borderRadius: 16.0,
                                                    elevation: 1.0,
                                                    buttonMargin:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(8.0, 0.0,
                                                                8.0, 0.0),
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 8.0,
                                                                16.0, 0.0),
                                                    tabs: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        18.0,
                                                                        8.0,
                                                                        18.0,
                                                                        8.0),
                                                            child: Icon(
                                                              Icons
                                                                  .grid_view_sharp,
                                                              color: _model
                                                                          .tabBarCurrentIndex ==
                                                                      0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : const Color(
                                                                      0xFF5E5E60),
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                          const Tab(
                                                            text: '',
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        18.0,
                                                                        8.0,
                                                                        18.0,
                                                                        8.0),
                                                            child: Icon(
                                                              Icons.table_chart,
                                                              color: _model
                                                                          .tabBarCurrentIndex ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : const Color(
                                                                      0xFF5E5E60),
                                                              size: 35.0,
                                                            ),
                                                          ),
                                                          const Tab(
                                                            text: '',
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                    controller:
                                                        _model.tabBarController,
                                                    onTap: (i) async {
                                                      [
                                                        () async {},
                                                        () async {}
                                                      ][i]();
                                                    },
                                                  ),
                                                ),
                                                Expanded(
                                                  child: TabBarView(
                                                    controller:
                                                        _model.tabBarController,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    children: [
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .busquedas) {
                                                              return FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: (_model.apiRequestCompleter1 ??= Completer<
                                                                        ApiCallResponse>()
                                                                      ..complete(TranscriptionAPIGroup
                                                                          .getAllTranscriptionsCall
                                                                          .call(
                                                                        token:
                                                                            currentAuthenticationToken,
                                                                        page: _model
                                                                            .pagetranscripciones,
                                                                        size: _model
                                                                            .sizetranscripciones,
                                                                      )))
                                                                    .future,
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final allTranscriptionGridGetAllTranscriptionsResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              const BoxDecoration(),
                                                                          child:
                                                                              Align(
                                                                            alignment:
                                                                                const AlignmentDirectional(0.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: const EdgeInsetsDirectional.fromSTEB(10.0, 8.0, 10.0, 0.0),
                                                                              child: Builder(
                                                                                builder: (context) {
                                                                                  final alltranscriptions = TranscriptionAPIGroup.getAllTranscriptionsCall
                                                                                          .items(
                                                                                            allTranscriptionGridGetAllTranscriptionsResponse.jsonBody,
                                                                                          )
                                                                                          ?.toList() ??
                                                                                      [];
                                                                                  return MasonryGridView.builder(
                                                                                    gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                      crossAxisCount: () {
                                                                                        if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                          return 2;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                          return 4;
                                                                                        } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                          return 6;
                                                                                        } else {
                                                                                          return 6;
                                                                                        }
                                                                                      }(),
                                                                                    ),
                                                                                    crossAxisSpacing: 2.0,
                                                                                    mainAxisSpacing: 2.0,
                                                                                    itemCount: alltranscriptions.length,
                                                                                    shrinkWrap: true,
                                                                                    itemBuilder: (context, alltranscriptionsIndex) {
                                                                                      final alltranscriptionsItem = alltranscriptions[alltranscriptionsIndex];
                                                                                      return Padding(
                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                        child: Wrap(
                                                                                          spacing: 8.0,
                                                                                          runSpacing: 4.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                              child: Container(
                                                                                                width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).mimi,
                                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 12.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Stack(
                                                                                                        alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsets.all(8.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                                              child: Image.network(
                                                                                                                getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.media_thumbnail_path''',
                                                                                                                ).toString(),
                                                                                                                width: double.infinity,
                                                                                                                height: 120.0,
                                                                                                                fit: BoxFit.fill,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                                                                                                            child: FlutterFlowIconButton(
                                                                                                              borderColor: FlutterFlowTheme.of(context).error,
                                                                                                              borderRadius: 20.0,
                                                                                                              borderWidth: 1.0,
                                                                                                              buttonSize: 30.0,
                                                                                                              fillColor: FlutterFlowTheme.of(context).error,
                                                                                                              icon: Icon(
                                                                                                                Icons.play_arrow,
                                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                                size: 15.0,
                                                                                                              ),
                                                                                                              onPressed: () async {
                                                                                                                context.pushNamed(
                                                                                                                  'details',
                                                                                                                  queryParameters: {
                                                                                                                    'id': serializeParam(
                                                                                                                      getJsonField(
                                                                                                                        alltranscriptionsItem,
                                                                                                                        r'''$.transcription_id''',
                                                                                                                      ),
                                                                                                                      ParamType.int,
                                                                                                                    ),
                                                                                                                    'title': serializeParam(
                                                                                                                      getJsonField(
                                                                                                                        alltranscriptionsItem,
                                                                                                                        r'''$.title''',
                                                                                                                      ).toString(),
                                                                                                                      ParamType.String,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  valueOrDefault<String>(
                                                                                                                    functions.duration(getJsonField(
                                                                                                                      alltranscriptionsItem,
                                                                                                                      r'''$.duration''',
                                                                                                                    ).toString()),
                                                                                                                    '00:00',
                                                                                                                  ),
                                                                                                                  maxLines: 2,
                                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                                                        color: const Color(0xFF57636C),
                                                                                                                        fontSize: 12.0,
                                                                                                                        fontWeight: FontWeight.w500,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            wrapWithModel(
                                                                                                              model: _model.ratingbarModels1.getModel(
                                                                                                                '${getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.transcription_id''',
                                                                                                                ).toString()}##\$\$${getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.rating''',
                                                                                                                ).toString()}',
                                                                                                                alltranscriptionsIndex,
                                                                                                              ),
                                                                                                              updateCallback: () => setState(() {}),
                                                                                                              child: RatingbarWidget(
                                                                                                                key: Key(
                                                                                                                  'Keyoji_${'${getJsonField(
                                                                                                                    alltranscriptionsItem,
                                                                                                                    r'''$.transcription_id''',
                                                                                                                  ).toString()}##\$\$${getJsonField(
                                                                                                                    alltranscriptionsItem,
                                                                                                                    r'''$.rating''',
                                                                                                                  ).toString()}'}',
                                                                                                                ),
                                                                                                                transcriptionid: getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.transcription_id''',
                                                                                                                ),
                                                                                                                counter: getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.rating''',
                                                                                                                ),
                                                                                                                userid: getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.user_id''',
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                        child: AlignedTooltip(
                                                                                                          content: Padding(
                                                                                                              padding: const EdgeInsets.all(4.0),
                                                                                                              child: Text(
                                                                                                                getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.title''',
                                                                                                                ).toString(),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                              )),
                                                                                                          offset: 4.0,
                                                                                                          preferredDirection: AxisDirection.down,
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          elevation: 4.0,
                                                                                                          tailBaseWidth: 24.0,
                                                                                                          tailLength: 12.0,
                                                                                                          waitDuration: const Duration(milliseconds: 100),
                                                                                                          showDuration: const Duration(milliseconds: 1000),
                                                                                                          triggerMode: TooltipTriggerMode.tap,
                                                                                                          child: Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              getJsonField(
                                                                                                                alltranscriptionsItem,
                                                                                                                r'''$.title''',
                                                                                                              ).toString(),
                                                                                                              maxLines: 1,
                                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                    fontFamily: 'Readex Pro',
                                                                                                                    fontSize: 12.0,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (responsiveVisibility(
                                                                                                        context: context,
                                                                                                        phone: false,
                                                                                                      ))
                                                                                                        Container(
                                                                                                          height: 40.0,
                                                                                                          decoration: const BoxDecoration(),
                                                                                                          child: ChoiceKeywordsWidget(
                                                                                                            key: Key('Key4nh_${alltranscriptionsIndex}_of_${alltranscriptions.length}'),
                                                                                                            id: getJsonField(
                                                                                                              alltranscriptionsItem,
                                                                                                              r'''$.transcription_id''',
                                                                                                            ),
                                                                                                            keywords: functions.convetStringToList(getJsonField(
                                                                                                              alltranscriptionsItem,
                                                                                                              r'''$.keywords''',
                                                                                                            ).toString()),
                                                                                                          ),
                                                                                                        ),
                                                                                                      Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 0.0),
                                                                                                            child: Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                functions.formatTimeStamp(getJsonField(
                                                                                                                  alltranscriptionsItem,
                                                                                                                  r'''$.created_at''',
                                                                                                                ).toString()),
                                                                                                                '00',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: 'Plus Jakarta Sans',
                                                                                                                    color: const Color(0xFF57636C),
                                                                                                                    fontSize: 12.0,
                                                                                                                    fontWeight: FontWeight.w500,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    controller: _model.gridViewAll1,
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.03,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          alignment: const AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                25.0,
                                                                                0.0),
                                                                            child:
                                                                                SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              controller: _model.rowController,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                children: [
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                  ))
                                                                                    Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                                                                      child: Text(
                                                                                        FFLocalizations.of(context).getText(
                                                                                          's987gbxb' /* Filas por pagina: */,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              fontSize: 10.0,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  Align(
                                                                                    alignment: const AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.dropDownValueController ??= FormFieldController<String>(
                                                                                          _model.dropDownValue ??= _model.sizetranscripciones.toString(),
                                                                                        ),
                                                                                        options: [
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'as4gz8e0' /* 10 */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'm44mrcgf' /* 40 */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'dsced62g' /* 50 */,
                                                                                          ),
                                                                                          FFLocalizations.of(context).getText(
                                                                                            'ylfz619c' /* 100 */,
                                                                                          )
                                                                                        ],
                                                                                        onChanged: (val) async {
                                                                                          setState(() => _model.dropDownValue = val);
                                                                                          setState(() {
                                                                                            _model.sizetranscripciones = int.parse((_model.dropDownValue!));
                                                                                          });
                                                                                          setState(() => _model.apiRequestCompleter1 = null);
                                                                                          await _model.gridViewAll1?.animateTo(
                                                                                            _model.gridViewAll1!.position.maxScrollExtent,
                                                                                            duration: const Duration(milliseconds: 100),
                                                                                            curve: Curves.ease,
                                                                                          );
                                                                                        },
                                                                                        width: 80.0,
                                                                                        height: 38.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: 'Readex Pro',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 10.0,
                                                                                            ),
                                                                                        hintText: _model.sizetranscripciones.toString(),
                                                                                        icon: Icon(
                                                                                          Icons.arrow_drop_down,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: Colors.transparent,
                                                                                        borderWidth: 0.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: const EdgeInsetsDirectional.fromSTEB(18.0, 4.0, 18.0, 4.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(19.0, 0.0, 19.0, 0.0),
                                                                                    child: Text(
                                                                                      '${AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)?.page.toString()} de ${AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)?.pages.toString()}',
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: 'Readex Pro',
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 10.0,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (!functions.pagedecrement(AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)!.page, _model.page!)) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              setState(() {
                                                                                                _model.pagetranscripciones = 1;
                                                                                              });
                                                                                              setState(() => _model.apiRequestCompleter1 = null);
                                                                                              await _model.gridViewAll1?.animateTo(
                                                                                                0,
                                                                                                duration: const Duration(milliseconds: 100),
                                                                                                curve: Curves.ease,
                                                                                              );
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.skip_previous_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return const Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.skip_previous_rounded,
                                                                                            color: Color(0xFF5E5E60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (!functions.pagedecrement(AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)!.page, _model.page!)) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              setState(() {
                                                                                                _model.pagetranscripciones = _model.pagetranscripciones + -1;
                                                                                              });
                                                                                              setState(() => _model.apiRequestCompleter1 = null);
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.chevron_left,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return const Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.chevron_left,
                                                                                            color: Color(0xFF5E5E60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                  if (responsiveVisibility(
                                                                                    context: context,
                                                                                    phone: false,
                                                                                    tablet: false,
                                                                                    tabletLandscape: false,
                                                                                    desktop: false,
                                                                                  ))
                                                                                    Icon(
                                                                                      Icons.clear_sharp,
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      size: 25.0,
                                                                                    ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (!functions.paginateCount(AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)!.pages, _model.pagetranscripciones)) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              setState(() {
                                                                                                _model.pagetranscripciones = _model.pagetranscripciones + 1;
                                                                                              });
                                                                                              setState(() => _model.apiRequestCompleter1 = null);
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.navigate_next,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return const Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.navigate_next,
                                                                                            color: Color(0xFF5E5E60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                  Builder(
                                                                                    builder: (context) {
                                                                                      if (!functions.paginateCount(AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)!.pages, _model.pagetranscripciones)) {
                                                                                        return Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              setState(() {
                                                                                                _model.pagetranscripciones = AllTranscriptionsPaginatedStruct.maybeFromMap(allTranscriptionGridGetAllTranscriptionsResponse.jsonBody)!.pages;
                                                                                              });
                                                                                              setState(() => _model.apiRequestCompleter1 = null);
                                                                                              await _model.gridViewAll1?.animateTo(
                                                                                                0,
                                                                                                duration: const Duration(milliseconds: 100),
                                                                                                curve: Curves.ease,
                                                                                              );
                                                                                            },
                                                                                            child: Icon(
                                                                                              Icons.skip_next_sharp,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      } else {
                                                                                        return const Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 8.0, 0.0),
                                                                                          child: Icon(
                                                                                            Icons.skip_next_sharp,
                                                                                            color: Color(0xFF5E5E60),
                                                                                            size: 24.0,
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child:
                                                                          Align(
                                                                        alignment: const AlignmentDirectional(
                                                                            0.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              10.0,
                                                                              8.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final searchtranscriptions = TranscriptionAPIGroup.searchCall
                                                                                      .results(
                                                                                        (_model.resultadosApiBusquedas?.jsonBody ?? ''),
                                                                                      )
                                                                                      ?.toList() ??
                                                                                  [];
                                                                              return MasonryGridView.builder(
                                                                                gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                                                                  crossAxisCount: () {
                                                                                    if (MediaQuery.sizeOf(context).width < kBreakpointSmall) {
                                                                                      return 2;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointMedium) {
                                                                                      return 4;
                                                                                    } else if (MediaQuery.sizeOf(context).width < kBreakpointLarge) {
                                                                                      return 6;
                                                                                    } else {
                                                                                      return 6;
                                                                                    }
                                                                                  }(),
                                                                                ),
                                                                                crossAxisSpacing: 2.0,
                                                                                mainAxisSpacing: 2.0,
                                                                                itemCount: searchtranscriptions.length,
                                                                                shrinkWrap: true,
                                                                                itemBuilder: (context, searchtranscriptionsIndex) {
                                                                                  final searchtranscriptionsItem = searchtranscriptions[searchtranscriptionsIndex];
                                                                                  return Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Wrap(
                                                                                      spacing: 8.0,
                                                                                      runSpacing: 4.0,
                                                                                      alignment: WrapAlignment.start,
                                                                                      crossAxisAlignment: WrapCrossAlignment.start,
                                                                                      direction: Axis.horizontal,
                                                                                      runAlignment: WrapAlignment.start,
                                                                                      verticalDirection: VerticalDirection.down,
                                                                                      clipBehavior: Clip.none,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 12.0),
                                                                                          child: Container(
                                                                                            width: MediaQuery.sizeOf(context).width * 0.45,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).mimi,
                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: const EdgeInsetsDirectional.fromSTEB(4.0, 4.0, 4.0, 12.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Stack(
                                                                                                    alignment: const AlignmentDirectional(1.0, 1.0),
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsets.all(8.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                          child: Image.network(
                                                                                                            getJsonField(
                                                                                                              searchtranscriptionsItem,
                                                                                                              r'''$.media_thumbnail_path''',
                                                                                                            ).toString(),
                                                                                                            width: double.infinity,
                                                                                                            height: 120.0,
                                                                                                            fit: BoxFit.fill,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 12.0),
                                                                                                        child: FlutterFlowIconButton(
                                                                                                          borderColor: FlutterFlowTheme.of(context).error,
                                                                                                          borderRadius: 20.0,
                                                                                                          borderWidth: 1.0,
                                                                                                          buttonSize: 30.0,
                                                                                                          fillColor: FlutterFlowTheme.of(context).error,
                                                                                                          icon: Icon(
                                                                                                            Icons.play_arrow,
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            size: 15.0,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            context.pushNamed(
                                                                                                              'details',
                                                                                                              queryParameters: {
                                                                                                                'id': serializeParam(
                                                                                                                  getJsonField(
                                                                                                                    searchtranscriptionsItem,
                                                                                                                    r'''$.id''',
                                                                                                                  ),
                                                                                                                  ParamType.int,
                                                                                                                ),
                                                                                                                'title': serializeParam(
                                                                                                                  getJsonField(
                                                                                                                    searchtranscriptionsItem,
                                                                                                                    r'''$.title''',
                                                                                                                  ).toString(),
                                                                                                                  ParamType.String,
                                                                                                                ),
                                                                                                              }.withoutNulls,
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 4.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        const Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                          child: Icon(
                                                                                                            Icons.video_collection_sharp,
                                                                                                            color: Color(0xFF57636C),
                                                                                                            size: 24.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              functions.duration(getJsonField(
                                                                                                                searchtranscriptionsItem,
                                                                                                                r'''$.duration''',
                                                                                                              ).toString()),
                                                                                                              '00:00',
                                                                                                            ),
                                                                                                            maxLines: 2,
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                  fontFamily: 'Plus Jakarta Sans',
                                                                                                                  color: const Color(0xFF57636C),
                                                                                                                  fontSize: 12.0,
                                                                                                                  fontWeight: FontWeight.w500,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                    child: AlignedTooltip(
                                                                                                      content: Padding(
                                                                                                          padding: const EdgeInsets.all(4.0),
                                                                                                          child: Text(
                                                                                                            getJsonField(
                                                                                                              searchtranscriptionsItem,
                                                                                                              r'''$.title''',
                                                                                                            ).toString(),
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall,
                                                                                                          )),
                                                                                                      offset: 4.0,
                                                                                                      preferredDirection: AxisDirection.down,
                                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                                      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      elevation: 4.0,
                                                                                                      tailBaseWidth: 24.0,
                                                                                                      tailLength: 12.0,
                                                                                                      waitDuration: const Duration(milliseconds: 100),
                                                                                                      showDuration: const Duration(milliseconds: 1000),
                                                                                                      triggerMode: TooltipTriggerMode.tap,
                                                                                                      child: Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          getJsonField(
                                                                                                            searchtranscriptionsItem,
                                                                                                            r'''$.title''',
                                                                                                          ).toString(),
                                                                                                          maxLines: 1,
                                                                                                          style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                                fontFamily: 'Readex Pro',
                                                                                                                fontSize: 12.0,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  if (responsiveVisibility(
                                                                                                    context: context,
                                                                                                    phone: false,
                                                                                                  ))
                                                                                                    Container(
                                                                                                      height: 40.0,
                                                                                                      decoration: const BoxDecoration(),
                                                                                                      child: ChoiceKeywordsWidget(
                                                                                                        key: Key('Keyzg3_${searchtranscriptionsIndex}_of_${searchtranscriptions.length}'),
                                                                                                        id: getJsonField(
                                                                                                          searchtranscriptionsItem,
                                                                                                          r'''$.transcription_id''',
                                                                                                        ),
                                                                                                        keywords: functions.convetStringToList(getJsonField(
                                                                                                          searchtranscriptionsItem,
                                                                                                          r'''$.keywords''',
                                                                                                        ).toString()),
                                                                                                      ),
                                                                                                    ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: const EdgeInsetsDirectional.fromSTEB(8.0, 4.0, 0.0, 0.0),
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            functions.formatTimeStamp(getJsonField(
                                                                                                              searchtranscriptionsItem,
                                                                                                              r'''$.created_at''',
                                                                                                            ).toString()),
                                                                                                            '00',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                fontFamily: 'Plus Jakarta Sans',
                                                                                                                color: const Color(0xFF57636C),
                                                                                                                fontSize: 12.0,
                                                                                                                fontWeight: FontWeight.w500,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                                controller: _model.gridViewAll2,
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                      KeepAliveWidgetWrapper(
                                                        builder: (context) =>
                                                            Builder(
                                                          builder: (context) {
                                                            if (!_model
                                                                .busquedas) {
                                                              return FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: (_model.apiRequestCompleter2 ??= Completer<
                                                                        ApiCallResponse>()
                                                                      ..complete(TranscriptionAPIGroup
                                                                          .tableTranscriprionsCall
                                                                          .call(
                                                                        token:
                                                                            currentAuthenticationToken,
                                                                      )))
                                                                    .future,
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final datatablesAllTableTranscriprionsResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    decoration:
                                                                        const BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          6.0,
                                                                          12.0,
                                                                          6.0,
                                                                          0.0),
                                                                      child:
                                                                          Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final tablatranscripciones =
                                                                              (datatablesAllTableTranscriprionsResponse.jsonBody.toList().map<TranscriptionTableStruct?>(TranscriptionTableStruct.maybeFromMap).toList() as Iterable<TranscriptionTableStruct?>).withoutNulls.toList() ?? [];
                                                                          return FlutterFlowDataTable<
                                                                              TranscriptionTableStruct>(
                                                                            controller:
                                                                                _model.paginatedDataTableController1,
                                                                            data:
                                                                                tablatranscripciones,
                                                                            columnsBuilder: (onSortChanged) =>
                                                                                [
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'b0o7thrc' /* Imagen */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                fixedWidth: 100.0,
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'k54tynzr' /* Título */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '3cbzz5i4' /* Duración */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'com15ekj' /* Creación */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: 'Readex Pro',
                                                                                          fontSize: 13.0,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'fkgz6ozu' /* Autor */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      'eiwnidn3' /* Valoración */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              DataColumn2(
                                                                                label: DefaultTextStyle.merge(
                                                                                  softWrap: true,
                                                                                  child: Text(
                                                                                    FFLocalizations.of(context).getText(
                                                                                      '5w67oup2' /* Opciónes */,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).labelLarge,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                            dataRowBuilder: (tablatranscripcionesItem, tablatranscripcionesIndex, selected, onSelectChanged) =>
                                                                                DataRow(
                                                                              color: MaterialStateProperty.all(
                                                                                tablatranscripcionesIndex % 2 == 0 ? FlutterFlowTheme.of(context).secondaryBackground : FlutterFlowTheme.of(context).primaryBackground,
                                                                              ),
                                                                              cells: [
                                                                                Padding(
                                                                                  padding: const EdgeInsets.all(4.0),
                                                                                  child: ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                    child: Image.network(
                                                                                      tablatranscripcionesItem.mediaThumbnailPath,
                                                                                      width: 100.0,
                                                                                      height: 350.0,
                                                                                      fit: BoxFit.fill,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Text(
                                                                                  tablatranscripcionesItem.title,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                Text(
                                                                                  valueOrDefault<String>(
                                                                                    functions.duration(tablatranscripcionesItem.duration.toString()),
                                                                                    '00:00',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Readex Pro',
                                                                                        fontSize: 12.0,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  functions.formatDateDays(tablatranscripcionesItem.createdAt),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                Text(
                                                                                  functions.formatName(tablatranscripcionesItem.userName),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium,
                                                                                ),
                                                                                wrapWithModel(
                                                                                  model: _model.ratingbarModels2.getModel(
                                                                                    '${tablatranscripcionesItem.rating.toString()}#${tablatranscripcionesItem.transcriptionId.toString()}',
                                                                                    tablatranscripcionesIndex,
                                                                                  ),
                                                                                  updateCallback: () => setState(() {}),
                                                                                  child: RatingbarWidget(
                                                                                    key: Key(
                                                                                      'Keyfvc_${'${tablatranscripcionesItem.rating.toString()}#${tablatranscripcionesItem.transcriptionId.toString()}'}',
                                                                                    ),
                                                                                    transcriptionid: tablatranscripcionesItem.transcriptionId,
                                                                                    counter: tablatranscripcionesItem.rating,
                                                                                    userid: tablatranscripcionesItem.userId,
                                                                                  ),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.lock_open_outlined,
                                                                                      color: FlutterFlowTheme.of(context).warning,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          'details',
                                                                                          queryParameters: {
                                                                                            'id': serializeParam(
                                                                                              tablatranscripcionesItem.transcriptionId,
                                                                                              ParamType.int,
                                                                                            ),
                                                                                            'title': serializeParam(
                                                                                              tablatranscripcionesItem.title,
                                                                                              ParamType.String,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                        );
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.play_circle,
                                                                                        color: FlutterFlowTheme.of(context).error,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        await launchURL(tablatranscripcionesItem.transcriptionDocPath);
                                                                                      },
                                                                                      child: Icon(
                                                                                        Icons.download_sharp,
                                                                                        color: FlutterFlowTheme.of(context).tertiary,
                                                                                        size: 30.0,
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(const SizedBox(width: 9.0)).addToStart(const SizedBox(width: 9.0)).addToEnd(const SizedBox(width: 9.0)),
                                                                                ),
                                                                              ].map((c) => DataCell(c)).toList(),
                                                                            ),
                                                                            paginated:
                                                                                true,
                                                                            selectable:
                                                                                false,
                                                                            hidePaginator:
                                                                                false,
                                                                            showFirstLastButtons:
                                                                                true,
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 1.0,
                                                                            minWidth:
                                                                                800.0,
                                                                            headingRowHeight:
                                                                                56.0,
                                                                            dataRowHeight:
                                                                                65.0,
                                                                            columnSpacing:
                                                                                2.0,
                                                                            headingRowColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            addHorizontalDivider:
                                                                                true,
                                                                            addTopAndBottomDivider:
                                                                                false,
                                                                            hideDefaultHorizontalDivider:
                                                                                false,
                                                                            horizontalDividerColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            horizontalDividerThickness:
                                                                                1.0,
                                                                            addVerticalDivider:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            } else {
                                                              return Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          6.0,
                                                                          12.0,
                                                                          6.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final resultadosTable = TranscriptionAPIGroup
                                                                              .searchCall
                                                                              .results(
                                                                                (_model.resultadosApiBusquedas?.jsonBody ?? ''),
                                                                              )
                                                                              ?.toList() ??
                                                                          [];
                                                                      if (resultadosTable
                                                                          .isEmpty) {
                                                                        return Center(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/MMBlack.png',
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.scaleDown,
                                                                          ),
                                                                        );
                                                                      }
                                                                      return FlutterFlowDataTable<
                                                                          dynamic>(
                                                                        controller:
                                                                            _model.paginatedDataTableController2,
                                                                        data:
                                                                            resultadosTable,
                                                                        columnsBuilder:
                                                                            (onSortChanged) =>
                                                                                [
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'gsj4ehtl' /* Imagen */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            fixedWidth:
                                                                                100.0,
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'g316lqn2' /* Título */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  '4vn8edqx' /* Duración */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'q19y36wm' /* Creación */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Readex Pro',
                                                                                      fontSize: 13.0,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          DataColumn2(
                                                                            label:
                                                                                DefaultTextStyle.merge(
                                                                              softWrap: true,
                                                                              child: Text(
                                                                                FFLocalizations.of(context).getText(
                                                                                  'dc0ln6kk' /* Opciónes */,
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).labelLarge,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                        dataRowBuilder: (resultadosTableItem,
                                                                                resultadosTableIndex,
                                                                                selected,
                                                                                onSelectChanged) =>
                                                                            DataRow(
                                                                          color:
                                                                              MaterialStateProperty.all(
                                                                            resultadosTableIndex % 2 == 0
                                                                                ? FlutterFlowTheme.of(context).secondaryBackground
                                                                                : FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          cells:
                                                                              [
                                                                            Padding(
                                                                              padding: const EdgeInsets.all(4.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                child: Image.network(
                                                                                  getJsonField(
                                                                                    resultadosTableItem,
                                                                                    r'''$.media_thumbnail_path''',
                                                                                  ).toString(),
                                                                                  width: 100.0,
                                                                                  height: 350.0,
                                                                                  fit: BoxFit.fill,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                resultadosTableItem,
                                                                                r'''$.title''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                functions.duration(getJsonField(
                                                                                  resultadosTableItem,
                                                                                  r'''$.title''',
                                                                                ).toString()),
                                                                                '00:00',
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: 'Readex Pro',
                                                                                    fontSize: 12.0,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              functions.formatDateDays(getJsonField(
                                                                                resultadosTableItem,
                                                                                r'''$.created_at''',
                                                                              ).toString()),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium,
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.lock_open_outlined,
                                                                                  color: FlutterFlowTheme.of(context).warning,
                                                                                  size: 30.0,
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'details',
                                                                                      queryParameters: {
                                                                                        'id': serializeParam(
                                                                                          getJsonField(
                                                                                            resultadosTableItem,
                                                                                            r'''$.transcription_id''',
                                                                                          ),
                                                                                          ParamType.int,
                                                                                        ),
                                                                                        'title': serializeParam(
                                                                                          getJsonField(
                                                                                            resultadosTableItem,
                                                                                            r'''$.title''',
                                                                                          ).toString(),
                                                                                          ParamType.String,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.play_circle,
                                                                                    color: FlutterFlowTheme.of(context).error,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                ),
                                                                                InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    await launchURL(getJsonField(
                                                                                      resultadosTableItem,
                                                                                      r'''$.transcription_doc_path''',
                                                                                    ).toString());
                                                                                  },
                                                                                  child: Icon(
                                                                                    Icons.download_sharp,
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    size: 30.0,
                                                                                  ),
                                                                                ),
                                                                              ].divide(const SizedBox(width: 9.0)).addToStart(const SizedBox(width: 9.0)).addToEnd(const SizedBox(width: 9.0)),
                                                                            ),
                                                                          ].map((c) => DataCell(c)).toList(),
                                                                        ),
                                                                        emptyBuilder:
                                                                            () =>
                                                                                Center(
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/images/MMBlack.png',
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                200.0,
                                                                            fit:
                                                                                BoxFit.scaleDown,
                                                                          ),
                                                                        ),
                                                                        paginated:
                                                                            true,
                                                                        selectable:
                                                                            false,
                                                                        hidePaginator:
                                                                            false,
                                                                        showFirstLastButtons:
                                                                            true,
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            1.0,
                                                                        minWidth:
                                                                            800.0,
                                                                        headingRowHeight:
                                                                            56.0,
                                                                        dataRowHeight:
                                                                            65.0,
                                                                        columnSpacing:
                                                                            2.0,
                                                                        headingRowColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        addHorizontalDivider:
                                                                            true,
                                                                        addTopAndBottomDivider:
                                                                            false,
                                                                        hideDefaultHorizontalDivider:
                                                                            false,
                                                                        horizontalDividerColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        horizontalDividerThickness:
                                                                            1.0,
                                                                        addVerticalDivider:
                                                                            false,
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (responsiveVisibility(
                                            context: context,
                                            phone: false,
                                          ))
                                            Container(
                                              width: double.infinity,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.03,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          const AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final tenant =
                                                                (currentUserData
                                                                            ?.tenant ??
                                                                        [])
                                                                    .toList();
                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  tenant.length,
                                                              itemBuilder: (context,
                                                                  tenantIndex) {
                                                                final tenantItem =
                                                                    tenant[
                                                                        tenantIndex];
                                                                return Padding(
                                                                  padding: const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Text(
                                                                    getJsonField(
                                                                      tenantItem
                                                                          .toMap(),
                                                                      r'''$.name''',
                                                                    ).toString(),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium,
                                                                  ),
                                                                );
                                                              },
                                                              controller: _model
                                                                  .listViewController,
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(9.0, 0.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      functions.formatName(
                                                          currentUserData!
                                                              .userName),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
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
                                                                fontSize: 14.0,
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
      ),
    );
  }
}
