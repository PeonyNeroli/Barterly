import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_fav_componant/no_fav_componant_widget.dart';
import '/pages/componant/single_appbar/single_appbar_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'favourite_componant_model.dart';
export 'favourite_componant_model.dart';

class FavouriteComponantWidget extends StatefulWidget {
  const FavouriteComponantWidget({super.key});

  @override
  State<FavouriteComponantWidget> createState() =>
      _FavouriteComponantWidgetState();
}

class _FavouriteComponantWidgetState extends State<FavouriteComponantWidget> {
  late FavouriteComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavouriteComponantModel());

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
                    title: 'Favourite Course',
                  ),
                ),
                Expanded(
                  child: FutureBuilder<ApiCallResponse>(
                    future: FFAppState().currencyCache(
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
                        child: Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FFAppState()
                                .getFavouriteCache(
                              uniqueQueryKey: FFAppState().userId,
                              requestFn: () =>
                                  EducationAPIsGroup.getfavouriteApiCall.call(
                                token: FFAppState().token,
                              ),
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
                                    final favList =
                                        EducationAPIsGroup.getfavouriteApiCall
                                                .favoriteList(
                                                  containerGetfavouriteApiResponse
                                                      .jsonBody,
                                                )
                                                ?.toList() ??
                                            [];
                                    if (favList.isEmpty) {
                                      return Center(
                                        child: Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: NoFavComponantWidget(),
                                        ),
                                      );
                                    }

                                    return RefreshIndicator(
                                      key: Key('RefreshIndicator_b8nc2x7i'),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      onRefresh: () async {
                                        safeSetState(() {
                                          FFAppState()
                                              .clearGetFavouriteCacheCacheKey(
                                                  _model
                                                      .apiRequestLastUniqueKey);
                                          _model.apiRequestCompleted = false;
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
                                        scrollDirection: Axis.vertical,
                                        itemCount: favList.length,
                                        separatorBuilder: (_, __) =>
                                            SizedBox(height: 16.0),
                                        itemBuilder: (context, favListIndex) {
                                          final favListItem =
                                              favList[favListIndex];
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 0.0, 20.0, 0.0),
                                            child: MainContainerComponantWidget(
                                              key: Key(
                                                  'Key4vi_${favListIndex}_of_${favList.length}'),
                                              image:
                                                  '${FFAppConstants.imageUrl}${getJsonField(
                                                favListItem,
                                                r'''$.avatar''',
                                              ).toString()}',
                                              avgReviewRating: getJsonField(
                                                favListItem,
                                                r'''$.averageRating''',
                                              ).toDouble(),
                                              duration: getJsonField(
                                                favListItem,
                                                r'''$.duration''',
                                              ).toString(),
                                              course: getJsonField(
                                                favListItem,
                                                r'''$.course''',
                                              ).toString(),
                                              price: getJsonField(
                                                favListItem,
                                                r'''$.price''',
                                              ).toDouble(),
                                              avgReviewRatingShor: '0' !=
                                                  getJsonField(
                                                    favListItem,
                                                    r'''$.averageRating''',
                                                  ).toString(),
                                              currency: EducationAPIsGroup
                                                  .currencyApiCall
                                                  .currency(
                                                containerCurrencyApiResponse
                                                    .jsonBody,
                                              )!,
                                              favCondition: true,
                                              instructorIdList: getJsonField(
                                                favListItem,
                                                r'''$.instructorId''',
                                                true,
                                              )!,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CoursesDetailPageWidget
                                                      .routeName,
                                                  queryParameters: {
                                                    'id': serializeParam(
                                                      getJsonField(
                                                        favListItem,
                                                        r'''$._id''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'courseName':
                                                        serializeParam(
                                                      getJsonField(
                                                        favListItem,
                                                        r'''$.course''',
                                                      ).toString(),
                                                      ParamType.String,
                                                    ),
                                                    'currencySymbol':
                                                        serializeParam(
                                                      EducationAPIsGroup
                                                          .currencyApiCall
                                                          .currency(
                                                        containerCurrencyApiResponse
                                                            .jsonBody,
                                                      ),
                                                      ParamType.String,
                                                    ),
                                                  }.withoutNulls,
                                                );
                                              },
                                              onTapFav: () async {
                                                _model.getAllTrendingCourseDetete =
                                                    await EducationAPIsGroup
                                                        .unfavouriteApiCall
                                                        .call(
                                                  token: FFAppState().token,
                                                  courseId: getJsonField(
                                                    favListItem,
                                                    r'''$._id''',
                                                  ).toString(),
                                                );

                                                await actions
                                                    .showCustomToastBottom(
                                                  FFAppState().unfavText,
                                                );
                                                FFAppState()
                                                    .clearGetFavouriteCacheCache();

                                                safeSetState(() {});
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
    );
  }
}
