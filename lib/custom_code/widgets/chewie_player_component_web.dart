// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayerComponentWeb extends StatefulWidget {
  const ChewiePlayerComponentWeb({
    super.key,
    this.width,
    this.height,
    required this.subtitlesjson,
    required this.videoOk,
    required this.imageLight,
    required this.fontsize,
  });

  final double? width;
  final double? height;
  final List<dynamic> subtitlesjson;
  final String videoOk;
  final String imageLight;
  final double fontsize;

  @override
  State<ChewiePlayerComponentWeb> createState() =>
      _ChewiePlayerComponentWebState();
}

class _ChewiePlayerComponentWebState extends State<ChewiePlayerComponentWeb> {
  late VideoPlayerController _videoController;
  late ChewieController _chewieController;
  late ScrollController _scrollController;
  final double itemHeight = 65.0; // Definir la altura de tus elementos aquí
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
  }

  @override
  void initState() {
    super.initState();

    try {
      // Asegúrate de que los datos no son nulos o inválidos antes de proceder.
      if (widget.subtitlesjson == null || widget.subtitlesjson.isEmpty) {
        throw Exception("Subtitles data cannot be null or empty");
      }
      if (widget.videoOk == null || widget.videoOk.isEmpty) {
        throw Exception("Video URL cannot be null or empty");
      }
      if (widget.imageLight == null || widget.imageLight.isEmpty) {
        throw Exception("Placeholder image URL cannot be null or empty");
      }

      _scrollController = ScrollController();
      autoScrollController = AutoScrollController();

      _videoController = VideoPlayerController.network(widget.videoOk)
        ..initialize().then((_) {
          setState(() {});
        });

      itemKeys =
          List.generate(widget.subtitlesjson.length, (index) => GlobalKey());

      /// NUEVO

      WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
      WidgetsBinding.instance
          .addPostFrameCallback((_) => _calculateItemHeights()); //NUEVO

      _videoController.addListener(() {
        if (!_videoController.value.isPlaying &&
            _videoController.value.position ==
                _videoController.value.duration) {
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
        customControls: MaterialControls(),
        showControls: true,
        placeholder: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit
                  .fill, // Esto asegura que la imagen cubra todo el container
              image: NetworkImage(widget.imageLight), // URL de la imagen
            ),
          ),
        ),
        allowFullScreen: false,
        autoInitialize: true,
      );

      _videoController.addListener(() {
        _updateSubtitle();

        setState(
            () {}); // Esto obligará al widget a reconstruirse y actualizar los tiempos mostrados.
      });

      _scrollController.addListener(_handleScroll); // Añade esto
      widget.subtitlesjson.sort((a, b) =>
          _timeStampToSeconds(a['start_time'] as String)
              .compareTo(_timeStampToSeconds(b['start_time'] as String)));
    } catch (e) {
      // Captura cualquier excepción y la muestra en la consola.
      print('Error initializing widget: $e');
    }
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

    for (int i = 0; i < widget.subtitlesjson.length; i++) {
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
    _scrollController.removeListener(_handleScroll); // Añade esto
    _scrollControllerText.removeListener(_scrollListener);
    autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.subtitlesjson.isEmpty || widget.videoOk.isEmpty) {
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
    } else {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          _chewieController.videoPlayerController.value.isInitialized
              ? Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  child: Align(
                      alignment: Alignment.center, child: _buildVideoPlayer()),
                )
              : Container(),
          Container(
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.59,
                    decoration: BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        final busquedasItems = widget.subtitlesjson;
                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          controller: autoScrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: busquedasItems.length,
                          itemBuilder: (context, busquedasItemsIndex) {
                            final busquedasItemsItem =
                                busquedasItems[busquedasItemsIndex];
                            if (busquedasItems.isEmpty) {
                              return null;
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
                                  padding:
                                      EdgeInsets.only(left: 10.0, right: 10.0),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(0.00, -1.00),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
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
                                                style:
                                                    FlutterFlowTheme.of(context)
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
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium
                                                      .override(
                                                          fontFamily:
                                                              'Plus Jakarta Sans',
                                                          fontSize:
                                                              widget.fontsize,
                                                          color: busquedasItemsIndex ==
                                                                  _currentSubtitleIndex
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryText
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryText),
                                                )),
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
                ),
              ],
            ),
          ),
        ],
      );
    }
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
}
