import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/filter_bottom_sheet/filter_bottom_sheet_widget.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_filter_course/no_filter_course_widget.dart';
import '/pages/componant/no_search_course/no_search_course_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'search_page_model.dart';
export 'search_page_model.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  static String routeName = 'SearchPage';
  static String routePath = '/searchPage';

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  late SearchPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SearchPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
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
                    title: 'Search',
                    backIcon: false,
                    addIcon: false,
                    onTapAdd: () async {},
                    onTapBack: () async {},
                  ),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 20.0, 16.0, 12.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).gainsboro,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            13.0, 0.0, 13.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(0.0),
                              child: SvgPicture.asset(
                                'assets/images/search.svg',
                                width: 24.0,
                                height: 24.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: _model.textController,
                                focusNode: _model.textFieldFocusNode,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 300),
                                  () async {
                                    safeSetState(() {});
                                  },
                                ),
                                onFieldSubmitted: (_) async {
                                  _model.isLoading = true;
                                  safeSetState(() {});
                                  _model.searchApi = await EducationAPIsGroup
                                      .searchCourseApiCall
                                      .call(
                                    search: _model.textController.text,
                                  );

                                  _model.isLoading = false;
                                  safeSetState(() {});

                                  safeSetState(() {});
                                },
                                autofocus: false,
                                textInputAction: TextInputAction.search,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .spanishGray,
                                        fontSize: 17.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.normal,
                                        useGoogleFonts: false,
                                      ),
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  focusedErrorBorder: InputBorder.none,
                                  contentPadding:
                                      EdgeInsetsDirectional.fromSTEB(
                                          16.0, 13.0, 16.0, 12.0),
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 17.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.normal,
                                      useGoogleFonts: false,
                                    ),
                                cursorColor:
                                    FlutterFlowTheme.of(context).primaryText,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 12.0, 0.0),
                              child: InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                  _model.isLoading = false;
                                  safeSetState(() {});
                                },
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/cancel_FILL1_wght400_GRAD0_opsz24_1.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  enableDrag: false,
                                  useSafeArea: true,
                                  context: context,
                                  builder: (context) {
                                    return WebViewAware(
                                      child: GestureDetector(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          FocusManager.instance.primaryFocus
                                              ?.unfocus();
                                        },
                                        child: Padding(
                                          padding:
                                              MediaQuery.viewInsetsOf(context),
                                          child: FilterBottomSheetWidget(),
                                        ),
                                      ),
                                    );
                                  },
                                ).then((value) => safeSetState(() {}));
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0.0),
                                child: SvgPicture.asset(
                                  'assets/images/Vector.svg',
                                  width: 24.0,
                                  height: 24.0,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
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
                                      return Builder(
                                        builder: (context) {
                                          if (FFAppState().filterVariable ==
                                              true) {
                                            return FutureBuilder<
                                                ApiCallResponse>(
                                              future: FFAppState()
                                                  .categoryFilterCache(
                                                uniqueQueryKey:
                                                    FFAppState().userId,
                                                requestFn: () =>
                                                    EducationAPIsGroup
                                                        .courseFilterApiCall
                                                        .call(
                                                  categoryIdList:
                                                      FFAppState().categoryId,
                                                  minPrice:
                                                      FFAppState().lowerPrice,
                                                  maxPrice:
                                                      FFAppState().highPrice,
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
                                                final containerCourseFilterApiResponse =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: Builder(
                                                    builder: (context) {
                                                      if (EducationAPIsGroup
                                                              .courseFilterApiCall
                                                              .success(
                                                            containerCourseFilterApiResponse
                                                                .jsonBody,
                                                          ) ==
                                                          1) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final filterCoursedetailsList =
                                                                EducationAPIsGroup
                                                                        .courseFilterApiCall
                                                                        .coursedetailsList(
                                                                          containerCourseFilterApiResponse
                                                                              .jsonBody,
                                                                        )
                                                                        ?.toList() ??
                                                                    [];
                                                            if (filterCoursedetailsList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      NoFilterCourseWidget(),
                                                                ),
                                                              );
                                                            }

                                                            return RefreshIndicator(
                                                              key: Key(
                                                                  'RefreshIndicator_x06u5s6n'),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              onRefresh:
                                                                  () async {
                                                                safeSetState(
                                                                    () {
                                                                  FFAppState()
                                                                      .clearCategoryFilterCacheCacheKey(
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
                                                                    filterCoursedetailsList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        filterCoursedetailsListIndex) {
                                                                  final filterCoursedetailsListItem =
                                                                      filterCoursedetailsList[
                                                                          filterCoursedetailsListIndex];
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
                                                                          'Keyqfw_${filterCoursedetailsListIndex}_of_${filterCoursedetailsList.length}'),
                                                                      image:
                                                                          '${FFAppConstants.imageUrl}${getJsonField(
                                                                        filterCoursedetailsListItem,
                                                                        r'''$.avatar''',
                                                                      ).toString()}',
                                                                      avgReviewRating:
                                                                          getJsonField(
                                                                        filterCoursedetailsListItem,
                                                                        r'''$.averageRating''',
                                                                      ).toDouble(),
                                                                      duration:
                                                                          getJsonField(
                                                                        filterCoursedetailsListItem,
                                                                        r'''$.duration''',
                                                                      ).toString(),
                                                                      course:
                                                                          getJsonField(
                                                                        filterCoursedetailsListItem,
                                                                        r'''$.course''',
                                                                      ).toString(),
                                                                      price:
                                                                          getJsonField(
                                                                        filterCoursedetailsListItem,
                                                                        r'''$.price''',
                                                                      ).toDouble(),
                                                                      avgReviewRatingShor: '0' !=
                                                                          getJsonField(
                                                                            filterCoursedetailsListItem,
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
                                                                                filterCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString()) ==
                                                                          true,
                                                                      instructorIdList:
                                                                          getJsonField(
                                                                        filterCoursedetailsListItem,
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
                                                                                filterCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'courseName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                filterCoursedetailsListItem,
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
                                                                        if (FFAppState().isLogin ==
                                                                            true) {
                                                                          if (functions.checkFavOrNot(
                                                                                  EducationAPIsGroup.getfavouriteApiCall
                                                                                      .favoriteList(
                                                                                        containerGetfavouriteApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.toList(),
                                                                                  getJsonField(
                                                                                    filterCoursedetailsListItem,
                                                                                    r'''$._id''',
                                                                                  ).toString()) ==
                                                                              true) {
                                                                            _model.getAllFilterCourseDetete =
                                                                                await EducationAPIsGroup.unfavouriteApiCall.call(
                                                                              token: FFAppState().token,
                                                                              courseId: getJsonField(
                                                                                filterCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                            );

                                                                            await actions.showCustomToastBottom(
                                                                              FFAppState().unfavText,
                                                                            );
                                                                          } else {
                                                                            _model.getAllFilterCourseAdd =
                                                                                await EducationAPIsGroup.favouriteApiCall.call(
                                                                              userId: FFAppState().userId,
                                                                              courseId: getJsonField(
                                                                                filterCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                              token: FFAppState().token,
                                                                            );

                                                                            await actions.showCustomToastBottom(
                                                                              FFAppState().favText,
                                                                            );
                                                                          }

                                                                          FFAppState()
                                                                              .clearGetFavouriteCacheCache();
                                                                        } else {
                                                                          context
                                                                              .pushNamed(SigninPageWidget.routeName);
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
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      false,
                                                                  lineHeight:
                                                                      1.5,
                                                                ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          } else if (FFAppState()
                                                  .filterVariable ==
                                              false) {
                                            return Builder(
                                              builder: (context) {
                                                if (_model.isLoading == false) {
                                                  return Builder(
                                                    builder: (context) {
                                                      if ((_model.textController
                                                                      .text !=
                                                                  '') &&
                                                          (EducationAPIsGroup
                                                                      .searchCourseApiCall
                                                                      .coursedetailsList(
                                                                    (_model.searchApi
                                                                            ?.jsonBody ??
                                                                        ''),
                                                                  ) !=
                                                                  null &&
                                                              (EducationAPIsGroup
                                                                      .searchCourseApiCall
                                                                      .coursedetailsList(
                                                                (_model.searchApi
                                                                        ?.jsonBody ??
                                                                    ''),
                                                              ))!
                                                                  .isNotEmpty)) {
                                                        return Builder(
                                                          builder: (context) {
                                                            final searchCoursedetailsList =
                                                                EducationAPIsGroup
                                                                        .searchCourseApiCall
                                                                        .coursedetailsList(
                                                                          (_model.searchApi?.jsonBody ??
                                                                              ''),
                                                                        )
                                                                        ?.toList() ??
                                                                    [];
                                                            if (searchCoursedetailsList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  child:
                                                                      NoSearchCourseWidget(),
                                                                ),
                                                              );
                                                            }

                                                            return RefreshIndicator(
                                                              key: Key(
                                                                  'RefreshIndicator_a7j70894'),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              onRefresh:
                                                                  () async {},
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
                                                                    searchCoursedetailsList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            16.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        searchCoursedetailsListIndex) {
                                                                  final searchCoursedetailsListItem =
                                                                      searchCoursedetailsList[
                                                                          searchCoursedetailsListIndex];
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
                                                                          'Keyzgc_${searchCoursedetailsListIndex}_of_${searchCoursedetailsList.length}'),
                                                                      image:
                                                                          '${FFAppConstants.imageUrl}${getJsonField(
                                                                        searchCoursedetailsListItem,
                                                                        r'''$.avatar''',
                                                                      ).toString()}',
                                                                      avgReviewRating:
                                                                          getJsonField(
                                                                        searchCoursedetailsListItem,
                                                                        r'''$.averageRating''',
                                                                      ).toDouble(),
                                                                      duration:
                                                                          getJsonField(
                                                                        searchCoursedetailsListItem,
                                                                        r'''$.duration''',
                                                                      ).toString(),
                                                                      course:
                                                                          getJsonField(
                                                                        searchCoursedetailsListItem,
                                                                        r'''$.course''',
                                                                      ).toString(),
                                                                      price:
                                                                          getJsonField(
                                                                        searchCoursedetailsListItem,
                                                                        r'''$.price''',
                                                                      ).toDouble(),
                                                                      avgReviewRatingShor: '0' !=
                                                                          getJsonField(
                                                                            searchCoursedetailsListItem,
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
                                                                                searchCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString()) ==
                                                                          true,
                                                                      instructorIdList:
                                                                          getJsonField(
                                                                        searchCoursedetailsListItem,
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
                                                                                searchCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                              ParamType.String,
                                                                            ),
                                                                            'courseName':
                                                                                serializeParam(
                                                                              getJsonField(
                                                                                searchCoursedetailsListItem,
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
                                                                        if (FFAppState().isLogin ==
                                                                            true) {
                                                                          if (functions.checkFavOrNot(
                                                                                  EducationAPIsGroup.getfavouriteApiCall
                                                                                      .favoriteList(
                                                                                        containerGetfavouriteApiResponse.jsonBody,
                                                                                      )
                                                                                      ?.toList(),
                                                                                  getJsonField(
                                                                                    searchCoursedetailsListItem,
                                                                                    r'''$._id''',
                                                                                  ).toString()) ==
                                                                              true) {
                                                                            _model.getAllSearchCourseDetete =
                                                                                await EducationAPIsGroup.unfavouriteApiCall.call(
                                                                              token: FFAppState().token,
                                                                              courseId: getJsonField(
                                                                                searchCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                            );

                                                                            await actions.showCustomToastBottom(
                                                                              FFAppState().unfavText,
                                                                            );
                                                                          } else {
                                                                            _model.getAllSearchCourseAdd =
                                                                                await EducationAPIsGroup.favouriteApiCall.call(
                                                                              userId: FFAppState().userId,
                                                                              courseId: getJsonField(
                                                                                searchCoursedetailsListItem,
                                                                                r'''$._id''',
                                                                              ).toString(),
                                                                              token: FFAppState().token,
                                                                            );

                                                                            await actions.showCustomToastBottom(
                                                                              FFAppState().favText,
                                                                            );
                                                                          }

                                                                          FFAppState()
                                                                              .clearGetFavouriteCacheCache();
                                                                        } else {
                                                                          context
                                                                              .pushNamed(SigninPageWidget.routeName);
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
                                                      } else if (_model.textController
                                                                  .text ==
                                                              '') {
                                                        return Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                        );
                                                      } else {
                                                        return wrapWithModel(
                                                          model: _model
                                                              .noSearchCourseModel,
                                                          updateCallback: () =>
                                                              safeSetState(
                                                                  () {}),
                                                          child:
                                                              NoSearchCourseWidget(),
                                                        );
                                                      }
                                                    },
                                                  );
                                                } else {
                                                  return custom_widgets
                                                      .CirculatIndicator(
                                                    width: 50.0,
                                                    height: 50.0,
                                                  );
                                                }
                                              },
                                            );
                                          } else {
                                            return Visibility(
                                              visible: FFAppState()
                                                      .searchList
                                                      .length !=
                                                  0,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Recent search',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                fontSize: 24.0,
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
                                                        InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            FFAppState()
                                                                .searchList = [];
                                                            FFAppState()
                                                                .update(() {});
                                                          },
                                                          child: Text(
                                                            'Clear all',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final searchList =
                                                            FFAppState()
                                                                .searchList
                                                                .toList();

                                                        return ListView
                                                            .separated(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            24.0,
                                                            0,
                                                            24.0,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              searchList.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 24.0),
                                                          itemBuilder: (context,
                                                              searchListIndex) {
                                                            final searchListItem =
                                                                searchList[
                                                                    searchListIndex];
                                                            return Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0.0),
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/images/search.svg',
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      searchListItem,
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                false,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    FFAppState()
                                                                        .removeAtIndexFromSearchList(
                                                                            searchListIndex);
                                                                    FFAppState()
                                                                        .update(
                                                                            () {});
                                                                  },
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            0.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/images/Plus.png',
                                                                      width:
                                                                          20.0,
                                                                      height:
                                                                          20.0,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      );
                                    } else {
                                      return Lottie.asset(
                                        'assets/jsons/No_Wifi.json',
                                        width: 150.0,
                                        height: 130.0,
                                        fit: BoxFit.contain,
                                        animate: true,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
