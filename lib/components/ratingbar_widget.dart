import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_rating_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'ratingbar_model.dart';
export 'ratingbar_model.dart';

class RatingbarWidget extends StatefulWidget {
  const RatingbarWidget({
    super.key,
    required this.transcriptionid,
    required this.counter,
    required this.userid,
  });

  final int? transcriptionid;
  final int? counter;
  final int? userid;

  @override
  State<RatingbarWidget> createState() => _RatingbarWidgetState();
}

class _RatingbarWidgetState extends State<RatingbarWidget> {
  late RatingbarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RatingbarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => RatingBar.builder(
        onRatingUpdate: (newValue) async {
          setState(() => _model.ratingBarValue = newValue);
          var shouldSetState = false;
          if (widget.userid == currentUserData?.userId) {
            _model.ratinApi = await TranscriptionAPIGroup.ratingCall.call(
              token: currentAuthenticationToken,
              id: widget.transcriptionid,
              rating: _model.ratingBarValue?.round(),
            );
            shouldSetState = true;
            if ((_model.ratinApi?.succeeded ?? true)) {
              FFAppState().update(() {});
            } else {
              if (shouldSetState) setState(() {});
              return;
            }

            if (shouldSetState) setState(() {});
            return;
          } else {
            await showDialog(
              context: context,
              builder: (dialogContext) {
                return Dialog(
                  elevation: 0,
                  insetPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  alignment: const AlignmentDirectional(1.0, 1.0)
                      .resolve(Directionality.of(context)),
                  child: const SizedBox(
                    height: 100.0,
                    width: 300.0,
                    child: MensajeRatingWidget(),
                  ),
                );
              },
            ).then((value) => setState(() {}));

            setState(() {
              _model.ratingBarValue = widget.counter!.toDouble();
            });
            if (shouldSetState) setState(() {});
            return;
          }

          if (shouldSetState) setState(() {});
        },
        itemBuilder: (context, index) => Icon(
          Icons.star_rounded,
          color: FlutterFlowTheme.of(context).warning,
        ),
        direction: Axis.horizontal,
        initialRating: _model.ratingBarValue ??= widget.counter!.toDouble(),
        unratedColor: const Color(0xFF57636C),
        itemCount: 5,
        itemSize: 15.0,
        glowColor: FlutterFlowTheme.of(context).warning,
      ),
    );
  }
}
