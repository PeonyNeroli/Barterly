import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/no_assignment_componant/no_assignment_componant_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'assignment_page_model.dart';
export 'assignment_page_model.dart';

class AssignmentPageWidget extends StatefulWidget {
  const AssignmentPageWidget({
    super.key,
    required this.courseId,
    required this.courseName,
  });

  final String? courseId;
  final String? courseName;

  static String routeName = 'AssignmentPage';
  static String routePath = '/assignmentPage';

  @override
  State<AssignmentPageWidget> createState() => _AssignmentPageWidgetState();
}

class _AssignmentPageWidgetState extends State<AssignmentPageWidget> {
  late AssignmentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignmentPageModel());

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
                          title: 'Your assignment',
                          backIcon: false,
                          addIcon: false,
                          onTapAdd: () async {},
                          onTapBack: () async {},
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future:
                              EducationAPIsGroup.getAssignmentScoreCall.call(
                            courseId: widget.courseId,
                            token: FFAppState().token,
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
                            final containerGetAssignmentScoreResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(EducationAPIsGroup
                                              .getAssignmentApiCall
                                              .call(
                                            courseId: widget.courseId,
                                            token: FFAppState().token,
                                          )))
                                    .future,
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  final containerGetAssignmentApiResponse =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (EducationAPIsGroup
                                                .getAssignmentApiCall
                                                .success(
                                              containerGetAssignmentApiResponse
                                                  .jsonBody,
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
                                                    final assignmentsList =
                                                        EducationAPIsGroup
                                                                .getAssignmentApiCall
                                                                .assignmentsList(
                                                                  containerGetAssignmentApiResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    if (assignmentsList
                                                        .isEmpty) {
                                                      return Center(
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          child:
                                                              NoAssignmentComponantWidget(),
                                                        ),
                                                      );
                                                    }

                                                    return RefreshIndicator(
                                                      key: Key(
                                                          'RefreshIndicator_3wjq0eqc'),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      onRefresh: () async {
                                                        safeSetState(() => _model
                                                                .apiRequestCompleter =
                                                            null);
                                                        await _model
                                                            .waitForApiRequestCompleted();
                                                      },
                                                      child: ListView.separated(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                          0,
                                                          16.0,
                                                          0,
                                                          16.0,
                                                        ),
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            assignmentsList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            assignmentsListIndex) {
                                                          final assignmentsListItem =
                                                              assignmentsList[
                                                                  assignmentsListIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
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
                                                              onTap: () async {
                                                                _model.getResultFunction =
                                                                    await EducationAPIsGroup
                                                                        .getResultApiCall
                                                                        .call(
                                                                  courseId: widget
                                                                      .courseId,
                                                                  assignmentId:
                                                                      getJsonField(
                                                                    assignmentsListItem,
                                                                    r'''$._id''',
                                                                  ).toString(),
                                                                  token:
                                                                      FFAppState()
                                                                          .token,
                                                                );

                                                                if (EducationAPIsGroup
                                                                        .getResultApiCall
                                                                        .success(
                                                                      (_model.getResultFunction
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) {
                                                                  if (functions.stringToInt(EducationAPIsGroup
                                                                          .getResultApiCall
                                                                          .percentage(
                                                                        (_model.getResultFunction?.jsonBody ??
                                                                            ''),
                                                                      )!) >=
                                                                      60) {
                                                                    context
                                                                        .pushNamed(
                                                                      QuizResultPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'assignmentsId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$._id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'assignmentsName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$.assignment''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'courseId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$.courseId''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );
                                                                  } else {
                                                                    context
                                                                        .pushNamed(
                                                                      QuizPageWidget
                                                                          .routeName,
                                                                      queryParameters:
                                                                          {
                                                                        'assignmentsId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$._id''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'assignmentsName':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$.assignment''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'courseId':
                                                                            serializeParam(
                                                                          getJsonField(
                                                                            assignmentsListItem,
                                                                            r'''$.courseId''',
                                                                          ).toString(),
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                        'courseName':
                                                                            serializeParam(
                                                                          widget
                                                                              .courseName,
                                                                          ParamType
                                                                              .String,
                                                                        ),
                                                                      }.withoutNulls,
                                                                    );

                                                                    FFAppState()
                                                                        .ansList = [];
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                  }
                                                                } else {
                                                                  context
                                                                      .pushNamed(
                                                                    QuizPageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'assignmentsId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          assignmentsListItem,
                                                                          r'''$._id''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'assignmentsName':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          assignmentsListItem,
                                                                          r'''$.assignment''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'courseId':
                                                                          serializeParam(
                                                                        getJsonField(
                                                                          assignmentsListItem,
                                                                          r'''$.courseId''',
                                                                        ).toString(),
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                      'courseName':
                                                                          serializeParam(
                                                                        widget
                                                                            .courseName,
                                                                        ParamType
                                                                            .String,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );

                                                                  FFAppState()
                                                                      .ansList = [];
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              12.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            48.0,
                                                                        height:
                                                                            48.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          (assignmentsListIndex + 1)
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
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
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              9.0,
                                                                              0.0,
                                                                              9.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                getJsonField(
                                                                                  assignmentsListItem,
                                                                                  r'''$.assignment''',
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
                                                                              Text(
                                                                                '${getJsonField(
                                                                                  assignmentsListItem,
                                                                                  r'''$.totalQuestions''',
                                                                                ).toString()} Questions',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).davysGrey,
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
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/right_arrow_primary.svg',
                                                                          width:
                                                                              26.0,
                                                                          height:
                                                                              26.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
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
                                              if (EducationAPIsGroup
                                                      .getAssignmentScoreCall
                                                      .score(
                                                    containerGetAssignmentScoreResponse
                                                        .jsonBody,
                                                  )! >=
                                                  60)
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                30.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        _model.getAssignmentScore =
                                                            await EducationAPIsGroup
                                                                .getAssignmentScoreCall
                                                                .call(
                                                          courseId:
                                                              widget.courseId,
                                                          token: FFAppState()
                                                              .token,
                                                        );

                                                        if (EducationAPIsGroup
                                                                .getAssignmentScoreCall
                                                                .score(
                                                              (_model.getAssignmentScore
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )! >=
                                                            60) {
                                                          context.pushNamed(
                                                            CertificationsPageWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'courseId':
                                                                  serializeParam(
                                                                widget
                                                                    .courseId,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else {
                                                          await actions
                                                              .showCustomToastBottom(
                                                            EducationAPIsGroup
                                                                .getAssignmentScoreCall
                                                                .message(
                                                              (_model.getAssignmentScore
                                                                      ?.jsonBody ??
                                                                  ''),
                                                            )!,
                                                          );
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Certificate',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 56.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              valueOrDefault<String>(
                                                EducationAPIsGroup
                                                    .getAssignmentApiCall
                                                    .message(
                                                  containerGetAssignmentApiResponse
                                                      .jsonBody,
                                                ),
                                                'Message',
                                              ),
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        fontSize: 18.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
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
