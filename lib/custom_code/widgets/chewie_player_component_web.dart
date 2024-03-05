// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart'; // Imports custom actions

import '../../components/create_mark_widget.dart';

import '../../flutter_flow/flutter_flow_icon_button.dart';

import '../../components/emptylist_widget.dart';

import '/custom_code/actions/index.dart'; // Imports custom Dura

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../flutter_flow/flutter_flow_button_tabbar.dart';

import '../../components/download_files_widget.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

import 'dart:async';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../backend/api_requests/api_calls.dart';
import '../../flutter_flow/flutter_flow_choice_chips.dart';
import '../../flutter_flow/flutter_flow_toggle_icon.dart';
import '../../flutter_flow/form_field_controller.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/flutter_flow/custom_functions.dart' as functions;
import '../../components/player_busquedas_model.dart';
export '../../components/player_busquedas_model.dart';

import 'package:chewie/chewie.dart';
import 'package:chewie_audio/chewie_audio.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ChewiePlayerComponentWeb extends StatefulWidget {
  const ChewiePlayerComponentWeb({
    super.key,
    this.width,
    this.height,
    required this.id,
    required this.idBackup,
    required this.subtitlesjson,
    required this.subtitles,
    required this.autor,
    required this.autoplay,
    required this.looping,
    required this.allowfullscreen,
    required this.autoinitialize,
    required this.videoOk,
    required this.imageLight,
    required this.imageDark,
    required this.fontsize,
  });

  final double? width;
  final double? height;
  final String id;
  final int idBackup;
  final List<dynamic> subtitlesjson;
  final String subtitles;
  final String autor;
  final bool autoplay;
  final bool looping;
  final bool allowfullscreen;
  final bool autoinitialize;
  final String videoOk;
  final String imageLight;
  final String imageDark;
  final double fontsize;

  @override
  State<ChewiePlayerComponentWeb> createState() =>
      _ChewiePlayerComponentWebState();
}

class _ChewiePlayerComponentWebState extends State<ChewiePlayerComponentWeb> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  late ChewieAudioController _chewieAudioController;
  late PlayerBusquedasModel _model;
  late ScrollController _scrollController;
  final double itemHeight = 65.0; // Definir la altura de tus elementos aquí
  double _heightOfYourContainer = 0.8;
  // double scrollSpeed = 200.0; // Píxeles por segundo
  late RegExp regExp;
  String currentSubtitle = "";
  late AutoScrollController autoScrollController;
  int _currentSubtitleIndex = 0;
  double videoVolume = 1.0;
  List<GlobalKey> itemKeys = []; //NUEVO
  List<double> itemHeights = []; // NUEVO
  bool isVol = true;
  bool isFinished = false;
  double lastNonMutedVolume = 1.0;
  ScrollController _scrollControllerText = ScrollController();
  bool initialized = false;
  GlobalKey<ChewieState> chewieKey = GlobalKey<ChewieState>();

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PlayerBusquedasModel());
    _scrollController = ScrollController();
    autoScrollController = AutoScrollController();

    _videoController = VideoPlayerController.network(widget.videoOk)
      ..initialize().then((_) {
        setState(() {});
      });

    itemKeys =
        List.generate(widget.subtitlesjson.length, (index) => GlobalKey());

    /// NUEVO
    _model.tabBarController = TabController(
      vsync: this,
      length: 7,
      initialIndex: 0,
    )..addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _calculateItemHeights()); //NUEVO
    bool isVideo = widget.videoOk.toLowerCase().endsWith('.mp4');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _heightOfYourContainer = 0.8 * MediaQuery.of(context).size.height;
    });

    _videoController.addListener(() {
      if (!_videoController.value.isPlaying &&
          _videoController.value.position == _videoController.value.duration) {
        // El video ha finalizado
        setState(() {
          // Cambia el icono y la funcionalidad del botón según tus necesidades
          isFinished = true;
        });
      }
    });

    // if (isVideo) {
    _chewieController = ChewieController(
      videoPlayerController: _videoController,
      autoPlay: true,
      looping: false,
      aspectRatio: 1.70,
      //isPlaying: playerState.value.isPlaying,
      // Sincroniza posición

      // Controladores personalizados para permitir la reproducción/pausa, etc.
      customControls: MaterialControls(),
      showControls: true,

      //materialProgressColors: ChewieProgressColors(isVideo),
      // materialProgressColors: VideoProgressColors(
      //   playedColor: Colors.red,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      placeholder: Container(
        //color: Colors.black,
        decoration: BoxDecoration(
          // Aquí puedes añadir más propiedades como borderRadius si quieres
          image: DecorationImage(
            fit: BoxFit
                .fill, // Esto asegura que la imagen cubra todo el container
            image: NetworkImage(widget.imageLight), // URL de la imagen
          ),
        ),
      ),
      allowFullScreen: false,
      autoInitialize: true,
      // errorBuilder: (context, errorMessage) {
      //   if (errorMessage == null) {
      //     return Center(
      //       child: Text(
      //         'Error desconocido', // Mensaje para el caso de null
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //     );
      //   } else {
      //     return Center(
      //       child: Text(
      //         errorMessage,
      //         style: const TextStyle(color: Colors.white),
      //       ),
      //     );
      //   }
      // }
    );

    // errorBuilder: (context, errorMessage) {
    //   return Center(
    //     child: Text(
    //       errorMessage,
    //       style: const TextStyle(color: Colors.white),
    //     ),
    //   );
    // });
    // } else {
    //   _chewieController = ChewieController(
    //       videoPlayerController: _videoController,
    //       autoPlay: true,
    //       looping: false,
    //       aspectRatio: 16 / 9,
    //       //isPlaying: playerState.value.isPlaying,
    //       // Sincroniza posición

    //       // Controladores personalizados para permitir la reproducción/pausa, etc.
    //       // customControls: MaterialControls(),
    //       showControls: true,
    //       //materialProgressColors: ChewieProgressColors(isVideo),
    //       // materialProgressColors: VideoProgressColors(
    //       //   playedColor: Colors.red,
    //       //   backgroundColor: Colors.grey,
    //       //   bufferedColor: Colors.lightGreen,
    //       // ),
    //       placeholder: Container(
    //         color: Colors.black,
    //       ),
    //       allowFullScreen: false,
    //       autoInitialize: true,
    //       errorBuilder: (context, errorMessage) {
    //         return Center(
    //           child: Text(
    //             errorMessage,
    //             style: const TextStyle(color: Colors.white),
    //           ),
    //         );
    //       });
    //   // _chewieAudioController = ChewieAudioController(
    //   //   videoPlayerController: _videoController,
    //   //   autoPlay: true,
    //   //   looping: false,
    //   //   showControls: true,
    //   //   autoInitialize: true,
    //   //   errorBuilder: (context, errorMessage) {
    //   //     return Center(
    //   //       child: Text(
    //   //         errorMessage,
    //   //         style: const TextStyle(color: Colors.white),
    //   //       ),
    //   //     );
    //   //   },
    //   //   //customControls: MaterialControls(),
    //   // );
    // }

    _videoController.addListener(() {
      _updateSubtitle();

      setState(
          () {}); // Esto obligará al widget a reconstruirse y actualizar los tiempos mostrados.
    });
    // _videoController.addListener(_updateSubtitle);
    _scrollController.addListener(_handleScroll); // Añade esto
    widget.subtitlesjson.sort((a, b) =>
        _timeStampToSeconds(a['start_time'] as String)
            .compareTo(_timeStampToSeconds(b['start_time'] as String)));
  }

//// NUEVO
  void _calculateItemHeights() {
    setState(() {
      itemHeights = itemKeys.map((key) {
        final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
        return renderBox?.size.height ?? 0.0;
      }).toList();
    });
  }

  //END NUEVO

  void _updateSubtitle() {
    final position = _videoController.value.position;

    for (int i = 0; i < widget.subtitles.length; i++) {
      final startTime =
          _parseDuration(widget.subtitlesjson[i]['start_time'] as String);
      final endTime =
          _parseDuration(widget.subtitlesjson[i]['end_time'] as String);
      if (position >= startTime && position <= endTime) {
        if (i != _currentSubtitleIndex) {
          setState(() {
            _currentSubtitleIndex = i;
          });
          _scrollToCurrentSubtitle(); // Llama a esta función en lugar de a _scrollController.animateTo()
        }
        break;
      }
    }
  }

  void _handleScroll() {
    if (!_scrollController.position.isScrollingNotifier.value) {
      Future.delayed(Duration(seconds: 2), () {
        if (!_scrollController.position.isScrollingNotifier.value) {
          _scrollToCurrentSubtitle();
        }
      });
    }
  }

  Future _scrollToCurrentSubtitle() async {
    await autoScrollController.scrollToIndex(_currentSubtitleIndex,
        preferPosition: AutoScrollPosition.middle);
  }

  int _timeStampToSeconds(String timeStamp) {
    List<String> parts = timeStamp.split(':');
    int hours = int.parse(parts[0]);
    int minutes = int.parse(parts[1]);
    int seconds = int.parse(parts[2].split(',')[0]);
    int milliseconds = int.parse(parts[2].split(',')[1]);
    return (hours * 3600) + (minutes * 60) + seconds + (milliseconds ~/ 1000);
  }

  Duration _parseDuration(String durationString) {
    final parts = durationString.split(':');
    final hours = int.parse(parts[0]);
    final minutes = int.parse(parts[1]);
    final seconds = double.parse(parts[2].replaceAll(',', '.'));
    return Duration(
      hours: hours,
      minutes: minutes,
      seconds: seconds.toInt(),
    );
  }

  String _formatDuration(Duration duration) {
    final int minute = duration.inMinutes;
    final int second = duration.inSeconds - minute * 60;
    return '${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }

  String _formatDurationTime(String durationString) {
    try {
      final parts = durationString.split(':');
      if (parts.length != 3) {
        throw FormatException("Invalid time format");
      }

      final hours = int.tryParse(parts[0]) ?? 0;
      final minutes = int.tryParse(parts[1]) ?? 0;
      final seconds = int.tryParse(parts[2].split(',')[0]) ?? 0;

      if (hours > 0) {
        return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      } else {
        return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
      }
    } catch (e) {
      print('Format Exception: $e');
      return "Invalid Time";
    }
  }

  void _scrollListener() {
    double maxScroll = _scrollControllerText.position.maxScrollExtent;
    double currentScroll = _scrollControllerText.position.pixels;
    double delta = 164.0; // o el valor que consideres apropiado

    if (maxScroll - currentScroll <= delta) {
      // Si estás cerca del final de la lista
      _scrollControllerText.animateTo(
        _scrollControllerText.position.maxScrollExtent,
        duration: Duration(seconds: 1),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _videoController.pause(); // Make sure to pause the video
    _chewieController.dispose();
    _videoController.dispose();
    _chewieAudioController.dispose();
    _model.maybeDispose();
    _scrollController.removeListener(_handleScroll); // Añade esto
    _scrollControllerText.removeListener(_scrollListener);
    autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: TranscriptionAPIGroup.gettranscriptionsbyidCall.call(
        id: widget.idBackup,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        final columnGettranscriptionsbyidResponse = snapshot.data!;
        bool isVideo = widget.videoOk.toLowerCase().endsWith('.mp4');
        //print(' Url del video ${widget.autor}');

        return Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                width: double.infinity,
                height: 30,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.videocam_sharp,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 20,
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                        child: Text(
                          widget.videoOk,
                          // TranscriptionAPIGroup.gettranscriptionsbyidCall
                          //     .title(
                          //       columnGettranscriptionsbyidResponse.jsonBody,
                          //     )
                          //     .toString(),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    fontSize: 12,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            if (responsiveVisibility(
                context: context,
                tabletLandscape: true,
                tablet: true,
                desktop: true,
                phone: false))
              Container(
                height: (FFAppState().elementosListaResumen.isEmpty &&
                        FFAppState().elementosHeadlines.isEmpty)
                    ? MediaQuery.of(context).size.height * 0.55
                    : (FFAppState().elementosListaResumen.isEmpty ||
                            FFAppState().elementosHeadlines.isEmpty)
                        ? MediaQuery.of(context).size.height * 0.45
                        : MediaQuery.of(context).size.height * 0.35,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: isVideo ? _buildVideoPlayer() : _buildVideoPlayer()),
                //child: Container()),
              ),
            if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                tablet: false,
                desktop: false,
                phone: true))
              Container(
                height: MediaQuery.of(context).size.height * 0.28,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: isVideo ? _buildVideoPlayer() : _buildVideoPlayer(),
                ),
              ),
            // Container(
            //   decoration: BoxDecoration(color: Colors.red),
            //   child: Align(
            //       alignment: Alignment.topCenter,
            //       child: Container(
            //           width: MediaQuery.of(context).size.width,
            //           height: FFAppState().elementosListaResumen.length == 0 &&
            //                   FFAppState().elementosHeadlines.length == 0
            //               ? MediaQuery.of(context).size.height * 0.40
            //               : MediaQuery.of(context).size.height * 0.28,
            //           child: VisibilityDetector(
            //               key: Key("unique key"),
            //               onVisibilityChanged: (VisibilityInfo info) {
            //                 debugPrint(
            //                     "${info.visibleFraction} of my widget is visible");
            //                 if (info.visibleFraction == 0) {
            //                   _videoController.pause();
            //                 } else {
            //                   _videoController.play();
            //                 }
            //               },
            //               child: isVideo
            //                   ? _buildVideoPlayer()
            //                   : _buildAudioPlayer()))),
            // ),
            if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                tablet: false,
                desktop: false,
                phone: false))
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(-1.00, 0.00),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(3, 3, 3, 3),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.tabBarController!.animateTo(
                                    0,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A158C),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '1326w9sv' /* Transcripciòn */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFFF0F0F3),
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.tabBarController!.animateTo(
                                    1,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A158C),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'ok03qulj' /* Resumen */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFFF0F0F3),
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.tabBarController!.animateTo(
                                    2,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A158C),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      '5thvxxcb' /* Etiquetas */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFFF0F0F3),
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                setState(() {
                                  _model.tabBarController!.animateTo(
                                    3,
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A158C),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 5, 5, 5),
                                  child: Text(
                                    FFLocalizations.of(context).getText(
                                      'phnemvz8' /* Informaciòn */,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: Color(0xFFF0F0F3),
                                          fontSize: 12,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            // Column(
                            //   mainAxisSize: MainAxisSize.max,
                            //   children: [
                            //     Row(
                            //       mainAxisSize: MainAxisSize.max,
                            //       children: [
                            //         FlutterFlowIconButton(
                            //           borderColor: FlutterFlowTheme.of(context)
                            //               .alternate,
                            //           borderRadius: 12,
                            //           borderWidth: 2,
                            //           buttonSize: 39,
                            //           fillColor:
                            //               FlutterFlowTheme.of(context).accent4,
                            //           icon: Icon(
                            //             _videoController.value.isPlaying
                            //                 ? Icons.pause
                            //                 : isFinished
                            //                     ? Icons.replay
                            //                     : Icons.play_arrow,
                            //             color: FlutterFlowTheme.of(context)
                            //                 .primaryText,
                            //             size: 19,
                            //           ),
                            //           onPressed: () {
                            //             /// check if video has ended
                            //             if (isFinished) {
                            //               /// restart the video by setting current position to 0
                            //               _videoController.initialize();
                            //               _videoController
                            //                   .seekTo(Duration.zero);

                            //               _videoController.play();
                            //             } else {
                            //               _videoController.value.isPlaying
                            //                   ? _videoController.pause()
                            //                   : _videoController.play();
                            //             }
                            //             // _videoController.value.isPlaying
                            //             //     ? _videoController.pause()
                            //             //     : _videoController
                            //             //             .value.position.isNegative
                            //             //         ? _videoController
                            //             //             .seekTo(Duration.zero)
                            //             //         : _videoController.play();
                            //           },
                            //         ),
                            //         MouseRegion(
                            //           opaque: false,
                            //           cursor: MouseCursor.defer ??
                            //               MouseCursor.defer,
                            //           child: FlutterFlowIconButton(
                            //             borderColor:
                            //                 FlutterFlowTheme.of(context)
                            //                     .alternate,
                            //             borderRadius: 12,
                            //             borderWidth: 2,
                            //             buttonSize: 39,
                            //             fillColor: FlutterFlowTheme.of(context)
                            //                 .accent4,
                            //             icon: Icon(
                            //               isVol
                            //                   ? Icons.volume_up
                            //                   : Icons.volume_mute,
                            //               color: isVol
                            //                   ? FlutterFlowTheme.of(context)
                            //                       .primaryText
                            //                   : FlutterFlowTheme.of(context)
                            //                       .accent1,
                            //               size: 19,
                            //             ),
                            //             onPressed: () async {
                            //               setState(() {
                            //                 isVol =
                            //                     !isVol; // Toggle the value of isVol
                            //                 if (isVol) {
                            //                   // If unmuting, set volume to the last non-muted volume
                            //                   _videoController.setVolume(
                            //                       lastNonMutedVolume);
                            //                 } else {
                            //                   // If muting, store the current volume in lastNonMutedVolume
                            //                   lastNonMutedVolume =
                            //                       _videoController.value.volume;
                            //                   _videoController.setVolume(0.0);
                            //                 }
                            //                 // isVol =
                            //                 //     !isVol; // Toggle the value of isVol
                            //                 // isVol
                            //                 //     ? _videoController
                            //                 //         .setVolume(1.0)
                            //                 //     : _videoController
                            //                 //         .setVolume(0.0);
                            //               });
                            //             },
                            //           ),
                            //           onEnter: ((event) async {
                            //             setState(() =>
                            //                 _model.mouseRegionHovered1 = true);
                            //             setState(() {
                            //               FFAppState().volControl = true;
                            //             });
                            //           }),
                            //           onExit: ((event) async {
                            //             setState(() =>
                            //                 _model.mouseRegionHovered1 = false);
                            //             setState(() {
                            //               FFAppState().volControl = false;
                            //             });
                            //           }),
                            //         ),
                            //       ],
                            //     ),
                            //     // Expanded(
                            //     //   child: VideoProgressIndicator(_videoController,
                            //     //       allowScrubbing: true),
                            //     // ),
                            //   ],
                            // ),
                            // MouseRegion(
                            //   opaque: false,
                            //   cursor: MouseCursor.defer ?? MouseCursor.defer,
                            //   child: Visibility(
                            //     visible: FFAppState().volControl,
                            //     child: Container(
                            //       width: 140.0,
                            //       height: 20.0,
                            //       child: SliderTheme(
                            //         data: SliderThemeData(
                            //           showValueIndicator:
                            //               ShowValueIndicator.always,
                            //         ),
                            //         child: Slider(
                            //           activeColor:
                            //               FlutterFlowTheme.of(context).error,
                            //           inactiveColor:
                            //               FlutterFlowTheme.of(context)
                            //                   .botonesPlayer,
                            //           value: isVol ? videoVolume : 0.0,
                            //           min: 0.0,
                            //           max: 1.0,
                            //           onChanged: (value) {
                            //             setState(() {
                            //               videoVolume = value;
                            //               _videoController
                            //                   .setVolume(videoVolume);
                            //             });
                            //           },
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   onEnter: ((event) async {
                            //     setState(
                            //         () => _model.mouseRegionHovered2 = true);
                            //     setState(() {
                            //       FFAppState().volControl = true;
                            //     });
                            //   }),
                            //   onExit: ((event) async {
                            //     setState(
                            //         () => _model.mouseRegionHovered2 = false);
                            //     setState(() {
                            //       FFAppState().volControl = false;
                            //     });
                            //   }),
                            // ),
                            // Expanded(
                            //   child: VideoProgressIndicator(_videoController,
                            //       allowScrubbing: true),
                            // ),
                            // ValueListenableBuilder(
                            //   valueListenable: _videoController,
                            //   builder:
                            //       (context, VideoPlayerValue value, child) {
                            //     return Text(
                            //       "${_formatDuration(_videoController.value.position)} / ${_formatDuration(_videoController.value.duration)}",
                            //     );
                            //   },
                            // ),
                          ].divide(SizedBox(width: 2)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Expanded(
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: FlutterFlowButtonTabBar(
                        useToggleButtonStyle: true,
                        labelStyle: FlutterFlowTheme.of(context).titleMedium,
                        unselectedLabelStyle: TextStyle(),
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                        backgroundColor: FlutterFlowTheme.of(context).accent1,
                        unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderColor: FlutterFlowTheme.of(context).mimi,
                        unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                        borderWidth: 2,
                        borderRadius: 8,
                        elevation: 0,
                        buttonMargin:
                            EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        padding: EdgeInsetsDirectional.fromSTEB(4, 4, 4, 4),
                        tabs: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.text_fields,
                                size: 20,
                              ),
                              Tab(
                                text: '',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person_4_sharp,
                                size: 20,
                              ),
                              Tab(
                                text: '',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.short_text_sharp,
                                size: 20,
                              ),
                              Tab(
                                text: '',
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.info_outline,
                                size: 20,
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'lxkrhgn8' /* */
                                  ,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.summarize_sharp,
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'kqe8r60k' /*  */,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.summarize_outlined,
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'y7xd8m7c' /*  */,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.heading,
                                size: 18,
                              ),
                              Tab(
                                text: FFLocalizations.of(context).getText(
                                  'rnital5l' /*  */,
                                ),
                              ),
                            ],
                          ),
                        ],
                        controller: _model.tabBarController,
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
                                      ),
                                    if (responsiveVisibility(
                                      context: context,
                                      phone: false,
                                      tablet: false,
                                      tabletLandscape: false,
                                      desktop: false,
                                    ))
                                      Icon(
                                        Icons.settings_outlined,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 24,
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
                                            isGlobal: true,
                                            avoidOverflow: false,
                                            targetAnchor: AlignmentDirectional(
                                                    0, 0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            followerAnchor:
                                                AlignmentDirectional(0, 0)
                                                    .resolve(Directionality.of(
                                                        context)),
                                            builder: (dialogContext) {
                                              return Material(
                                                color: Colors.transparent,
                                                child: Container(
                                                  height: 220,
                                                  width: 400,
                                                  child: DownloadFilesWidget(
                                                    srtFile: TranscriptionAPIGroup
                                                        .gettranscriptionsbyidCall
                                                        .transcriptionsrtpath(
                                                          columnGettranscriptionsbyidResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    docFile: TranscriptionAPIGroup
                                                        .gettranscriptionsbyidCall
                                                        .transcriptiondocpath(
                                                          columnGettranscriptionsbyidResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                    filename: TranscriptionAPIGroup
                                                        .gettranscriptionsbyidCall
                                                        .title(
                                                          columnGettranscriptionsbyidResponse
                                                              .jsonBody,
                                                        )
                                                        .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Icon(
                                          Icons.cloud_download,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24,
                                        ),
                                      ),
                                    ),

                                    // InkWell(
                                    //   splashColor: Colors.transparent,
                                    //   focusColor: Colors.transparent,
                                    //   hoverColor: Colors.transparent,
                                    //   highlightColor: Colors.transparent,
                                    //   onTap: () async {
                                    //     unawaited(
                                    //       () async {
                                    //         await launchURL(TranscriptionAPIGroup
                                    //             .gettranscriptionsbyidCall
                                    //             .transcriptiondocpath(
                                    //               columnGettranscriptionsbyidResponse
                                    //                   .jsonBody,
                                    //             )
                                    //             .toString());
                                    //       }(),
                                    //     );
                                    //   },
                                    //   child: Icon(
                                    //     Icons.cloud_download,
                                    //     color: FlutterFlowTheme.of(context)
                                    //         .secondaryText,
                                    //     size: 24,
                                    //   ),
                                    // ),
                                    // InkWell(
                                    //   splashColor: Colors.transparent,
                                    //   focusColor: Colors.transparent,
                                    //   hoverColor: Colors.transparent,
                                    //   highlightColor: Colors.transparent,
                                    //   onTap: () async {
                                    //     await launchURL(TranscriptionAPIGroup
                                    //         .gettranscriptionsbyidCall
                                    //         .transcriptiondocpath(
                                    //           columnGettranscriptionsbyidResponse
                                    //               .jsonBody,
                                    //         )
                                    //         .toString());
                                    //   },
                                    //   child: Icon(
                                    //     Icons.cloud_download,
                                    //     color: FlutterFlowTheme.of(context)
                                    //         .secondaryText,
                                    //     size: 24,
                                    //   ),
                                    // ),
                                    ToggleIcon(
                                      onPressed: () async {
                                        setState(() => FFAppState().showTime =
                                            !FFAppState().showTime);
                                      },
                                      value: FFAppState().showTime,
                                      onIcon: Icon(
                                        Icons.timer_off,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 25,
                                      ),
                                      offIcon: Icon(
                                        Icons.timer,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 20,
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 9)),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.49,
                                decoration: BoxDecoration(),
                                child: Builder(
                                  builder: (context) {
                                    final busquedasItems = widget.subtitlesjson;
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      controller: autoScrollController,
                                      // shrinkWrap: true,
                                      //controller: _scrollController,
                                      scrollDirection: Axis.vertical,
                                      itemCount: busquedasItems.length,
                                      itemBuilder:
                                          (context, busquedasItemsIndex) {
                                        final busquedasItemsItem =
                                            busquedasItems[busquedasItemsIndex];
                                        if (busquedasItems.isEmpty ||
                                            busquedasItems == null) {
                                          return EmptylistWidget();
                                        }
                                        return AutoScrollTag(
                                          key: ValueKey(busquedasItemsIndex),
                                          controller: autoScrollController,
                                          index: busquedasItemsIndex,
                                          child: Container(
                                            padding: EdgeInsets.only(
                                                left: 3.0, right: 10.0),
                                            // key: itemKeys[
                                            //     busquedasItemsIndex], // Usa el GlobalKey
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                if (FFAppState().showTime)
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.00, -1.00),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFF21374C),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF21374C),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(3,
                                                                      3, 3, 3),
                                                          child: Text(
                                                            '${_formatDurationTime(getJsonField(
                                                              busquedasItemsItem,
                                                              r'''$.start_time''',
                                                            ))}',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF17ACF3),
                                                                  fontSize: 10,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                // Container(
                                                //   height: 25,
                                                //   decoration: BoxDecoration(
                                                //     color: Color(0xFF1A158C),
                                                //   ),
                                                //   child: Align(
                                                //     alignment:
                                                //         AlignmentDirectional(
                                                //             0.00, 0.00),
                                                //     child: Padding(
                                                //       padding:
                                                //           EdgeInsetsDirectional
                                                //               .fromSTEB(
                                                //                   8, 8, 8, 8),
                                                //       child: Text(
                                                //         '${_formatDurationTime(getJsonField(
                                                //           busquedasItemsItem,
                                                //           r'''$.start_time''',
                                                //         ))}',
                                                //         style:
                                                //             FlutterFlowTheme.of(
                                                //                     context)
                                                //                 .bodyMedium
                                                //                 .override(
                                                //                   fontFamily:
                                                //                       'Plus Jakarta Sans',
                                                //                   color: Color(
                                                //                       0xFFF0F0F3),
                                                //                   fontSize: 9,
                                                //                 ),
                                                //       ),
                                                //     ),
                                                //   ),
                                                // ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                3, 3, 3, 3),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(3,
                                                                      3, 3, 3),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            getJsonField(
                                                              busquedasItemsItem,
                                                              r'''$.text''',
                                                            ).toString(),
                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                fontSize: widget
                                                                    .fontsize,
                                                                color: busquedasItemsIndex ==
                                                                        _currentSubtitleIndex
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText),
                                                          )),
                                                          // child: Text(
                                                          //   getJsonField(
                                                          //     busquedasItemsItem,
                                                          //     r'''$.text''',
                                                          //   ).toString(),
                                                          //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                          //       fontFamily:
                                                          //           'Plus Jakarta Sans',
                                                          //       fontSize: 11,
                                                          //       color: busquedasItemsIndex ==
                                                          //               _currentSubtitleIndex
                                                          //           ? FlutterFlowTheme.of(
                                                          //                   context)
                                                          //               .primaryText
                                                          //           : FlutterFlowTheme.of(
                                                          //                   context)
                                                          //               .secondaryText),
                                                          // ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 5,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    color: busquedasItemsIndex ==
                                                            _currentSubtitleIndex
                                                        ? FlutterFlowTheme.of(
                                                                context)
                                                            .newColor
                                                        : FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          'l3o8wb5b' /* Personajes */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: widget.fontsize,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: TranscriptionAPIGroup
                                                  .gettranscriptionsbyidCall
                                                  .characterlist(
                                                    columnGettranscriptionsbyidResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Texto copiado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  Color(0xFF21374D),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.copy_all,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                      TranscriptionAPIGroup
                                          .gettranscriptionsbyidCall
                                          .characterlist(
                                            columnGettranscriptionsbyidResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 10),
                                child: FlutterFlowChoiceChips(
                                  options: (TranscriptionAPIGroup
                                          .gettranscriptionsbyidCall
                                          .keywords(
                                    columnGettranscriptionsbyidResponse
                                        .jsonBody,
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList()!
                                      .map((label) => ChipData(label))
                                      .toList(),
                                  onChanged: (val) async {
                                    setState(() =>
                                        _model.choiceChipsValue = val?.first);
                                    if (Navigator.of(context).canPop()) {
                                      context.pop();
                                    }
                                    context.pushNamed(
                                      'KeywordsPage',
                                      queryParameters: {
                                        'ids': serializeParam(
                                          _model.choiceChipsValue,
                                          ParamType.String,
                                        ),
                                        'id': serializeParam(
                                          widget.id,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {
                                      FFAppState().showVideo = false;
                                    });
                                    setState(() {
                                      FFAppState().ListDrawer = [];
                                      FFAppState().ListaDashboard = [];
                                      FFAppState().listkeywordsdata = [];
                                    });
                                  },
                                  // onChanged: (val) => setState(() =>
                                  //     _model.choiceChipsValue = val?.first),
                                  selectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).secondary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 9,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    iconSize: 6,
                                    elevation: 4,
                                    borderRadius: BorderRadius.circular(9),
                                  ),
                                  unselectedChipStyle: ChipStyle(
                                    backgroundColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Plus Jakarta Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 9,
                                        ),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    iconSize: 18,
                                    elevation: 0,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  chipSpacing: 6,
                                  rowSpacing: 6,
                                  multiselect: false,
                                  alignment: WrapAlignment.start,
                                  controller:
                                      _model.choiceChipsValueController ??=
                                          FormFieldController<List<String>>(
                                    [],
                                  ),
                                  wrapped: true,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            constraints: BoxConstraints(
                              maxWidth: 970,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(0),
                              border: Border.all(
                                color: Color(0xFFE5E7EB),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 12, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'xtzy9cn5' /* informaciòn */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 12, 0),
                                    child: Text(
                                      FFLocalizations.of(context).getText(
                                        'de8ht3q4' /* Datos acerca de la media. */,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                  ListView(
                                    padding: EdgeInsets.fromLTRB(
                                      0,
                                      16,
                                      0,
                                      16,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0xFFE5E7EB),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '4h26k6er' /* Fecha de Creaciòn */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.formatTimeStamp(
                                                                  TranscriptionAPIGroup
                                                                      .gettranscriptionsbyidCall
                                                                      .createdat(
                                                                        columnGettranscriptionsbyidResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toString()),
                                                              '00:00',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF606A85),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0xFFE5E7EB),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              'v80amvxc' /* Ultima Actualizaciòn */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            valueOrDefault<
                                                                String>(
                                                              functions.formatTimeStamp(
                                                                  TranscriptionAPIGroup
                                                                      .gettranscriptionsbyidCall
                                                                      .updatedat(
                                                                        columnGettranscriptionsbyidResponse
                                                                            .jsonBody,
                                                                      )
                                                                      .toString()),
                                                              '00:00',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF606A85),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0xFFE5E7EB),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            FFLocalizations.of(
                                                                    context)
                                                                .getText(
                                                              '5m9tgkci' /* Fuente */,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                          Text(
                                                            TranscriptionAPIGroup
                                                                .gettranscriptionsbyidCall
                                                                .source(
                                                                  columnGettranscriptionsbyidResponse
                                                                      .jsonBody,
                                                                )
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF606A85),
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        constraints: BoxConstraints(
                                          maxWidth: 570,
                                        ),
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Color(0xFFE5E7EB),
                                              offset: Offset(0, 1),
                                            )
                                          ],
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 4, 8, 8),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 0, 0, 0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future: TranscriptionAPIGroup
                                                                    .getUserdatabyidCall
                                                                    .call(
                                                                  id: TranscriptionAPIGroup
                                                                      .gettranscriptionsbyidCall
                                                                      .iduser(
                                                                    columnGettranscriptionsbyidResponse
                                                                        .jsonBody,
                                                                  ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
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
                                                                  final textGetUserdatabyidResponse =
                                                                      snapshot
                                                                          .data!;
                                                                  return Text(
                                                                    functions.userName(TranscriptionAPIGroup
                                                                        .getUserdatabyidCall
                                                                        .userName(
                                                                          textGetUserdatabyidResponse
                                                                              .jsonBody,
                                                                        )
                                                                        .toString()),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              'Plus Jakarta Sans',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .check_circle,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .success,
                                                                size: 20,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: RichText(
                                                          textScaleFactor:
                                                              MediaQuery.of(
                                                                      context)
                                                                  .textScaleFactor,
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: FFLocalizations.of(
                                                                        context)
                                                                    .getText(
                                                                  'yzfnkpe1' /* Creador */,
                                                                ),
                                                                style:
                                                                    TextStyle(),
                                                              )
                                                            ],
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Plus Jakarta Sans',
                                                                  color: Color(
                                                                      0xFF606A85),
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 8)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '00gtud6w' /* Resumen */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 10,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: TranscriptionAPIGroup
                                                  .gettranscriptionsbyidCall
                                                  .summarize(
                                                    columnGettranscriptionsbyidResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Texto copiado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  Color(0xFF21374D),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.copy_all,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                      TranscriptionAPIGroup
                                          .gettranscriptionsbyidCall
                                          .summarize(
                                            columnGettranscriptionsbyidResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '1rrc3o7i' /* Resumen extendido */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 10,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: TranscriptionAPIGroup
                                                  .gettranscriptionsbyidCall
                                                  .summarizeadvanced(
                                                    columnGettranscriptionsbyidResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Texto copiado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  Color(0xFF21374D),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.copy_all,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                      TranscriptionAPIGroup
                                          .gettranscriptionsbyidCall
                                          .summarizeadvanced(
                                            columnGettranscriptionsbyidResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.vertical,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 8, 8, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        FFLocalizations.of(context).getText(
                                          '9xtdottq' /* Titulares */,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Plus Jakarta Sans',
                                              fontSize: 10,
                                            ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await Clipboard.setData(ClipboardData(
                                              text: TranscriptionAPIGroup
                                                  .gettranscriptionsbyidCall
                                                  .headlines(
                                                    columnGettranscriptionsbyidResponse
                                                        .jsonBody,
                                                  )
                                                  .toString()));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Texto copiado',
                                                style: TextStyle(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryText,
                                                ),
                                              ),
                                              duration:
                                                  Duration(milliseconds: 2000),
                                              backgroundColor:
                                                  Color(0xFF21374D),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.copy_all,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-1.00, 0.00),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 8, 8, 8),
                                    child: SelectionArea(
                                        child: Text(
                                      TranscriptionAPIGroup
                                          .gettranscriptionsbyidCall
                                          .headlines(
                                            columnGettranscriptionsbyidResponse
                                                .jsonBody,
                                          )
                                          .toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall,
                                    )),
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
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
            ))
              Container(
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // Generated code for this Column Widget...
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // Padding(
                                    //   padding:
                                    //       const EdgeInsets.only(right: 5.0),
                                    //   child: FlutterFlowIconButton(
                                    //     borderColor:
                                    //         FlutterFlowTheme.of(context)
                                    //             .alternate,
                                    //     borderRadius: 12,
                                    //     borderWidth: 2,
                                    //     buttonSize: 39,
                                    //     fillColor: FlutterFlowTheme.of(context)
                                    //         .accent4,
                                    //     icon: Icon(
                                    //       _videoController.value.isPlaying
                                    //           ? Icons.pause
                                    //           : isFinished
                                    //               ? Icons.replay
                                    //               : Icons.play_arrow,
                                    //       color: FlutterFlowTheme.of(context)
                                    //           .primaryText,
                                    //       size: 19,
                                    //     ),
                                    //     onPressed: () {
                                    //       /// check if video has ended
                                    //       if (isFinished) {
                                    //         /// restart the video by setting current position to 0
                                    //         _videoController.initialize();
                                    //         _videoController
                                    //             .seekTo(Duration.zero);

                                    //         _videoController.play();
                                    //       } else {
                                    //         _videoController.value.isPlaying
                                    //             ? _videoController.pause()
                                    //             : _videoController.play();
                                    //       }
                                    //       // _videoController.value.isPlaying
                                    //       //     ? _videoController.pause()
                                    //       //     : _videoController
                                    //       //             .value.position.isNegative
                                    //       //         ? _videoController
                                    //       //             .seekTo(Duration.zero)
                                    //       //         : _videoController.play();
                                    //     },
                                    //   ),
                                    // ),
                                    if (valueOrDefault<bool>(
                                        currentUserDocument?.isDeveloper,
                                        false))
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 1, 2),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12,
                                          borderWidth: 2,
                                          buttonSize: 39,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          icon: Icon(
                                            Icons.call_made,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 19,
                                          ),
                                          onPressed: () async {
                                            await showDialog(
                                              context: context,
                                              builder: (dialogContext) {
                                                return Dialog(
                                                    insetPadding: EdgeInsets
                                                        .zero,
                                                    backgroundColor: Colors
                                                        .transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0, 0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: Container());
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                        ),
                                      ),

                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2, 2, 1, 2),
                                      child: FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: 12,
                                        borderWidth: 2,
                                        buttonSize: 39,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .accent4,
                                        icon: Icon(
                                          Icons.call_received,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 19,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            FFAppState().tiempoSalida =
                                                _videoController.value.position
                                                    .toString();
                                          });
                                        },
                                      ),
                                    ),
                                    if (() {
                                      if (FFAppState().tiempoEntrada != null &&
                                          FFAppState().tiempoEntrada != '' &&
                                          FFAppState().tiempoSalida != null &&
                                          FFAppState().tiempoSalida != '') {
                                        return true;
                                      } else {
                                        return false;
                                      }
                                    }())
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            2, 2, 1, 2),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderRadius: 12,
                                          borderWidth: 2,
                                          buttonSize: 39,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .accent4,
                                          icon: Icon(
                                            Icons.download,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            size: 19,
                                          ),
                                          onPressed: () async {
                                            await launchURL(
                                                TranscriptionAPIGroup
                                                    .gettranscriptionsbyidCall
                                                    .mediafilepath(
                                              columnGettranscriptionsbyidResponse
                                                  .jsonBody,
                                            )!);
                                          },
                                        ),
                                      ),
                                    // MouseRegion(
                                    //   opaque: false,
                                    //   cursor: MouseCursor.defer ??
                                    //       MouseCursor.defer,
                                    //   child: FlutterFlowIconButton(
                                    //     borderColor:
                                    //         FlutterFlowTheme.of(context)
                                    //             .alternate,
                                    //     borderRadius: 12,
                                    //     borderWidth: 2,
                                    //     buttonSize: 39,
                                    //     fillColor: FlutterFlowTheme.of(context)
                                    //         .accent4,
                                    //     icon: Icon(
                                    //       isVol
                                    //           ? Icons.volume_up
                                    //           : Icons.volume_mute,
                                    //       color: isVol
                                    //           ? FlutterFlowTheme.of(context)
                                    //               .primaryText
                                    //           : FlutterFlowTheme.of(context)
                                    //               .accent1,
                                    //       size: 19,
                                    //     ),
                                    //     onPressed: () async {
                                    //       setState(() {
                                    //         isVol =
                                    //             !isVol; // Toggle the value of isVol
                                    //         if (isVol) {
                                    //           // If unmuting, set volume to the last non-muted volume
                                    //           _videoController.setVolume(
                                    //               lastNonMutedVolume);
                                    //         } else {
                                    //           // If muting, store the current volume in lastNonMutedVolume
                                    //           lastNonMutedVolume =
                                    //               _videoController.value.volume;
                                    //           _videoController.setVolume(0.0);
                                    //         }
                                    //         // isVol =
                                    //         //     !isVol; // Toggle the value of isVol
                                    //         // isVol
                                    //         //     ? _videoController
                                    //         //         .setVolume(1.0)
                                    //         //     : _videoController
                                    //         //         .setVolume(0.0);
                                    //       });
                                    //     },
                                    //   ),
                                    //   onEnter: ((event) async {
                                    //     setState(() =>
                                    //         _model.mouseRegionHovered1 = true);
                                    //     setState(() {
                                    //       FFAppState().volControl = true;
                                    //     });
                                    //   }),
                                    //   onExit: ((event) async {
                                    //     setState(() =>
                                    //         _model.mouseRegionHovered1 = false);
                                    //     setState(() {
                                    //       FFAppState().volControl = false;
                                    //     });
                                    //   }),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            // MouseRegion(
                            //   opaque: false,
                            //   cursor: MouseCursor.defer ?? MouseCursor.defer,
                            //   child: Visibility(
                            //     visible: FFAppState().volControl,
                            //     child: Container(
                            //       width: 140.0,
                            //       height: 20.0,
                            //       child: SliderTheme(
                            //         data: SliderThemeData(
                            //           showValueIndicator:
                            //               ShowValueIndicator.always,
                            //         ),
                            //         child: Slider(
                            //           activeColor:
                            //               FlutterFlowTheme.of(context).error,
                            //           inactiveColor:
                            //               FlutterFlowTheme.of(context)
                            //                   .botonesPlayer,
                            //           value: isVol ? videoVolume : 0.0,
                            //           min: 0.0,
                            //           max: 1.0,
                            //           onChanged: (value) {
                            //             setState(() {
                            //               videoVolume = value;
                            //               _videoController
                            //                   .setVolume(videoVolume);
                            //             });
                            //           },
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            //   onEnter: ((event) async {
                            //     setState(
                            //         () => _model.mouseRegionHovered2 = true);
                            //     setState(() {
                            //       FFAppState().volControl = true;
                            //     });
                            //   }),
                            //   onExit: ((event) async {
                            //     setState(
                            //         () => _model.mouseRegionHovered2 = false);
                            //     setState(() {
                            //       FFAppState().volControl = false;
                            //     });
                            //   }),
                            // ),
                            if (valueOrDefault<bool>(
                                currentUserDocument?.isDeveloper, false))
                              Expanded(
                                child: Container(
                                  width: 300,
                                  decoration: BoxDecoration(),
                                  child: FlutterFlowChoiceChips(
                                    options: FFAppState()
                                        .Listademarcas
                                        .where((e) =>
                                            e.idTranscription ==
                                            TranscriptionAPIGroup
                                                .gettranscriptionsbyidCall
                                                .id(
                                              columnGettranscriptionsbyidResponse
                                                  .jsonBody,
                                            ))
                                        .toList()
                                        .map((e) => e.titulo)
                                        .toList()
                                        .map((label) => ChipData(label))
                                        .toList(),
                                    onChanged: (val) async {
                                      // Buscar el elemento seleccionado
                                      var elementoSeleccionado =
                                          listaFiltrada.firstWhere(
                                        (e) => e.titulo == val?.first,
                                      );

                                      // Aquí obtienes el valor de 'entrada' del elemento seleccionado
                                      var entradaSeleccionada =
                                          elementoSeleccionado?.entrada;

                                      setState(() =>
                                          _model.marcasValue = val?.first);
                                      _videoController.seekTo(
                                          _parseDuration(entradaSeleccionada!));

                                      // Aquí puedes hacer algo con entradaSeleccionada
                                    },
                                    selectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      iconSize: 18,
                                      elevation: 4,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    unselectedChipStyle: ChipStyle(
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                          ),
                                      iconColor: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      iconSize: 18,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    chipSpacing: 12,
                                    rowSpacing: 12,
                                    multiselect: false,
                                    alignment: WrapAlignment.start,
                                    controller: _model.marcasValueController ??=
                                        FormFieldController<List<String>>(
                                      [],
                                    ),
                                    wrapped: false,
                                  ),
                                ),
                              ),
                            // Expanded(
                            //   child: Column(
                            //     children: [
                            //       if (FFAppState().tiempoEntrada != null)
                            //         Text(
                            //             'Entrada: ${FFAppState().tiempoEntrada}'),
                            //       if (FFAppState().tiempoSalida != null)
                            //         Text(
                            //             'Salida: ${FFAppState().tiempoSalida}'),
                            //     ],
                            //   ),
                            // ),

                            // Expanded(
                            //   child: VideoProgressIndicator(_videoController,
                            //       allowScrubbing: true),
                            // ),
                            ValueListenableBuilder(
                              valueListenable: _videoController,
                              builder:
                                  (context, VideoPlayerValue value, child) {
                                return Text(
                                  "${_formatDuration(_videoController.value.position)} / ${_formatDuration(_videoController.value.duration)}",
                                );
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
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Icon(
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
                              ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Icon(
                                Icons.settings_outlined,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24,
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
                                    isGlobal: true,
                                    avoidOverflow: false,
                                    targetAnchor: AlignmentDirectional(0, 0)
                                        .resolve(Directionality.of(context)),
                                    followerAnchor: AlignmentDirectional(0, 0)
                                        .resolve(Directionality.of(context)),
                                    builder: (dialogContext) {
                                      return Material(
                                        color: Colors.transparent,
                                        child: Container(
                                          height: 220,
                                          width: 400,
                                          child: DownloadFilesWidget(
                                            srtFile: TranscriptionAPIGroup
                                                .gettranscriptionsbyidCall
                                                .transcriptionsrtpath(
                                                  columnGettranscriptionsbyidResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                            docFile: TranscriptionAPIGroup
                                                .gettranscriptionsbyidCall
                                                .transcriptiondocpath(
                                                  columnGettranscriptionsbyidResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                            filename: TranscriptionAPIGroup
                                                .gettranscriptionsbyidCall
                                                .title(
                                                  columnGettranscriptionsbyidResponse
                                                      .jsonBody,
                                                )
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                child: Icon(
                                  Icons.cloud_download,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24,
                                ),
                              ),
                            ),
                            ToggleIcon(
                              onPressed: () async {
                                setState(() => FFAppState().showTime =
                                    !FFAppState().showTime);
                              },
                              value: FFAppState().showTime,
                              onIcon: Icon(
                                Icons.timer_off,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 25,
                              ),
                              offIcon: Icon(
                                Icons.timer,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 20,
                              ),
                            ),
                          ].divide(SizedBox(width: 9)),
                        ),
                      ),
                    ),
                    Container(
                      height: (FFAppState().elementosListaResumen.isEmpty &&
                              FFAppState().elementosHeadlines.isEmpty)
                          ? MediaQuery.of(context).size.height * 0.30
                          : (FFAppState().elementosListaResumen.isEmpty ||
                                  FFAppState().elementosHeadlines.isEmpty)
                              ? MediaQuery.of(context).size.height * 0.35
                              : MediaQuery.of(context).size.height * 0.50,
                      // height: FFAppState().elementosListaResumen.length == 0 &&
                      //         FFAppState().elementosHeadlines.length == 0
                      //     ? MediaQuery.sizeOf(context).height * 0.40
                      //     : MediaQuery.sizeOf(context).height * 0.50,
                      decoration: BoxDecoration(),
                      //child: _buildContinuousTextWidget(),
                      child: Builder(
                        builder: (context) {
                          final busquedasItems = widget.subtitlesjson;
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            controller: autoScrollController,
                            // shrinkWrap: true,
                            //controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            itemCount: busquedasItems.length,
                            itemBuilder: (context, busquedasItemsIndex) {
                              final busquedasItemsItem =
                                  busquedasItems[busquedasItemsIndex];
                              if (busquedasItems.isEmpty) {
                                return EmptylistWidget();
                              }
                              return AutoScrollTag(
                                key: ValueKey(busquedasItemsIndex),
                                controller: autoScrollController,
                                index: busquedasItemsIndex,
                                child: InkWell(
                                  onDoubleTap: () {
                                    if (_videoController.value.isInitialized) {
                                      _videoController.seekTo(
                                        _parseDuration(getJsonField(
                                          busquedasItemsItem,
                                          r'''$.start_time''',
                                        )),
                                      );

                                      if (!_videoController.value.isPlaying) {
                                        _videoController.play();
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                    // key: itemKeys[
                                    //     busquedasItemsIndex], // Usa el GlobalKey
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        if (FFAppState().showTime)
                                          Align(
                                            alignment: AlignmentDirectional(
                                                0.00, -1.00),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF21374C),
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  border: Border.all(
                                                    color: Color(0xFF21374C),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: Text(
                                                    '${_formatDurationTime(getJsonField(
                                                      busquedasItemsItem,
                                                      r'''$.start_time''',
                                                    ))}',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          color:
                                                              Color(0xFF17ACF3),
                                                          fontSize: 10,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        // Container(
                                        //   height: 25,
                                        //   decoration: BoxDecoration(
                                        //     color: Color(0xFF1A158C),
                                        //   ),
                                        //   child: Align(
                                        //     alignment:
                                        //         AlignmentDirectional(
                                        //             0.00, 0.00),
                                        //     child: Padding(
                                        //       padding:
                                        //           EdgeInsetsDirectional
                                        //               .fromSTEB(
                                        //                   8, 8, 8, 8),
                                        //       child: Text(
                                        //         '${_formatDurationTime(getJsonField(
                                        //           busquedasItemsItem,
                                        //           r'''$.start_time''',
                                        //         ))}',
                                        //         style:
                                        //             FlutterFlowTheme.of(
                                        //                     context)
                                        //                 .bodyMedium
                                        //                 .override(
                                        //                   fontFamily:
                                        //                       'Plus Jakarta Sans',
                                        //                   color: Color(
                                        //                       0xFFF0F0F3),
                                        //                   fontSize: 9,
                                        //                 ),
                                        //       ),
                                        //     ),
                                        //   ),
                                        // ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    3, 3, 3, 3),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(3, 3, 3, 3),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    getJsonField(
                                                      busquedasItemsItem,
                                                      r'''$.text''',
                                                    ).toString(),
                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        fontSize:
                                                            widget.fontsize,
                                                        color: busquedasItemsIndex ==
                                                                _currentSubtitleIndex
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText
                                                            : FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText),
                                                  )),
                                                  // child: Text(
                                                  //   getJsonField(
                                                  //     busquedasItemsItem,
                                                  //     r'''$.text''',
                                                  //   ).toString(),
                                                  //   style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                  //       fontFamily:
                                                  //           'Plus Jakarta Sans',
                                                  //       fontSize: 11,
                                                  //       color: busquedasItemsIndex ==
                                                  //               _currentSubtitleIndex
                                                  //           ? FlutterFlowTheme.of(
                                                  //                   context)
                                                  //               .primaryText
                                                  //           : FlutterFlowTheme.of(
                                                  //                   context)
                                                  //               .secondaryText),
                                                  // ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 5,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: busquedasItemsIndex ==
                                                    _currentSubtitleIndex
                                                ? FlutterFlowTheme.of(context)
                                                    .newColor
                                                : FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _error() {
    return Text('Hubo un error en el video');
  }

  Widget _buildVideoPlayer() {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return _chewieController.videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: 1.70,
              child: Chewie(key: chewieKey, controller: _chewieController),
            )
          : Center(
              child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                FlutterFlowTheme.of(context).primary,
              ),
            ));
    }); // Mostrar un indicador de carga mientras el video se inicializa
  }

  Widget _buildAudioPlayer() {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width * 0.30,
            height: MediaQuery.sizeOf(context).width * 0.30,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: Image.asset(
                  Theme.of(context).brightness == Brightness.dark
                      ? 'assets/images/MMWhite.png'
                      : 'assets/images/MMBlack.png',
                ).image,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ChewieAudio(
              controller:
                  _chewieAudioController), // NEW: Usar ChewieAudioController aquí
        ),
      ],
    ); // Mostrar un indicador de carga mientras el audio se inicializa
  }

  Widget _buildContinuousTextWidget() {
    // Suponiendo que 'widget.subtitles' es una String con todos los subtítulos
    return SingleChildScrollView(
      child: RichText(
        text: TextSpan(
          children: _buildTextSpans(widget.subtitles, _currentSubtitleIndex),
        ),
      ),
    );
  }

  List<TextSpan> _buildTextSpans(String subtitles, int currentIndex) {
    List<String> subtitleList = subtitles.split('\n\n');
    List<TextSpan> spans = [];

    for (int i = 0; i < subtitleList.length; i++) {
      spans.add(
        TextSpan(
          text: subtitleList[i] +
              '\n\n', // Añade un salto de línea para separar los subtítulos
          style: TextStyle(
            color: i == currentIndex ? Colors.blue : Colors.black,
            fontSize: 16.0,
          ),
        ),
      );
    }

    return spans;
  }
}

class CustomVideoProgressIndicator extends StatelessWidget {
  final VideoPlayerController videoController;
  final Duration startTime;
  final Duration endTime;

  CustomVideoProgressIndicator({
    required this.videoController,
    required this.startTime,
    required this.endTime,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ProgressIndicatorPainter(
        videoController.value,
        startTime: startTime,
        endTime: endTime,
      ),
      child: Container(
        height: 5, // Altura de la barra de progreso
      ),
    );
  }
}

class _ProgressIndicatorPainter extends CustomPainter {
  final VideoPlayerValue videoValue;
  final Duration startTime;
  final Duration endTime;

  _ProgressIndicatorPainter(this.videoValue,
      {required this.startTime, required this.endTime});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.red // Color de las marcas
      ..strokeWidth = 3; // Ancho de las marcas

    // Dibujar marca de inicio
    final startMarkPos =
        (startTime.inMilliseconds / videoValue.duration.inMilliseconds) *
            size.width;
    canvas.drawLine(
        Offset(startMarkPos, 0), Offset(startMarkPos, size.height), paint);

    // Dibujar marca de fin
    final endMarkPos =
        (endTime.inMilliseconds / videoValue.duration.inMilliseconds) *
            size.width;
    canvas.drawLine(
        Offset(endMarkPos, 0), Offset(endMarkPos, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
