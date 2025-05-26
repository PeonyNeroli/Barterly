import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_recently_add_course/no_recently_add_course_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'recently_addcourse_page_model.dart';
export 'recently_addcourse_page_model.dart';

class RecentlyAddcoursePageWidget extends StatefulWidget {
  const RecentlyAddcoursePageWidget({super.key});

  static String routeName = 'RecentlyAddcoursePage';
  static String routePath = '/recentlyAddcoursePage';

  @override
  State<RecentlyAddcoursePageWidget> createState() =>
      _RecentlyAddcoursePageWidgetState();
}

class _RecentlyAddcoursePageWidgetState
    extends State<RecentlyAddcoursePageWidget> {
  late RecentlyAddcoursePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecentlyAddcoursePageModel());

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
          child: Builder(
            builder: (context) {
              if (FFAppState().connected) {
                return Container(
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
                            requestFn: () =>
                                EducationAPIsGroup.currencyApiCall.call(
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
                                  requestFn: () => EducationAPIsGroup
                                      .getfavouriteApiCall
                                      .call(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            FlutterFlowTheme.of(context)
                                                .primary,
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
                                                .recentlyAddCourseCache(
                                              uniqueQueryKey:
                                                  FFAppState().userId,
                                              requestFn: () =>
                                                  EducationAPIsGroup
                                                      .recentlyAddCourseApiCall
                                                      .call(
                                                token: FFAppState().token,
                                              ),
                                            )
                                                .then((result) {
                                              try {
                                                _model.apiRequestCompleted =
                                                    true;
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
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              final containerRecentlyAddCourseApiResponse =
                                                  snapshot.data!;

                                              return Container(
                                                decoration: BoxDecoration(),
                                                child: Builder(
                                                  builder: (context) {
                                                    if (EducationAPIsGroup
                                                            .recentlyAddCourseApiCall
                                                            .success(
                                                          containerRecentlyAddCourseApiResponse
                                                              .jsonBody,
                                                        ) ==
                                                        1) {
                                                      return Builder(
                                                        builder: (context) {
                                                          final recentlyAddCourseList =
                                                              EducationAPIsGroup
                                                                      .recentlyAddCourseApiCall
                                                                      .coursedetailsList(
                                                                        containerRecentlyAddCourseApiResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList() ??
                                                                  [];
                                                          if (recentlyAddCourseList
                                                              .isEmpty) {
                                                            return Center(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: double
                                                                    .infinity,
                                                                child:
                                                                    NoRecentlyAddCourseWidget(),
                                                              ),
                                                            );
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_fgtyfttd'),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            onRefresh:
                                                                () async {
                                                              safeSetState(() {
                                                                FFAppState()
                                                                    .clearRecentlyAddCourseCacheCacheKey(
                                                                        _model
                                                                            .apiRequestLastUniqueKey);
                                                                _model.apiRequestCompleted =
                                                                    false;
                                                              });
                                                              await _model
                                                                  .waitForApiRequestCompleted();
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
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  recentlyAddCourseList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          16.0),
                                                              itemBuilder: (context,
                                                                  recentlyAddCourseListIndex) {
                                                                final recentlyAddCourseListItem =
                                                                    recentlyAddCourseList[
                                                                        recentlyAddCourseListIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      MainContainerComponantWidget(
                                                                    key: Key(
                                                                        'Key43t_${recentlyAddCourseListIndex}_of_${recentlyAddCourseList.length}'),
                                                                    image:
                                                                        '${FFAppConstants.imageUrl}${getJsonField(
                                                                      recentlyAddCourseListItem,
                                                                      r'''$.avatar''',
                                                                    ).toString()}',
                                                                    avgReviewRating:
                                                                        getJsonField(
                                                                      recentlyAddCourseListItem,
                                                                      r'''$.averageRating''',
                                                                    ).toDouble(),
                                                                    duration:
                                                                        getJsonField(
                                                                      recentlyAddCourseListItem,
                                                                      r'''$.duration''',
                                                                    ).toString(),
                                                                    course:
                                                                        getJsonField(
                                                                      recentlyAddCourseListItem,
                                                                      r'''$.course''',
                                                                    ).toString(),
                                                                    price:
                                                                        getJsonField(
                                                                      recentlyAddCourseListItem,
                                                                      r'''$.price''',
                                                                    ).toDouble(),
                                                                    avgReviewRatingShor: '0' !=
                                                                        getJsonField(
                                                                          recentlyAddCourseListItem,
                                                                          r'''$.averageRating''',
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
                                                                              recentlyAddCourseListItem,
                                                                              r'''$._id''',
                                                                            ).toString()) ==
                                                                        true,
                                                                    instructorIdList:
                                                                        getJsonField(
                                                                      recentlyAddCourseListItem,
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
                                                                              recentlyAddCourseListItem,
                                                                              r'''$._id''',
                                                                            ).toString(),
                                                                            ParamType.String,
                                                                          ),
                                                                          'courseName':
                                                                              serializeParam(
                                                                            getJsonField(
                                                                              recentlyAddCourseListItem,
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
                                                                                  recentlyAddCourseListItem,
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
                                                                              recentlyAddCourseListItem,
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
                                                                              recentlyAddCourseListItem,
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
                                                          FFAppConstants
                                                              .unAuthText,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 18.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                useGoogleFonts:
                                                                    false,
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
                                            alignment:
                                                AlignmentDirectional(0.0, 0.0),
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
    );
  }
}
