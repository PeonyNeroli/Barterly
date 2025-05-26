import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/no_complete_course/no_complete_course_widget.dart';
import '/pages/componant/no_ongoing_course/no_ongoing_course_widget.dart';
import '/pages/componant/single_appbar/single_appbar_widget.dart';
import '/pages/shimmers/my_course_componant_shimmer/my_course_componant_shimmer_widget.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'trending_course_componant_model.dart';
export 'trending_course_componant_model.dart';

class TrendingCourseComponantWidget extends StatefulWidget {
  const TrendingCourseComponantWidget({super.key});

  @override
  State<TrendingCourseComponantWidget> createState() =>
      _TrendingCourseComponantWidgetState();
}

class _TrendingCourseComponantWidgetState
    extends State<TrendingCourseComponantWidget> {
  late TrendingCourseComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrendingCourseComponantModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
                  model: _model.singleAppbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: SingleAppbarWidget(
                    title: 'My Course',
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 20.0, 8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 7.0, 8.0, 7.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.tabIndex = 0;
                                safeSetState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.tabIndex == 0
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.tabIndex == 0) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 7.0),
                                        child: Text(
                                          'Ongoing',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 8.0, 0.0, 7.0),
                                        child: Text(
                                          'Ongoing',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .davysGrey,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.tabIndex = 1;
                                safeSetState(() {});
                                FFAppState().clearCompletedCourseCacheCache();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _model.tabIndex == 1
                                      ? FlutterFlowTheme.of(context).secondary
                                      : Color(0x00000000),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.tabIndex == 1) {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 6.0),
                                        child: Text(
                                          'Completed',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      );
                                    } else {
                                      return Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 7.0, 0.0, 6.0),
                                        child: Text(
                                          'Completed',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .davysGrey,
                                                fontSize: 17.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: false,
                                                lineHeight: 1.2,
                                              ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ].divide(SizedBox(width: 8.0)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (_model.tabIndex == 0) {
                        return FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .onGoingCache(
                            requestFn: () =>
                                EducationAPIsGroup.mycourselistApiCall.call(
                              token: FFAppState().token,
                            ),
                          )
                              .then((result) {
                            _model.apiRequestCompleted2 = true;
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
                            final containerMycourselistApiResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final mycourseList =
                                        EducationAPIsGroup.mycourselistApiCall
                                                .mycourseList(
                                                  containerMycourselistApiResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (mycourseList.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          child: NoOngoingCourseWidget(),
                                        ),
                                      );
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_0qyxitqk'),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      onRefresh: () async {
                                        safeSetState(() {
                                          FFAppState().clearOnGoingCacheCache();
                                          _model.apiRequestCompleted2 = false;
                                        });
                                        await _model
                                            .waitForApiRequestCompleted2();
                                      },
                                      child: ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          8.0,
                                          0,
                                          16.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: mycourseList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder:
                                            (context, mycourseListIndex) {
                                          final mycourseListItem =
                                              mycourseList[mycourseListIndex];
                                          return Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    mycourseListItem,
                                                    r'''$.course.course''',
                                                  ) !=
                                                  null) {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      MyCoursesDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'courseId':
                                                            serializeParam(
                                                          getJsonField(
                                                            mycourseListItem,
                                                            r'''$.course._id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'name': serializeParam(
                                                          getJsonField(
                                                            mycourseListItem,
                                                            r'''$.course.course''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    FFAppState()
                                                        .clearMyCourseDetailCacheCache();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  7.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              imageUrl:
                                                                  '${FFAppConstants.imageUrl}${getJsonField(
                                                                mycourseListItem,
                                                                r'''$.course.avatar''',
                                                              ).toString()}',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment(0.0,
                                                                      -1.0),
                                                              errorWidget: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        -1.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      getJsonField(
                                                                        mycourseListItem,
                                                                        r'''$.course.course''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          2,
                                                                      minFontSize:
                                                                          16.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        mycourseListItem,
                                                                        r'''$.course.duration''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              LinearPercentIndicator(
                                                                            percent: double.parse(getJsonField(
                                                                                  mycourseListItem,
                                                                                  r'''$.completedPercentage''',
                                                                                ).toString()) /
                                                                                100,
                                                                            lineHeight:
                                                                                12.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).gainsboro,
                                                                            barRadius:
                                                                                Radius.circular(22.0),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '${getJsonField(
                                                                          mycourseListItem,
                                                                          r'''$.completedPercentage''',
                                                                        ).toString()}%',
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
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
                                                );
                                              } else {
                                                return Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  decoration: BoxDecoration(),
                                                  child:
                                                      MyCourseComponantShimmerWidget(
                                                    key: Key(
                                                        'Key0mk_${mycourseListIndex}_of_${mycourseList.length}'),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .completedCourseCache(
                            requestFn: () =>
                                EducationAPIsGroup.completedcourseApiCall.call(
                              token: FFAppState().token,
                            ),
                          )
                              .then((result) {
                            _model.apiRequestCompleted1 = true;
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
                            final containerCompletedcourseApiResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20.0, 0.0, 20.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    final myCompleteCourseList =
                                        EducationAPIsGroup
                                                .completedcourseApiCall
                                                .mycourseList(
                                                  containerCompletedcourseApiResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (myCompleteCourseList.isEmpty) {
                                      return Center(
                                        child: NoCompleteCourseWidget(),
                                      );
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_hhtowzk8'),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      onRefresh: () async {
                                        safeSetState(() {
                                          FFAppState()
                                              .clearCompletedCourseCacheCache();
                                          _model.apiRequestCompleted1 = false;
                                        });
                                        await _model
                                            .waitForApiRequestCompleted1();
                                      },
                                      child: ListView.separated(
                                        padding: EdgeInsets.fromLTRB(
                                          0,
                                          8.0,
                                          0,
                                          16.0,
                                        ),
                                        scrollDirection: Axis.vertical,
                                        itemCount: myCompleteCourseList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder: (context,
                                            myCompleteCourseListIndex) {
                                          final myCompleteCourseListItem =
                                              myCompleteCourseList[
                                                  myCompleteCourseListIndex];
                                          return Builder(
                                            builder: (context) {
                                              if (getJsonField(
                                                    myCompleteCourseListItem,
                                                    r'''$.courseId.course''',
                                                  ) !=
                                                  null) {
                                                return InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      MyCompleteCoursesDetailPageWidget
                                                          .routeName,
                                                      queryParameters: {
                                                        'courseId':
                                                            serializeParam(
                                                          getJsonField(
                                                            myCompleteCourseListItem,
                                                            r'''$.courseId._id''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                        'courseName':
                                                            serializeParam(
                                                          getJsonField(
                                                            myCompleteCourseListItem,
                                                            r'''$.courseId.course''',
                                                          ).toString(),
                                                          ParamType.String,
                                                        ),
                                                      }.withoutNulls,
                                                    );

                                                    FFAppState()
                                                        .clearMyCourseDetailCacheCache();
                                                  },
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  12.0,
                                                                  7.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              fadeInDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              fadeOutDuration:
                                                                  Duration(
                                                                      milliseconds:
                                                                          200),
                                                              imageUrl:
                                                                  '${FFAppConstants.imageUrl}${getJsonField(
                                                                myCompleteCourseListItem,
                                                                r'''$.courseId.avatar''',
                                                              ).toString()}',
                                                              width: 100.0,
                                                              height: 100.0,
                                                              fit: BoxFit.cover,
                                                              alignment:
                                                                  Alignment(0.0,
                                                                      -1.0),
                                                              errorWidget: (context,
                                                                      error,
                                                                      stackTrace) =>
                                                                  Image.asset(
                                                                'assets/images/error_image.jpg',
                                                                width: 100.0,
                                                                height: 100.0,
                                                                fit: BoxFit
                                                                    .cover,
                                                                alignment:
                                                                    Alignment(
                                                                        0.0,
                                                                        -1.0),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          10.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            4.0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      getJsonField(
                                                                        myCompleteCourseListItem,
                                                                        r'''$.courseId.course''',
                                                                      ).toString(),
                                                                      maxLines:
                                                                          2,
                                                                      minFontSize:
                                                                          16.0,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                20.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            12.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        myCompleteCourseListItem,
                                                                        r'''$.courseId.duration''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                            lineHeight:
                                                                                1.5,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              LinearPercentIndicator(
                                                                            percent:
                                                                                1.0,
                                                                            lineHeight:
                                                                                12.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            backgroundColor:
                                                                                FlutterFlowTheme.of(context).gainsboro,
                                                                            barRadius:
                                                                                Radius.circular(22.0),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        '100%',
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 14.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
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
                                                );
                                              } else {
                                                return Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  child:
                                                      MyCourseComponantShimmerWidget(
                                                    key: Key(
                                                        'Keyhfg_${myCompleteCourseListIndex}_of_${myCompleteCourseList.length}'),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      }
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
    );
  }
}
