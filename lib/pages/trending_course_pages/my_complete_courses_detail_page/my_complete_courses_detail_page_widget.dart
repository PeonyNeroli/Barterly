import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/no_quiz_componant/no_quiz_componant_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_complete_courses_detail_page_model.dart';
export 'my_complete_courses_detail_page_model.dart';

class MyCompleteCoursesDetailPageWidget extends StatefulWidget {
  const MyCompleteCoursesDetailPageWidget({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  final String? courseId;
  final String? courseName;

  static String routeName = 'MyCompleteCoursesDetailPage';
  static String routePath = '/myCompleteCoursesDetailPage';

  @override
  State<MyCompleteCoursesDetailPageWidget> createState() =>
      _MyCompleteCoursesDetailPageWidgetState();
}

class _MyCompleteCoursesDetailPageWidgetState
    extends State<MyCompleteCoursesDetailPageWidget> {
  late MyCompleteCoursesDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCompleteCoursesDetailPageModel());

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
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).cultured,
            ),
            child: Builder(
              builder: (context) {
                if (FFAppState().connected) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.customCenterAppbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomCenterAppbarWidget(
                          title: widget.courseName,
                          backIcon: false,
                          addIcon: false,
                          onTapAdd: () async {},
                          onTapBack: () async {},
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .myCourseDetailCache(
                            requestFn: () =>
                                EducationAPIsGroup.lessonApiCall.call(
                              courseId: widget.courseId,
                              userId: FFAppState().userId,
                            ),
                          )
                              .then((result) {
                            _model.apiRequestCompleted = true;
                            return result;
                          }),
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
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (EducationAPIsGroup.lessonApiCall.success(
                                        containerLessonApiResponse.jsonBody,
                                      ) ==
                                      1) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Builder(
                                            builder: (context) {
                                              final lessonsList =
                                                  EducationAPIsGroup
                                                          .lessonApiCall
                                                          .lessonsList(
                                                            containerLessonApiResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];
                                              if (lessonsList.isEmpty) {
                                                return Center(
                                                  child: Container(
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    child:
                                                        NoQuizComponantWidget(),
                                                  ),
                                                );
                                              }

                                              return RefreshIndicator(
                                                key: Key(
                                                    'RefreshIndicator_41egrzb2'),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                onRefresh: () async {
                                                  safeSetState(() {
                                                    FFAppState()
                                                        .clearMyCourseDetailCacheCache();
                                                    _model.apiRequestCompleted =
                                                        false;
                                                  });
                                                  await _model
                                                      .waitForApiRequestCompleted();
                                                },
                                                child: ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    16.0,
                                                    0,
                                                    16.0,
                                                  ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: lessonsList.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 16.0),
                                                  itemBuilder: (context,
                                                      lessonsListIndex) {
                                                    final lessonsListItem =
                                                        lessonsList[
                                                            lessonsListIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  20.0,
                                                                  0.0,
                                                                  20.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 10.0,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .shadowColor,
                                                              offset: Offset(
                                                                0.0,
                                                                5.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      12.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      16.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          AutoSizeText(
                                                                        'Lesson ${(lessonsListIndex + 1).toString()} - ${getJsonField(
                                                                          lessonsListItem,
                                                                          r'''$.lesson''',
                                                                        ).toString()}',
                                                                        maxLines:
                                                                            1,
                                                                        minFontSize:
                                                                            14.0,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              if (getJsonField(
                                                                    lessonsListItem,
                                                                    r'''$.topics''',
                                                                  ) !=
                                                                  null)
                                                                Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final topicsList =
                                                                        getJsonField(
                                                                      lessonsListItem,
                                                                      r'''$.topics''',
                                                                    ).toList();

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      primary:
                                                                          false,
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          topicsList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              topicsListIndex) {
                                                                        final topicsListItem =
                                                                            topicsList[topicsListIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              16.0),
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
                                                                              context.pushNamed(
                                                                                MyCoursesVideoPageWidget.routeName,
                                                                                queryParameters: {
                                                                                  'link': serializeParam(
                                                                                    '#' ==
                                                                                            getJsonField(
                                                                                              topicsListItem,
                                                                                              r'''$.link''',
                                                                                            ).toString()
                                                                                        ? null
                                                                                        : getJsonField(
                                                                                            topicsListItem,
                                                                                            r'''$.link''',
                                                                                          ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'courseId': serializeParam(
                                                                                    widget.courseId,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'lessonId': serializeParam(
                                                                                    getJsonField(
                                                                                      lessonsListItem,
                                                                                      r'''$._id''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'topicId': serializeParam(
                                                                                    getJsonField(
                                                                                      topicsListItem,
                                                                                      r'''$._id''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'name': serializeParam(
                                                                                    getJsonField(
                                                                                      topicsListItem,
                                                                                      r'''$.topic''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'description': serializeParam(
                                                                                    getJsonField(
                                                                                      topicsListItem,
                                                                                      r'''$.description''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'url': serializeParam(
                                                                                    getJsonField(
                                                                                              topicsListItem,
                                                                                              r'''$.url''',
                                                                                            ) !=
                                                                                            null
                                                                                        ? getJsonField(
                                                                                            topicsListItem,
                                                                                            r'''$.url''',
                                                                                          ).toString()
                                                                                        : null,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'video': serializeParam(
                                                                                    getJsonField(
                                                                                              topicsListItem,
                                                                                              r'''$.video''',
                                                                                            ) !=
                                                                                            null
                                                                                        ? getJsonField(
                                                                                            topicsListItem,
                                                                                            r'''$.video''',
                                                                                          ).toString()
                                                                                        : null,
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              FFAppState().courseId = widget.courseId!;
                                                                              FFAppState().lessonId = getJsonField(
                                                                                lessonsListItem,
                                                                                r'''$._id''',
                                                                              ).toString();
                                                                              FFAppState().topicId = getJsonField(
                                                                                topicsListItem,
                                                                                r'''$._id''',
                                                                              ).toString();
                                                                              FFAppState().update(() {});
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).cultured,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsets.all(12.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 48.0,
                                                                                      height: 48.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Text(
                                                                                        (topicsListIndex + 1).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'SF Pro Display',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 16.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w500,
                                                                                              useGoogleFonts: false,
                                                                                              lineHeight: 1.5,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              getJsonField(
                                                                                                topicsListItem,
                                                                                                r'''$.topic''',
                                                                                              ).toString(),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    fontSize: 14.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: false,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                            if (true ==
                                                                                                getJsonField(
                                                                                                  topicsListItem,
                                                                                                  r'''$.completed''',
                                                                                                ))
                                                                                              Text(
                                                                                                'Completed',
                                                                                                maxLines: 1,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: 'SF Pro Display',
                                                                                                      color: FlutterFlowTheme.of(context).success,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: false,
                                                                                                      lineHeight: 1.5,
                                                                                                    ),
                                                                                              ),
                                                                                          ].divide(SizedBox(height: 4.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                      child: SvgPicture.asset(
                                                                                        'assets/images/video-circle.svg',
                                                                                        width: 26.0,
                                                                                        height: 26.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 24.0, 20.0, 30.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                context.pushNamed(
                                                  AssignmentPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'courseId': serializeParam(
                                                      widget.courseId,
                                                      ParamType.String,
                                                    ),
                                                    'courseName':
                                                        serializeParam(
                                                      widget.courseName,
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              text: 'Your Assignment',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 56.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              'SF Pro Display',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w500,
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
                                          EducationAPIsGroup.lessonApiCall
                                              .message(
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
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
          ),
        ),
      ),
    );
  }
}
