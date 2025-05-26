import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'category_all_page_model.dart';
export 'category_all_page_model.dart';

class CategoryAllPageWidget extends StatefulWidget {
  const CategoryAllPageWidget({super.key});

  static String routeName = 'CategoryAllPage';
  static String routePath = '/categoryAllPage';

  @override
  State<CategoryAllPageWidget> createState() => _CategoryAllPageWidgetState();
}

class _CategoryAllPageWidgetState extends State<CategoryAllPageWidget> {
  late CategoryAllPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryAllPageModel());

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
                    title: 'Category',
                    backIcon: false,
                    addIcon: false,
                    onTapAdd: () async {},
                    onTapBack: () async {},
                  ),
                ),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      if (FFAppState().connected) {
                        return FutureBuilder<ApiCallResponse>(
                          future: FFAppState()
                              .categoryCache(
                            uniqueQueryKey: FFAppState().userId,
                            requestFn: () =>
                                EducationAPIsGroup.categoryApiCall.call(
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
                            final containerCategoryApiResponse = snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if (EducationAPIsGroup.categoryApiCall
                                          .success(
                                        containerCategoryApiResponse.jsonBody,
                                      ) ==
                                      1) {
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20.0, 0.0, 20.0, 0.0),
                                      child: RefreshIndicator(
                                        key: Key('RefreshIndicator_ht6z19hn'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          safeSetState(() {
                                            FFAppState()
                                                .clearCategoryCacheCacheKey(_model
                                                    .apiRequestLastUniqueKey);
                                            _model.apiRequestCompleted = false;
                                          });
                                          await _model
                                              .waitForApiRequestCompleted();
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
                                            Builder(
                                              builder: (context) {
                                                final categoryLists =
                                                    EducationAPIsGroup
                                                            .categoryApiCall
                                                            .categoryList(
                                                              containerCategoryApiResponse
                                                                  .jsonBody,
                                                            )
                                                            ?.toList() ??
                                                        [];

                                                return Wrap(
                                                  spacing: 16.0,
                                                  runSpacing: 16.0,
                                                  alignment:
                                                      WrapAlignment.start,
                                                  crossAxisAlignment:
                                                      WrapCrossAlignment.start,
                                                  direction: Axis.horizontal,
                                                  runAlignment:
                                                      WrapAlignment.start,
                                                  verticalDirection:
                                                      VerticalDirection.down,
                                                  clipBehavior: Clip.none,
                                                  children: List.generate(
                                                      categoryLists.length,
                                                      (categoryListsIndex) {
                                                    final categoryListsItem =
                                                        categoryLists[
                                                            categoryListsIndex];
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
                                                          CategoryListPageWidget
                                                              .routeName,
                                                          queryParameters: {
                                                            'categoryId':
                                                                serializeParam(
                                                              getJsonField(
                                                                categoryListsItem,
                                                                r'''$._id''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                            'category':
                                                                serializeParam(
                                                              getJsonField(
                                                                categoryListsItem,
                                                                r'''$.category''',
                                                              ).toString(),
                                                              ParamType.String,
                                                            ),
                                                          }.withoutNulls,
                                                        );
                                                      },
                                                      child: Container(
                                                        width: () {
                                                          if (MediaQuery.sizeOf(
                                                                      context)
                                                                  .width <
                                                              810.0) {
                                                            return ((MediaQuery.sizeOf(
                                                                            context)
                                                                        .width -
                                                                    56) *
                                                                1 /
                                                                2);
                                                          } else if ((MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width >=
                                                                  810.0) &&
                                                              (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  1280.0)) {
                                                            return ((MediaQuery.sizeOf(
                                                                            context)
                                                                        .width -
                                                                    88) *
                                                                1 /
                                                                4);
                                                          } else if (MediaQuery
                                                                      .sizeOf(
                                                                          context)
                                                                  .width >=
                                                              1280.0) {
                                                            return ((MediaQuery.sizeOf(
                                                                            context)
                                                                        .width -
                                                                    120) *
                                                                1 /
                                                                6);
                                                          } else {
                                                            return ((MediaQuery.sizeOf(
                                                                            context)
                                                                        .width -
                                                                    152) *
                                                                1 /
                                                                8);
                                                          }
                                                        }(),
                                                        height: 179.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
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
                                                                    categoryListsItem,
                                                                    r'''$.avatar''',
                                                                  ).toString()}',
                                                                  width: 48.0,
                                                                  height: 48.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                ),
                                                              ),
                                                              Text(
                                                                getJsonField(
                                                                  categoryListsItem,
                                                                  r'''$.category''',
                                                                ).toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      fontSize:
                                                                          17.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(height: 16.0)),
                                        ),
                                      ),
                                    );
                                  } else {
                                    return Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Text(
                                        FFAppConstants.unAuthText,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
