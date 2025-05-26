import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_trending_course/no_trending_course_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'instructor_profile_page_model.dart';
export 'instructor_profile_page_model.dart';

class InstructorProfilePageWidget extends StatefulWidget {
  const InstructorProfilePageWidget({
    super.key,
    required this.image,
    required this.name,
    required this.degree,
    required this.instructorId,
  });

  final String? image;
  final String? name;
  final String? degree;
  final String? instructorId;

  static String routeName = 'InstructorProfilePage';
  static String routePath = '/instructorProfilePage';

  @override
  State<InstructorProfilePageWidget> createState() =>
      _InstructorProfilePageWidgetState();
}

class _InstructorProfilePageWidgetState
    extends State<InstructorProfilePageWidget> {
  late InstructorProfilePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InstructorProfilePageModel());

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
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                wrapWithModel(
                  model: _model.customCenterAppbarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: CustomCenterAppbarWidget(
                    title: 'Instructor profile',
                    backIcon: false,
                    addIcon: false,
                    onTapAdd: () async {},
                    onTapBack: () async {},
                  ),
                ),
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: (_model.apiRequestCompleter2 ??= Completer<
                            ApiCallResponse>()
                          ..complete(EducationAPIsGroup.currencyApiCall.call()))
                        .future,
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
                      final containerCurrencyApiResponse = snapshot.data!;

                      return Container(
                        decoration: BoxDecoration(),
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().getFavouriteCache(
                            uniqueQueryKey: FFAppState().userId,
                            requestFn: () =>
                                EducationAPIsGroup.getfavouriteApiCall.call(
                              token: FFAppState().token,
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
                            final containerGetfavouriteApiResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: FutureBuilder<ApiCallResponse>(
                                future: (_model.apiRequestCompleter1 ??=
                                        Completer<ApiCallResponse>()
                                          ..complete(EducationAPIsGroup
                                              .instructorCourseCall
                                              .call(
                                            instructorId: widget.instructorId,
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
                                  final containerInstructorCourseResponse =
                                      snapshot.data!;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (EducationAPIsGroup
                                                .instructorCourseCall
                                                .success(
                                              containerInstructorCourseResponse
                                                  .jsonBody,
                                            ) ==
                                            1) {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: RefreshIndicator(
                                              key: Key(
                                                  'RefreshIndicator_iuocic9c'),
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              onRefresh: () async {
                                                safeSetState(() => _model
                                                        .apiRequestCompleter1 =
                                                    null);
                                                await _model
                                                    .waitForApiRequestCompleted1();
                                              },
                                              child: ListView(
                                                padding: EdgeInsets.fromLTRB(
                                                  0,
                                                  16.0,
                                                  0,
                                                  16.0,
                                                ),
                                                scrollDirection: Axis.vertical,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: CachedNetworkImage(
                                                        fadeInDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        fadeOutDuration:
                                                            Duration(
                                                                milliseconds:
                                                                    200),
                                                        imageUrl:
                                                            widget.image!,
                                                        width: 124.0,
                                                        height: 124.0,
                                                        fit: BoxFit.cover,
                                                        alignment: Alignment(
                                                            0.0, -1.0),
                                                        errorWidget: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Image.asset(
                                                          'assets/images/error_image.jpg',
                                                          width: 124.0,
                                                          height: 124.0,
                                                          fit: BoxFit.cover,
                                                          alignment: Alignment(
                                                              0.0, -1.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 16.0,
                                                                0.0, 4.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.name,
                                                        'Name',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            useGoogleFonts:
                                                                false,
                                                            lineHeight: 1.5,
                                                          ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 24.0),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        widget.degree,
                                                        'Degree',
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .davysGrey,
                                                                fontSize: 17.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                    ),
                                                  ),
                                                  if (EducationAPIsGroup
                                                          .instructorCourseCall
                                                          .success(
                                                        containerInstructorCourseResponse
                                                            .jsonBody,
                                                      ) ==
                                                      1)
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Course',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 20.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                        Builder(
                                                          builder: (context) {
                                                            final instructorRelatedList =
                                                                EducationAPIsGroup
                                                                        .instructorCourseCall
                                                                        .coursedetailsList(
                                                                          containerInstructorCourseResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList() ??
                                                                    [];
                                                            if (instructorRelatedList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    NoTrendingCourseWidget(),
                                                              );
                                                            }

                                                            return RefreshIndicator(
                                                              key: Key(
                                                                  'RefreshIndicator_m4adn25n'),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              onRefresh:
                                                                  () async {
                                                                safeSetState(() =>
                                                                    _model.apiRequestCompleter2 =
                                                                        null);
                                                                await _model
                                                                    .waitForApiRequestCompleted2();
                                                              },
                                                              child: ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  16.0,
                                                                  0,
                                                                  16.0,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    instructorRelatedList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        instructorRelatedListIndex) {
                                                                  final instructorRelatedListItem =
                                                                      instructorRelatedList[
                                                                          instructorRelatedListIndex];
                                                                  return MainContainerComponantWidget(
                                                                    key: Key(
                                                                        'Keycw3_${instructorRelatedListIndex}_of_${instructorRelatedList.length}'),
                                                                    image:
                                                                        '${FFAppConstants.imageUrl}${getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.avatar''',
                                                                    ).toString()}',
                                                                    avgReviewRating:
                                                                        getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.averageRating''',
                                                                    ).toDouble(),
                                                                    duration:
                                                                        getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.duration''',
                                                                    ).toString(),
                                                                    course:
                                                                        getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.course''',
                                                                    ).toString(),
                                                                    price:
                                                                        getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.price''',
                                                                    ).toDouble(),
                                                                    avgReviewRatingShor: '0' !=
                                                                        getJsonField(
                                                                          instructorRelatedListItem,
                                                                          r'''$.avgReviewRating''',
                                                                        ).toString(),
                                                                    currency: EducationAPIsGroup
                                                                        .currencyApiCall
                                                                        .currency(
                                                                      containerCurrencyApiResponse
                                                                          .jsonBody,
                                                                    )!,
                                                                    favCondition: functions.checkFavOrNot(
                                                                            EducationAPIsGroup.getfavouriteApiCall
                                                                                .favoriteList(
                                                                                  containerGetfavouriteApiResponse.jsonBody,
                                                                                )
                                                                                ?.toList(),
                                                                            getJsonField(
                                                                              instructorRelatedListItem,
                                                                              r'''$._id''',
                                                                            ).toString()) ==
                                                                        true,
                                                                    instructorIdList:
                                                                        getJsonField(
                                                                      instructorRelatedListItem,
                                                                      r'''$.instructorId''',
                                                                      true,
                                                                    )!,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        CoursesDetailPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'id':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              instructorRelatedListItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'courseName':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              instructorRelatedListItem,
                                                                              r'''$.course''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'currencySymbol':
                                                                              serializeParam(
                                                                            EducationAPIsGroup.currencyApiCall.currency(
                                                                              containerCurrencyApiResponse.jsonBody,
                                                                            ),
                                                                            ParamType.String,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    onTapFav:
                                                                        () async {
                                                                      if (FFAppState()
                                                                              .isLogin ==
                                                                          true) {
                                                                        if (functions.checkFavOrNot(
                                                                                EducationAPIsGroup.getfavouriteApiCall
                                                                                    .favoriteList(
                                                                                      containerGetfavouriteApiResponse.jsonBody,
                                                                                    )
                                                                                    ?.toList(),
                                                                                getJsonField(
                                                                                  instructorRelatedListItem,
                                                                                  r'''$._id''',
                                                                                ).toString()) ==
                                                                            true) {
                                                                          _model.getAllTrendingCourseDetete = await EducationAPIsGroup
                                                                              .unfavouriteApiCall
                                                                              .call(
                                                                            token:
                                                                                FFAppState().token,
                                                                            courseId:
                                                                                getJsonField(
                                                                              instructorRelatedListItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                          );

                                                                          await actions
                                                                              .showCustomToastBottom(
                                                                            FFAppState().unfavText,
                                                                          );
                                                                        } else {
                                                                          _model.getAllTrendingCourseAdd = await EducationAPIsGroup
                                                                              .favouriteApiCall
                                                                              .call(
                                                                            userId:
                                                                                FFAppState().userId,
                                                                            courseId:
                                                                                getJsonField(
                                                                              instructorRelatedListItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            token:
                                                                                FFAppState().token,
                                                                          );

                                                                          await actions
                                                                              .showCustomToastBottom(
                                                                            FFAppState().favText,
                                                                          );
                                                                        }

                                                                        FFAppState()
                                                                            .clearGetFavouriteCacheCache();
                                                                      } else {
                                                                        context.pushNamed(
                                                                            SigninPageWidget.routeName);
                                                                      }

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Align(
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
                                            child: Text(
                                              FFAppConstants.unAuthText,
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
                      );
                    },
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
