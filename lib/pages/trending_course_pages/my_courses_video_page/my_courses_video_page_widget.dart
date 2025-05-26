import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_courses_video_page_model.dart';
export 'my_courses_video_page_model.dart';

class MyCoursesVideoPageWidget extends StatefulWidget {
  const MyCoursesVideoPageWidget({
    super.key,
    required this.link,
    required this.courseId,
    required this.lessonId,
    required this.topicId,
    required this.name,
    required this.description,
    String? url,
    required this.video,
  }) : this.url = url ?? '';

  final String? link;
  final String? courseId;
  final String? lessonId;
  final String? topicId;
  final String? name;
  final String? description;
  final String url;
  final String? video;

  static String routeName = 'MyCoursesVideoPage';
  static String routePath = '/myCoursesVideoPage';

  @override
  State<MyCoursesVideoPageWidget> createState() =>
      _MyCoursesVideoPageWidgetState();
}

class _MyCoursesVideoPageWidgetState extends State<MyCoursesVideoPageWidget> {
  late MyCoursesVideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCoursesVideoPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: FutureBuilder<ApiCallResponse>(
            future: FFAppState().myCourseDetailCache(
              uniqueQueryKey: FFAppState().userId,
              requestFn: () => EducationAPIsGroup.lessonApiCall.call(
                courseId: widget.courseId,
                userId: FFAppState().userId,
              ),
            ),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        FlutterFlowTheme.of(context).primary,
                      ),
                    ),
                  ),
                );
              }
              final containerLessonApiResponse = snapshot.data!;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).cultured,
                ),
                child: Builder(
                  builder: (context) {
                    if (FFAppState().connected) {
                      return Builder(
                        builder: (context) {
                          if (EducationAPIsGroup.lessonApiCall.success(
                                containerLessonApiResponse.jsonBody,
                              ) ==
                              1) {
                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 16.0, 20.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.safePop();
                                          },
                                          child: Container(
                                            width: 40.0,
                                            height: 40.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .cultured,
                                              shape: BoxShape.circle,
                                            ),
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                                child: SvgPicture.asset(
                                                  'assets/images/back.svg',
                                                  fit: BoxFit.contain,
                                                  alignment:
                                                      Alignment(0.0, 0.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                widget.name,
                                                'Video',
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 1,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 40.0,
                                          height: 40.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                        ),
                                      ].divide(SizedBox(width: 12.0)),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Visibility(
                                      visible: valueOrDefault<bool>(
                                        (widget.link != null &&
                                                widget.link != '') ||
                                            (widget.video != null &&
                                                widget.video != '') ||
                                            (widget.url != ''),
                                        false,
                                      ),
                                      child:
                                          custom_widgets.VideoPlayerOrWebView(
                                        width: double.infinity,
                                        height: 345.0,
                                        videoUrl: () {
                                          if ((widget.link != null &&
                                                  widget.link != '') &&
                                              (widget.link != '#') &&
                                              ((widget.link!).length > 4)) {
                                            return 'https://www.youtube.com/watch?v=${widget.link}';
                                          } else if ((widget.video != null &&
                                                  widget.video != '') &&
                                              (widget.video != '#') &&
                                              ((widget.video!).length > 4)) {
                                            return '${FFAppConstants.videoUrl}${widget.video}';
                                          } else {
                                            return widget.url;
                                          }
                                        }(),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20.0, 24.0, 20.0, 30.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        _model.readLessonApi =
                                            await EducationAPIsGroup
                                                .readlessonApiCall
                                                .call(
                                          courseId: widget.courseId,
                                          lessonId: widget.lessonId,
                                          topicId: widget.topicId,
                                          token: FFAppState().token,
                                        );

                                        if (EducationAPIsGroup.readlessonApiCall
                                                .success(
                                              (_model.readLessonApi?.jsonBody ??
                                                  ''),
                                            ) ==
                                            1) {
                                          FFAppState()
                                              .clearMyCourseDetailCacheCache();
                                          await actions.showCustomToastTop(
                                            EducationAPIsGroup.readlessonApiCall
                                                .message(
                                              (_model.readLessonApi?.jsonBody ??
                                                  ''),
                                            )!,
                                          );
                                          context.safePop();
                                        } else {
                                          await actions.showCustomToastTop(
                                            EducationAPIsGroup.readlessonApiCall
                                                .message(
                                              (_model.readLessonApi?.jsonBody ??
                                                  ''),
                                            )!,
                                          );
                                        }

                                        safeSetState(() {});
                                      },
                                      text: 'Mark as a Completed',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 56.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24.0, 0.0, 24.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily: 'SF Pro Display',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              fontSize: 18.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              useGoogleFonts: false,
                                            ),
                                        elevation: 0.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          } else {
                            return Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                valueOrDefault<String>(
                                  EducationAPIsGroup.lessonApiCall.message(
                                    containerLessonApiResponse.jsonBody,
                                  ),
                                  'Message',
                                ),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      useGoogleFonts: false,
                                      lineHeight: 1.5,
                                    ),
                              ),
                            );
                          }
                        },
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Lottie.asset(
                          'assets/jsons/No_Wifi.json',
                          width: 150.0,
                          height: 130.0,
                          fit: BoxFit.contain,
                          animate: true,
                        ),
                      );
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
