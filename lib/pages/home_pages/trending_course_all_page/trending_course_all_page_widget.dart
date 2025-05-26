import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_trending_course/no_trending_course_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'trending_course_all_page_model.dart';
export 'trending_course_all_page_model.dart';

class TrendingCourseAllPageWidget extends StatefulWidget {
  const TrendingCourseAllPageWidget({super.key});

  static String routeName = 'TrendingCourseAllPage';
  static String routePath = '/trendingCourseAllPage';

  @override
  State<TrendingCourseAllPageWidget> createState() =>
      _TrendingCourseAllPageWidgetState();
}

class _TrendingCourseAllPageWidgetState
    extends State<TrendingCourseAllPageWidget> {
  late TrendingCourseAllPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrendingCourseAllPageModel());

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
                    title: 'Trending Course',
                    backIcon: false,
                    addIcon: false,
                    onTapAdd: () async {},
                    onTapBack: () async {},
                  ),
                ),
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState().currencyCache(
                      uniqueQueryKey: FFAppState().userId,
                      requestFn: () => EducationAPIsGroup.currencyApiCall.call(
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
                              child: Builder(
                                builder: (context) {
                                  if (FFAppState().connected) {
                                    return FutureBuilder<ApiCallResponse>(
                                      future: FFAppState()
                                          .trendingCourseCache(
                                        uniqueQueryKey: FFAppState().userId,
                                        requestFn: () => EducationAPIsGroup
                                            .trendingcourseApiCall
                                            .call(),
                                      )
                                          .then((result) {
                                        try {
                                          _model.apiRequestCompleted = true;
                                          _model.apiRequestLastUniqueKey =
                                              FFAppState().userId;
                                        } finally {}
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
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        final containerTrendingcourseApiResponse =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (EducationAPIsGroup
                                                      .trendingcourseApiCall
                                                      .success(
                                                    containerTrendingcourseApiResponse
                                                        .jsonBody,
                                                  ) ==
                                                  1) {
                                                return Builder(
                                                  builder: (context) {
                                                    final trendingCoursesList =
                                                        EducationAPIsGroup
                                                                .trendingcourseApiCall
                                                                .trendingCoursesList(
                                                                  containerTrendingcourseApiResponse
                                                                      .jsonBody,
                                                                )
                                                                ?.toList() ??
                                                            [];
                                                    if (trendingCoursesList
                                                        .isEmpty) {
                                                      return Center(
                                                        child:
                                                            NoTrendingCourseWidget(),
                                                      );
                                                    }

                                                    return RefreshIndicator(
                                                      key: Key(
                                                          'RefreshIndicator_re5bzr4h'),
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      onRefresh: () async {
                                                        safeSetState(() {
                                                          FFAppState()
                                                              .clearTrendingCourseCacheCacheKey(
                                                                  _model
                                                                      .apiRequestLastUniqueKey);
                                                          _model.apiRequestCompleted =
                                                              false;
                                                        });
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
                                                            trendingCoursesList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                height: 16.0),
                                                        itemBuilder: (context,
                                                            trendingCoursesListIndex) {
                                                          final trendingCoursesListItem =
                                                              trendingCoursesList[
                                                                  trendingCoursesListIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                            child:
                                                                MainContainerComponantWidget(
                                                              key: Key(
                                                                  'Key16m_${trendingCoursesListIndex}_of_${trendingCoursesList.length}'),
                                                              image:
                                                                  '${FFAppConstants.imageUrl}${getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.avatar''',
                                                              ).toString()}',
                                                              avgReviewRating:
                                                                  getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.averageRating''',
                                                              ).toDouble(),
                                                              duration:
                                                                  getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.duration''',
                                                              ).toString(),
                                                              course:
                                                                  getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.course''',
                                                              ).toString(),
                                                              price:
                                                                  getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.price''',
                                                              ).toDouble(),
                                                              avgReviewRatingShor:
                                                                  '0' !=
                                                                      getJsonField(
                                                                        trendingCoursesListItem,
                                                                        r'''$.averageRating''',
                                                                      ).toString(),
                                                              currency:
                                                                  EducationAPIsGroup
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
                                                                        trendingCoursesListItem,
                                                                        r'''$._id''',
                                                                      ).toString()) ==
                                                                  true,
                                                              instructorIdList:
                                                                  getJsonField(
                                                                trendingCoursesListItem,
                                                                r'''$.instructorId''',
                                                                true,
                                                              )!,
                                                              onTap: () async {
                                                                context
                                                                    .pushNamed(
                                                                  CoursesDetailPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'id':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        trendingCoursesListItem,
                                                                        r'''$._id''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'courseName':
                                                                        serializeParam(
                                                                      getJsonField(
                                                                        trendingCoursesListItem,
                                                                        r'''$.course''',
                                                                      ).toString(),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'currencySymbol':
                                                                        serializeParam(
                                                                      EducationAPIsGroup
                                                                          .currencyApiCall
                                                                          .currency(
                                                                        containerCurrencyApiResponse
                                                                            .jsonBody,
                                                                      ),
                                                                      ParamType
                                                                          .String,
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
                                                                            trendingCoursesListItem,
                                                                            r'''$._id''',
                                                                          ).toString()) ==
                                                                      true) {
                                                                    _model.getAllTrendingCourseDetete =
                                                                        await EducationAPIsGroup
                                                                            .unfavouriteApiCall
                                                                            .call(
                                                                      token: FFAppState()
                                                                          .token,
                                                                      courseId:
                                                                          getJsonField(
                                                                        trendingCoursesListItem,
                                                                        r'''$._id''',
                                                                      ).toString(),
                                                                    );

                                                                    await actions
                                                                        .showCustomToastBottom(
                                                                      FFAppState()
                                                                          .unfavText,
                                                                    );
                                                                  } else {
                                                                    _model.getAllTrendingCourseAdd =
                                                                        await EducationAPIsGroup
                                                                            .favouriteApiCall
                                                                            .call(
                                                                      userId: FFAppState()
                                                                          .userId,
                                                                      courseId:
                                                                          getJsonField(
                                                                        trendingCoursesListItem,
                                                                        r'''$._id''',
                                                                      ).toString(),
                                                                      token: FFAppState()
                                                                          .token,
                                                                    );

                                                                    await actions
                                                                        .showCustomToastBottom(
                                                                      FFAppState()
                                                                          .favText,
                                                                    );
                                                                  }

                                                                  FFAppState()
                                                                      .clearGetFavouriteCacheCache();
                                                                } else {
                                                                  context.pushNamed(
                                                                      SigninPageWidget
                                                                          .routeName);
                                                                }

                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                return Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 0.0),
                                                  child: Text(
                                                    FFAppConstants.unAuthText,
                                                    textAlign: TextAlign.center,
                                                    style: FlutterFlowTheme.of(
                                                            context)
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
