import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/blank_componant/blank_componant_widget.dart';
import '/pages/componant/main_container_componant/main_container_componant_widget.dart';
import '/pages/componant/no_recently_add_course/no_recently_add_course_widget.dart';
import '/pages/componant/no_trending_course/no_trending_course_widget.dart';
import '/pages/shimmers/home_shimmer/home_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'home_componant_model.dart';
export 'home_componant_model.dart';

class HomeComponantWidget extends StatefulWidget {
  const HomeComponantWidget({super.key});

  @override
  State<HomeComponantWidget> createState() => _HomeComponantWidgetState();
}

class _HomeComponantWidgetState extends State<HomeComponantWidget> {
  late HomeComponantModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeComponantModel());

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
            return Container(
              decoration: BoxDecoration(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Builder(
                          builder: (context) {
                            if ((FFAppState().token != '') &&
                                (getJsonField(
                                      FFAppState().userDetail,
                                      r'''$.firstname''',
                                    ) !=
                                    null)) {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Builder(
                                      builder: (context) {
                                        if (FFAppState().isLogin == true) {
                                          return Builder(
                                            builder: (context) {
                                              if ((getJsonField(
                                                        FFAppState().userDetail,
                                                        r'''$.avatar''',
                                                      ) !=
                                                      null) &&
                                                  ('null' !=
                                                      getJsonField(
                                                        FFAppState().userDetail,
                                                        r'''$.avatar''',
                                                      ).toString())) {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Container(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      '${FFAppConstants.userUrl}${getJsonField(
                                                        FFAppState().userDetail,
                                                        r'''$.avatar''',
                                                      ).toString()}',
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          Alignment(0.0, 0.0),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 12.0, 0.0),
                                                  child: Container(
                                                    width: 48.0,
                                                    height: 48.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Profile.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                        } else {
                                          return Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: Container(
                                              width: 48.0,
                                              height: 48.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                'assets/images/Profile.png',
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                    Text(
                                      FFAppState().isLogin == true
                                          ? 'Welcome, '
                                          : 'Welcome ',
                                      textAlign: TextAlign.start,
                                      maxLines: 1,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                    if (FFAppState().isLogin == true)
                                      Expanded(
                                        child: Text(
                                          functions
                                              .capitalizeFirst(getJsonField(
                                            FFAppState().userDetail,
                                            r'''$.firstname''',
                                          ).toString()),
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 20.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                                lineHeight: 1.5,
                                              ),
                                        ),
                                      ),
                                  ]
                                      .addToStart(SizedBox(width: 20.0))
                                      .addToEnd(SizedBox(width: 20.0)),
                                ),
                              );
                            } else {
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 16.0, 0.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 12.0, 0.0),
                                      child: Container(
                                        width: 48.0,
                                        height: 48.0,
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/Profile.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Welcome,  ',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'SF Pro Display',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            useGoogleFonts: false,
                                            lineHeight: 1.5,
                                          ),
                                    ),
                                  ]
                                      .addToStart(SizedBox(width: 20.0))
                                      .addToEnd(SizedBox(width: 20.0)),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    context
                                        .pushNamed(SearchPageWidget.routeName);
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      borderRadius: BorderRadius.circular(12.0),
                                      border: Border.all(
                                        color: FlutterFlowTheme.of(context)
                                            .gainsboro,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(13.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 12.0, 0.0),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(0.0),
                                              child: SvgPicture.asset(
                                                'assets/images/search.svg',
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              'Search',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            'SF Pro Display',
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .spanishGray,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                        lineHeight: 1.5,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
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
                                  context.pushNamed(SearchPageWidget.routeName);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    borderRadius: BorderRadius.circular(12.0),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .gainsboro,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(13.0),
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
                                ),
                              ),
                            ].divide(SizedBox(width: 16.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
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
                            child: Container(
                              width: 0.0,
                              height: 0.0,
                              child: HomeShimmerWidget(),
                            ),
                          );
                        }
                        final containerGetfavouriteApiResponse = snapshot.data!;

                        return Container(
                          decoration: BoxDecoration(),
                          child: FutureBuilder<ApiCallResponse>(
                            future: FFAppState()
                                .currencyCache(
                              requestFn: () =>
                                  EducationAPIsGroup.currencyApiCall.call(),
                            )
                                .then((result) {
                              _model.apiRequestCompleted5 = true;
                              return result;
                            }),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: Container(
                                    width: 0.0,
                                    height: 0.0,
                                    child: BlankComponantWidget(),
                                  ),
                                );
                              }
                              final containerCurrencyApiResponse =
                                  snapshot.data!;

                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(),
                                child: FutureBuilder<ApiCallResponse>(
                                  future: FFAppState()
                                      .sliderCache(
                                    uniqueQueryKey: FFAppState().userId,
                                    requestFn: () =>
                                        EducationAPIsGroup.sliderApiCall.call(),
                                  )
                                      .then((result) {
                                    try {
                                      _model.apiRequestCompleted3 = true;
                                      _model.apiRequestLastUniqueKey3 =
                                          FFAppState().userId;
                                    } finally {}
                                    return result;
                                  }),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return HomeShimmerWidget();
                                    }
                                    final containerSliderApiResponse =
                                        snapshot.data!;

                                    return Container(
                                      decoration: BoxDecoration(),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: FFAppState()
                                            .categoryCache(
                                          uniqueQueryKey: FFAppState().userId,
                                          requestFn: () => EducationAPIsGroup
                                              .categoryApiCall
                                              .call(),
                                        )
                                            .then((result) {
                                          try {
                                            _model.apiRequestCompleted4 = true;
                                            _model.apiRequestLastUniqueKey4 =
                                                FFAppState().userId;
                                          } finally {}
                                          return result;
                                        }),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return HomeShimmerWidget();
                                          }
                                          final containerCategoryApiResponse =
                                              snapshot.data!;

                                          return Container(
                                            decoration: BoxDecoration(),
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future: FFAppState()
                                                  .trendingCourseCache(
                                                uniqueQueryKey:
                                                    FFAppState().userId,
                                                requestFn: () =>
                                                    EducationAPIsGroup
                                                        .trendingcourseApiCall
                                                        .call(),
                                              )
                                                  .then((result) {
                                                try {
                                                  _model.apiRequestCompleted1 =
                                                      true;
                                                  _model.apiRequestLastUniqueKey1 =
                                                      FFAppState().userId;
                                                } finally {}
                                                return result;
                                              }),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return HomeShimmerWidget();
                                                }
                                                final containerTrendingcourseApiResponse =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: FFAppState()
                                                        .recentlyAddCourseCache(
                                                      uniqueQueryKey:
                                                          FFAppState().userId,
                                                      requestFn: () =>
                                                          EducationAPIsGroup
                                                              .recentlyAddCourseApiCall
                                                              .call(),
                                                    )
                                                        .then((result) {
                                                      try {
                                                        _model.apiRequestCompleted2 =
                                                            true;
                                                        _model.apiRequestLastUniqueKey2 =
                                                            FFAppState().userId;
                                                      } finally {}
                                                      return result;
                                                    }),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return HomeShimmerWidget();
                                                      }
                                                      final containerRecentlyAddCourseApiResponse =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Builder(
                                                          builder: (context) {
                                                            if ((EducationAPIsGroup
                                                                        .sliderApiCall
                                                                        .success(
                                                                      containerSliderApiResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    1) ||
                                                                (EducationAPIsGroup
                                                                        .categoryApiCall
                                                                        .success(
                                                                      containerCategoryApiResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    1) ||
                                                                (EducationAPIsGroup
                                                                        .trendingcourseApiCall
                                                                        .success(
                                                                      containerTrendingcourseApiResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    1) ||
                                                                (EducationAPIsGroup
                                                                        .recentlyAddCourseApiCall
                                                                        .success(
                                                                      containerRecentlyAddCourseApiResponse
                                                                          .jsonBody,
                                                                    ) ==
                                                                    1)) {
                                                              return RefreshIndicator(
                                                                key: Key(
                                                                    'RefreshIndicator_fbpk7810'),
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                onRefresh:
                                                                    () async {
                                                                  await Future
                                                                      .wait([
                                                                    Future(
                                                                        () async {
                                                                      safeSetState(
                                                                          () {
                                                                        FFAppState()
                                                                            .clearSliderCacheCacheKey(_model.apiRequestLastUniqueKey3);
                                                                        _model.apiRequestCompleted3 =
                                                                            false;
                                                                      });
                                                                      await _model
                                                                          .waitForApiRequestCompleted3();
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      safeSetState(
                                                                          () {
                                                                        FFAppState()
                                                                            .clearCategoryCacheCacheKey(_model.apiRequestLastUniqueKey4);
                                                                        _model.apiRequestCompleted4 =
                                                                            false;
                                                                      });
                                                                      await _model
                                                                          .waitForApiRequestCompleted4();
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      safeSetState(
                                                                          () {
                                                                        FFAppState()
                                                                            .clearTrendingCourseCacheCacheKey(_model.apiRequestLastUniqueKey1);
                                                                        _model.apiRequestCompleted1 =
                                                                            false;
                                                                      });
                                                                      await _model
                                                                          .waitForApiRequestCompleted1();
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      safeSetState(
                                                                          () {
                                                                        FFAppState()
                                                                            .clearRecentlyAddCourseCacheCacheKey(_model.apiRequestLastUniqueKey2);
                                                                        _model.apiRequestCompleted2 =
                                                                            false;
                                                                      });
                                                                      await _model
                                                                          .waitForApiRequestCompleted2();
                                                                    }),
                                                                    Future(
                                                                        () async {
                                                                      safeSetState(
                                                                          () {
                                                                        FFAppState()
                                                                            .clearCurrencyCacheCache();
                                                                        _model.apiRequestCompleted5 =
                                                                            false;
                                                                      });
                                                                      await _model
                                                                          .waitForApiRequestCompleted5();
                                                                    }),
                                                                  ]);
                                                                },
                                                                child: ListView(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .fromLTRB(
                                                                    0,
                                                                    8.0,
                                                                    0,
                                                                    0,
                                                                  ),
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  children: [
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible: EducationAPIsGroup.sliderApiCall.success(
                                                                              containerSliderApiResponse.jsonBody,
                                                                            ) ==
                                                                            1,
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              8.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (EducationAPIsGroup.sliderApiCall.success(
                                                                                      containerSliderApiResponse.jsonBody,
                                                                                    ) ==
                                                                                    1)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 20.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final sliderList = (EducationAPIsGroup.sliderApiCall
                                                                                                    .sliderList(
                                                                                                      containerSliderApiResponse.jsonBody,
                                                                                                    )
                                                                                                    ?.toList() ??
                                                                                                [])
                                                                                            .take(5)
                                                                                            .toList();

                                                                                        return Container(
                                                                                          width: double.infinity,
                                                                                          height: 150.0,
                                                                                          child: CarouselSlider.builder(
                                                                                            itemCount: sliderList.length,
                                                                                            itemBuilder: (context, sliderListIndex, _) {
                                                                                              final sliderListItem = sliderList[sliderListIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    CoursesDetailPageWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'id': serializeParam(
                                                                                                        getJsonField(
                                                                                                          sliderListItem,
                                                                                                          r'''$.courseId._id''',
                                                                                                        ).toString(),
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'courseName': serializeParam(
                                                                                                        getJsonField(
                                                                                                          sliderListItem,
                                                                                                          r'''$.courseId.course''',
                                                                                                        ).toString(),
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'currencySymbol': serializeParam(
                                                                                                        EducationAPIsGroup.currencyApiCall.currency(
                                                                                                          containerCurrencyApiResponse.jsonBody,
                                                                                                        ),
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  height: 150.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    borderRadius: BorderRadius.circular(22.0),
                                                                                                  ),
                                                                                                  child: ClipRRect(
                                                                                                    borderRadius: BorderRadius.circular(22.0),
                                                                                                    child: CachedNetworkImage(
                                                                                                      fadeInDuration: Duration(milliseconds: 200),
                                                                                                      fadeOutDuration: Duration(milliseconds: 200),
                                                                                                      imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                                        sliderListItem,
                                                                                                        r'''$.avatar''',
                                                                                                      ).toString()}',
                                                                                                      width: double.infinity,
                                                                                                      height: double.infinity,
                                                                                                      fit: BoxFit.cover,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                            carouselController: _model.carouselController ??= CarouselSliderController(),
                                                                                            options: CarouselOptions(
                                                                                              initialPage: max(0, min(1, sliderList.length - 1)),
                                                                                              viewportFraction: 0.8,
                                                                                              disableCenter: true,
                                                                                              enlargeCenterPage: true,
                                                                                              enlargeFactor: 0.25,
                                                                                              enableInfiniteScroll: true,
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              autoPlay: false,
                                                                                              onPageChanged: (index, _) async {
                                                                                                _model.carouselCurrentIndex = index;

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                if (EducationAPIsGroup.sliderApiCall.success(
                                                                                      containerSliderApiResponse.jsonBody,
                                                                                    ) ==
                                                                                    1)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 16.0),
                                                                                    child: Builder(
                                                                                      builder: (context) {
                                                                                        final sliderContainerList = (EducationAPIsGroup.sliderApiCall
                                                                                                    .sliderList(
                                                                                                      containerSliderApiResponse.jsonBody,
                                                                                                    )
                                                                                                    ?.toList() ??
                                                                                                [])
                                                                                            .take(5)
                                                                                            .toList();

                                                                                        return Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: List.generate(sliderContainerList.length, (sliderContainerListIndex) {
                                                                                            final sliderContainerListItem = sliderContainerList[sliderContainerListIndex];
                                                                                            return Container(
                                                                                              width: 10.0,
                                                                                              height: 10.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: _model.carouselCurrentIndex == sliderContainerListIndex ? FlutterFlowTheme.of(context).primary : FlutterFlowTheme.of(context).gainsboro,
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                            );
                                                                                          }).divide(SizedBox(width: 12.0)),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Visibility(
                                                                        visible: (EducationAPIsGroup.categoryApiCall.success(
                                                                                  containerCategoryApiResponse.jsonBody,
                                                                                ) ==
                                                                                1) &&
                                                                            (EducationAPIsGroup.categoryApiCall
                                                                                    .categoryList(
                                                                                      containerCategoryApiResponse.jsonBody,
                                                                                    )!
                                                                                    .length >
                                                                                0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      child: Text(
                                                                                        'Category',
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'SF Pro Display',
                                                                                              fontSize: 20.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              useGoogleFonts: false,
                                                                                              lineHeight: 1.5,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(CategoryAllPageWidget.routeName);
                                                                                      },
                                                                                      child: Text(
                                                                                        'See All',
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'SF Pro Display',
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              fontSize: 17.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: false,
                                                                                              lineHeight: 1.5,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                                                                                child: Builder(
                                                                                  builder: (context) {
                                                                                    final categoryList = (EducationAPIsGroup.categoryApiCall
                                                                                                .categoryList(
                                                                                                  containerCategoryApiResponse.jsonBody,
                                                                                                )
                                                                                                ?.toList() ??
                                                                                            [])
                                                                                        .take(8)
                                                                                        .toList();

                                                                                    return SingleChildScrollView(
                                                                                      scrollDirection: Axis.horizontal,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: List.generate(categoryList.length, (categoryListIndex) {
                                                                                          final categoryListItem = categoryList[categoryListIndex];
                                                                                          return InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                CategoryListPageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'categoryId': serializeParam(
                                                                                                    getJsonField(
                                                                                                      categoryListItem,
                                                                                                      r'''$._id''',
                                                                                                    ).toString(),
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                  'category': serializeParam(
                                                                                                    getJsonField(
                                                                                                      categoryListItem,
                                                                                                      r'''$.category''',
                                                                                                    ).toString(),
                                                                                                    ParamType.String,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 112.0,
                                                                                              height: 128.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).cultured,
                                                                                                borderRadius: BorderRadius.circular(16.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(14.0, 15.0, 14.0, 15.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    ClipRRect(
                                                                                                      borderRadius: BorderRadius.circular(0.0),
                                                                                                      child: CachedNetworkImage(
                                                                                                        fadeInDuration: Duration(milliseconds: 200),
                                                                                                        fadeOutDuration: Duration(milliseconds: 200),
                                                                                                        imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                                          categoryListItem,
                                                                                                          r'''$.avatar''',
                                                                                                        ).toString()}',
                                                                                                        width: 40.0,
                                                                                                        height: 40.0,
                                                                                                        fit: BoxFit.cover,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      getJsonField(
                                                                                                        categoryListItem,
                                                                                                        r'''$.category''',
                                                                                                      ).toString(),
                                                                                                      textAlign: TextAlign.center,
                                                                                                      maxLines: 2,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: 'SF Pro Display',
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: false,
                                                                                                            lineHeight: 1.5,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 16.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        }).divide(SizedBox(width: 12.0)).addToStart(SizedBox(width: 20.0)).addToEnd(SizedBox(width: 20.0)),
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
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if ((EducationAPIsGroup.trendingcourseApiCall.trendingCoursesList(
                                                                                            containerTrendingcourseApiResponse.jsonBody,
                                                                                          ) !=
                                                                                          null &&
                                                                                      (EducationAPIsGroup.trendingcourseApiCall.trendingCoursesList(
                                                                                        containerTrendingcourseApiResponse.jsonBody,
                                                                                      ))!
                                                                                          .isNotEmpty) &&
                                                                                  (EducationAPIsGroup.trendingcourseApiCall.success(
                                                                                        containerTrendingcourseApiResponse.jsonBody,
                                                                                      ) ==
                                                                                      1)) {
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              'Trending Course',
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: false,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(TrendingCourseAllPageWidget.routeName);
                                                                                            },
                                                                                            child: Text(
                                                                                              'See All',
                                                                                              textAlign: TextAlign.end,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 17.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final trendingCoursesList = (EducationAPIsGroup.trendingcourseApiCall
                                                                                                    .trendingCoursesList(
                                                                                                      containerTrendingcourseApiResponse.jsonBody,
                                                                                                    )
                                                                                                    ?.toList() ??
                                                                                                [])
                                                                                            .take(3)
                                                                                            .toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: List.generate(trendingCoursesList.length, (trendingCoursesListIndex) {
                                                                                              final trendingCoursesListItem = trendingCoursesList[trendingCoursesListIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                                                                                                child: Container(
                                                                                                  width: 276.0,
                                                                                                  height: 303.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  child: MainContainerComponantWidget(
                                                                                                    key: Key('Key466_${trendingCoursesListIndex}_of_${trendingCoursesList.length}'),
                                                                                                    image: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.avatar''',
                                                                                                    ).toString()}',
                                                                                                    avgReviewRating: getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.averageRating''',
                                                                                                    ).toDouble(),
                                                                                                    duration: getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.duration''',
                                                                                                    ).toString(),
                                                                                                    course: getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.course''',
                                                                                                    ).toString(),
                                                                                                    price: getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.price''',
                                                                                                    ).toDouble(),
                                                                                                    avgReviewRatingShor: '0' !=
                                                                                                        getJsonField(
                                                                                                          trendingCoursesListItem,
                                                                                                          r'''$.averageRating''',
                                                                                                        ).toString(),
                                                                                                    currency: EducationAPIsGroup.currencyApiCall.currency(
                                                                                                      containerCurrencyApiResponse.jsonBody,
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
                                                                                                    instructorIdList: getJsonField(
                                                                                                      trendingCoursesListItem,
                                                                                                      r'''$.instructorId''',
                                                                                                      true,
                                                                                                    )!,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        CoursesDetailPageWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'id': serializeParam(
                                                                                                            getJsonField(
                                                                                                              trendingCoursesListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'courseName': serializeParam(
                                                                                                            getJsonField(
                                                                                                              trendingCoursesListItem,
                                                                                                              r'''$.course''',
                                                                                                            ).toString(),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'currencySymbol': serializeParam(
                                                                                                            EducationAPIsGroup.currencyApiCall.currency(
                                                                                                              containerCurrencyApiResponse.jsonBody,
                                                                                                            ),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    onTapFav: () async {
                                                                                                      if (FFAppState().isLogin == true) {
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
                                                                                                          _model.getAllTrendingCourseDetete = await EducationAPIsGroup.unfavouriteApiCall.call(
                                                                                                            token: FFAppState().token,
                                                                                                            courseId: getJsonField(
                                                                                                              trendingCoursesListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                          );

                                                                                                          await actions.showCustomToastBottom(
                                                                                                            FFAppState().unfavText,
                                                                                                          );
                                                                                                        } else {
                                                                                                          _model.getAllTrendingCourseAdd = await EducationAPIsGroup.favouriteApiCall.call(
                                                                                                            userId: FFAppState().userId,
                                                                                                            courseId: getJsonField(
                                                                                                              trendingCoursesListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                            token: FFAppState().token,
                                                                                                          );

                                                                                                          await actions.showCustomToastBottom(
                                                                                                            FFAppState().favText,
                                                                                                          );
                                                                                                        }

                                                                                                        FFAppState().clearGetFavouriteCacheCache();
                                                                                                      } else {
                                                                                                        context.pushNamed(SigninPageWidget.routeName);
                                                                                                      }

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 20.0)).addToEnd(SizedBox(width: 20.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              } else {
                                                                                return Container(
                                                                                  height: 200.0,
                                                                                  child: wrapWithModel(
                                                                                    model: _model.noTrendingCourseModel,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: NoTrendingCourseWidget(),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if ((EducationAPIsGroup.recentlyAddCourseApiCall.coursedetailsList(
                                                                                            containerRecentlyAddCourseApiResponse.jsonBody,
                                                                                          ) !=
                                                                                          null &&
                                                                                      (EducationAPIsGroup.recentlyAddCourseApiCall.coursedetailsList(
                                                                                        containerRecentlyAddCourseApiResponse.jsonBody,
                                                                                      ))!
                                                                                          .isNotEmpty) &&
                                                                                  (EducationAPIsGroup.recentlyAddCourseApiCall.success(
                                                                                        containerRecentlyAddCourseApiResponse.jsonBody,
                                                                                      ) ==
                                                                                      1)) {
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              'Recently Added Course',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    fontSize: 20.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: false,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(RecentlyAddcoursePageWidget.routeName);
                                                                                            },
                                                                                            child: Text(
                                                                                              'See All',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 17.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: false,
                                                                                                    lineHeight: 1.5,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final recentlyAddCourseList = (EducationAPIsGroup.recentlyAddCourseApiCall
                                                                                                    .coursedetailsList(
                                                                                                      containerRecentlyAddCourseApiResponse.jsonBody,
                                                                                                    )
                                                                                                    ?.toList() ??
                                                                                                [])
                                                                                            .take(3)
                                                                                            .toList();

                                                                                        return SingleChildScrollView(
                                                                                          scrollDirection: Axis.horizontal,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: List.generate(recentlyAddCourseList.length, (recentlyAddCourseListIndex) {
                                                                                              final recentlyAddCourseListItem = recentlyAddCourseList[recentlyAddCourseListIndex];
                                                                                              return Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 20.0),
                                                                                                child: Container(
                                                                                                  width: 276.0,
                                                                                                  height: 303.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                  ),
                                                                                                  child: MainContainerComponantWidget(
                                                                                                    key: Key('Keym9d_${recentlyAddCourseListIndex}_of_${recentlyAddCourseList.length}'),
                                                                                                    image: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.avatar''',
                                                                                                    ).toString()}',
                                                                                                    avgReviewRating: getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.averageRating''',
                                                                                                    ).toDouble(),
                                                                                                    duration: getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.duration''',
                                                                                                    ).toString(),
                                                                                                    course: getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.course''',
                                                                                                    ).toString(),
                                                                                                    price: getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.price''',
                                                                                                    ).toDouble(),
                                                                                                    avgReviewRatingShor: '0' !=
                                                                                                        getJsonField(
                                                                                                          recentlyAddCourseListItem,
                                                                                                          r'''$.averageRating''',
                                                                                                        ).toString(),
                                                                                                    currency: EducationAPIsGroup.currencyApiCall.currency(
                                                                                                      containerCurrencyApiResponse.jsonBody,
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
                                                                                                    instructorIdList: getJsonField(
                                                                                                      recentlyAddCourseListItem,
                                                                                                      r'''$.instructorId''',
                                                                                                      true,
                                                                                                    )!,
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        CoursesDetailPageWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'id': serializeParam(
                                                                                                            getJsonField(
                                                                                                              recentlyAddCourseListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'courseName': serializeParam(
                                                                                                            getJsonField(
                                                                                                              recentlyAddCourseListItem,
                                                                                                              r'''$.course''',
                                                                                                            ).toString(),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'currencySymbol': serializeParam(
                                                                                                            EducationAPIsGroup.currencyApiCall.currency(
                                                                                                              containerCurrencyApiResponse.jsonBody,
                                                                                                            ),
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                    onTapFav: () async {
                                                                                                      if (FFAppState().isLogin == true) {
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
                                                                                                          _model.getAllRecentlyCourseDetete = await EducationAPIsGroup.unfavouriteApiCall.call(
                                                                                                            token: FFAppState().token,
                                                                                                            courseId: getJsonField(
                                                                                                              recentlyAddCourseListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                          );

                                                                                                          await actions.showCustomToastBottom(
                                                                                                            FFAppState().unfavText,
                                                                                                          );
                                                                                                        } else {
                                                                                                          _model.getAllRecentlyCourseAdd = await EducationAPIsGroup.favouriteApiCall.call(
                                                                                                            userId: FFAppState().userId,
                                                                                                            courseId: getJsonField(
                                                                                                              recentlyAddCourseListItem,
                                                                                                              r'''$._id''',
                                                                                                            ).toString(),
                                                                                                            token: FFAppState().token,
                                                                                                          );

                                                                                                          await actions.showCustomToastBottom(
                                                                                                            FFAppState().favText,
                                                                                                          );
                                                                                                        }

                                                                                                        FFAppState().clearGetFavouriteCacheCache();
                                                                                                      } else {
                                                                                                        context.pushNamed(SigninPageWidget.routeName);
                                                                                                      }

                                                                                                      safeSetState(() {});
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            }).divide(SizedBox(width: 16.0)).addToStart(SizedBox(width: 20.0)).addToEnd(SizedBox(width: 20.0)),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              } else {
                                                                                return Container(
                                                                                  height: 200.0,
                                                                                  child: wrapWithModel(
                                                                                    model: _model.noRecentlyAddCourseModel,
                                                                                    updateCallback: () => safeSetState(() {}),
                                                                                    child: NoRecentlyAddCourseWidget(),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            } else {
                                                              return Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Text(
                                                                  FFAppConstants
                                                                      .unAuthText,
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
                                                                            18.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
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
    );
  }
}
