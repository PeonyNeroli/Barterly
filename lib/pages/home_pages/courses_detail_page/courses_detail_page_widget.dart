import '';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componant/no_lesson_componant/no_lesson_componant_widget.dart';
import '/pages/componant/no_review_componant/no_review_componant_widget.dart';
import '/pages/componant/verified_email_dialog/verified_email_dialog_widget.dart';
import '/pages/shimmers/lessons_shimmer/lessons_shimmer_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'courses_detail_page_model.dart';
export 'courses_detail_page_model.dart';

class CoursesDetailPageWidget extends StatefulWidget {
  const CoursesDetailPageWidget({
    super.key,
    required this.id,
    required this.courseName,
    required this.currencySymbol,
  });

  final String? id;
  final String? courseName;
  final String? currencySymbol;

  static String routeName = 'CoursesDetailPage';
  static String routePath = '/coursesDetailPage';

  @override
  State<CoursesDetailPageWidget> createState() =>
      _CoursesDetailPageWidgetState();
}

class _CoursesDetailPageWidgetState extends State<CoursesDetailPageWidget>
    with TickerProviderStateMixin {
  late CoursesDetailPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursesDetailPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().isLogin == true) {
        _model.getUserDetailPageFunction =
            await EducationAPIsGroup.getuserApiCall.call(
          token: FFAppState().token,
        );

        FFAppState().countryCodeEdit =
            EducationAPIsGroup.getuserApiCall.countryCode(
          (_model.getUserDetailPageFunction?.jsonBody ?? ''),
        )!;
        FFAppState().phone = EducationAPIsGroup.getuserApiCall.phone(
          (_model.getUserDetailPageFunction?.jsonBody ?? ''),
        )!;
        FFAppState().update(() {});
        _model.userVerifiedDetailPageFunction =
            await EducationAPIsGroup.isVerifyAccountCall.call(
          email: EducationAPIsGroup.getuserApiCall.email(
            (_model.getUserDetailPageFunction?.jsonBody ?? ''),
          ),
        );

        if (EducationAPIsGroup.isVerifyAccountCall.success(
              (_model.userVerifiedDetailPageFunction?.jsonBody ?? ''),
            ) ==
            1) {
          FFAppState().countryCodeEdit =
              EducationAPIsGroup.getuserApiCall.countryCode(
            (_model.getUserDetailPageFunction?.jsonBody ?? ''),
          )!;
          FFAppState().phone = EducationAPIsGroup.getuserApiCall.phone(
            (_model.getUserDetailPageFunction?.jsonBody ?? ''),
          )!;
          FFAppState().update(() {});
        } else {
          await showDialog(
            barrierDismissible: false,
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: AlignmentDirectional(0.0, 0.0)
                    .resolve(Directionality.of(context)),
                child: WebViewAware(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(dialogContext).unfocus();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: VerifiedEmailDialogWidget(
                      email: EducationAPIsGroup.getuserApiCall.email(
                        (_model.getUserDetailPageFunction?.jsonBody ?? ''),
                      )!,
                    ),
                  ),
                ),
              );
            },
          );
        }
      }
    });

    animationsMap.addAll({
      'circleImageOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).grey300,
            angle: 0.524,
          ),
        ],
      ),
      'circleImageOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).grey300,
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).grey300,
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: FlutterFlowTheme.of(context).grey300,
            angle: 0.524,
          ),
        ],
      ),
    });

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

    return Builder(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).cultured,
          body: Builder(
            builder: (context) {
              if (FFAppState().connected) {
                return FutureBuilder<ApiCallResponse>(
                  future: (_model
                          .apiRequestCompleter1 ??= Completer<ApiCallResponse>()
                        ..complete(EducationAPIsGroup.courseDetailApiCall.call(
                          courseId: widget.id,
                          userId: FFAppState().userId,
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
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final containerCourseDetailApiResponse = snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          if (EducationAPIsGroup.courseDetailApiCall.success(
                                containerCourseDetailApiResponse.jsonBody,
                              ) ==
                              1) {
                            return FutureBuilder<ApiCallResponse>(
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
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                final columnGetfavouriteApiResponse =
                                    snapshot.data!;

                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: RefreshIndicator(
                                        key: Key('RefreshIndicator_w4v76gxf'),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        onRefresh: () async {
                                          safeSetState(() => _model
                                              .apiRequestCompleter1 = null);
                                          await _model
                                              .waitForApiRequestCompleted1();
                                        },
                                        child: ListView(
                                          padding: EdgeInsets.zero,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: CachedNetworkImage(
                                                    fadeInDuration: Duration(
                                                        milliseconds: 200),
                                                    fadeOutDuration: Duration(
                                                        milliseconds: 200),
                                                    imageUrl:
                                                        '${FFAppConstants.imageUrl}${EducationAPIsGroup.courseDetailApiCall.avatar(
                                                      containerCourseDetailApiResponse
                                                          .jsonBody,
                                                    )}',
                                                    width: double.infinity,
                                                    height: 271.0,
                                                    fit: BoxFit.cover,
                                                    alignment:
                                                        Alignment(0.0, -1.0),
                                                    errorWidget: (context,
                                                            error,
                                                            stackTrace) =>
                                                        Image.asset(
                                                      'assets/images/error_image.jpg',
                                                      width: double.infinity,
                                                      height: 271.0,
                                                      fit: BoxFit.cover,
                                                      alignment:
                                                          Alignment(0.0, -1.0),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                        Colors.black,
                                                        Color(0x73000000),
                                                        Colors.transparent
                                                      ],
                                                      stops: [0.0, 0.5, 1.0],
                                                      begin:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      end: AlignmentDirectional(
                                                          0, 1.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                16.0,
                                                                64.0,
                                                                16.0,
                                                                29.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
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
                                                            context.safePop();
                                                          },
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0.0),
                                                                child:
                                                                    SvgPicture
                                                                        .asset(
                                                                  'assets/images/back.svg',
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                  alignment:
                                                                      Alignment(
                                                                          0.0,
                                                                          -1.0),
                                                                ),
                                                              ),
                                                            ),
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
                                                            if (FFAppState()
                                                                    .isLogin ==
                                                                true) {
                                                              _model.isProcess =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                              if (functions.checkFavOrNot(
                                                                      EducationAPIsGroup.getfavouriteApiCall
                                                                          .favoriteList(
                                                                            columnGetfavouriteApiResponse.jsonBody,
                                                                          )
                                                                          ?.toList(),
                                                                      widget.id) ==
                                                                  true) {
                                                                _model.getAllTrendingCourseDetete =
                                                                    await EducationAPIsGroup
                                                                        .unfavouriteApiCall
                                                                        .call(
                                                                  token:
                                                                      FFAppState()
                                                                          .token,
                                                                  courseId:
                                                                      widget
                                                                          .id,
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
                                                                  userId:
                                                                      FFAppState()
                                                                          .userId,
                                                                  courseId:
                                                                      widget
                                                                          .id,
                                                                  token:
                                                                      FFAppState()
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

                                                              safeSetState(
                                                                  () {});
                                                              _model.isProcess =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            } else {
                                                              context.pushNamed(
                                                                  SigninPageWidget
                                                                      .routeName);
                                                            }

                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                if (!_model
                                                                    .isProcess) {
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (functions.checkFavOrNot(
                                                                              EducationAPIsGroup.getfavouriteApiCall
                                                                                  .favoriteList(
                                                                                    columnGetfavouriteApiResponse.jsonBody,
                                                                                  )
                                                                                  ?.toList(),
                                                                              widget.id) ==
                                                                          true) {
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/heart_fill.svg',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return ClipRRect(
                                                                          borderRadius:
                                                                              BorderRadius.circular(0.0),
                                                                          child:
                                                                              SvgPicture.asset(
                                                                            'assets/images/heart.svg',
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            fit:
                                                                                BoxFit.contain,
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                } else {
                                                                  return custom_widgets
                                                                      .CirculatIndicator(
                                                                    width: 24.0,
                                                                    height:
                                                                        24.0,
                                                                  );
                                                                }
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 12.0)),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      8.0, 12.0, 8.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 56.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .shadowColor,
                                                      offset: Offset(
                                                        0.0,
                                                        5.0,
                                                      ),
                                                    )
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          8.0, 7.0, 8.0, 7.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.indexTabbar =
                                                                0;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .indexTabbar ==
                                                                      0
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : Color(
                                                                      0x00000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Overview',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: _model.indexTabbar == 0
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.indexTabbar =
                                                                1;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .indexTabbar ==
                                                                      1
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : Color(
                                                                      0x00000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Lessons',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: _model.indexTabbar == 1
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            _model.indexTabbar =
                                                                2;
                                                            safeSetState(() {});
                                                          },
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: _model
                                                                          .indexTabbar ==
                                                                      2
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : Color(
                                                                      0x00000000),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12.0),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          8.0),
                                                              child: Text(
                                                                'Reviews',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'SF Pro Display',
                                                                      color: _model.indexTabbar == 2
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primary
                                                                          : FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 17.0)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Builder(
                                              builder: (context) {
                                                if (_model.indexTabbar == 0) {
                                                  return ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      12.0,
                                                      0,
                                                      0,
                                                    ),
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          4.0),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  widget
                                                                      .courseName,
                                                                  'Name',
                                                                ),
                                                                maxLines: 2,
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
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.5,
                                                                    ),
                                                              ),
                                                            ),
                                                            if (EducationAPIsGroup
                                                                        .courseDetailApiCall
                                                                        .about(
                                                                      containerCourseDetailApiResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    null &&
                                                                EducationAPIsGroup
                                                                        .courseDetailApiCall
                                                                        .about(
                                                                      containerCourseDetailApiResponse
                                                                          .jsonBody,
                                                                    ) !=
                                                                    '')
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                                child: custom_widgets
                                                                    .ReadMoreHtml(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 50.0,
                                                                  htmlContent:
                                                                      EducationAPIsGroup
                                                                          .courseDetailApiCall
                                                                          .about(
                                                                    containerCourseDetailApiResponse
                                                                        .jsonBody,
                                                                  ),
                                                                  maxLength: 50,
                                                                ),
                                                              ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: GridView(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  20.0,
                                                                  0,
                                                                  20.0,
                                                                ),
                                                                gridDelegate:
                                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                                  crossAxisCount:
                                                                      () {
                                                                    if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointSmall) {
                                                                      return 3;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointMedium) {
                                                                      return 5;
                                                                    } else if (MediaQuery.sizeOf(context)
                                                                            .width <
                                                                        kBreakpointLarge) {
                                                                      return 7;
                                                                    } else {
                                                                      return 9;
                                                                    }
                                                                  }(),
                                                                  crossAxisSpacing:
                                                                      12.0,
                                                                  mainAxisSpacing:
                                                                      12.0,
                                                                  childAspectRatio:
                                                                      1.1,
                                                                ),
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                children: [
                                                                  if (EducationAPIsGroup
                                                                          .courseDetailApiCall
                                                                          .totalLessons(
                                                                        containerCourseDetailApiResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null)
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/notebook_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${EducationAPIsGroup.courseDetailApiCall.totalLessons(
                                                                                    containerCourseDetailApiResponse.jsonBody,
                                                                                  )?.toString()} Lessons',
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .level(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          null &&
                                                                      EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .level(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          '')
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/analysis_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                EducationAPIsGroup.courseDetailApiCall.level(
                                                                                  containerCourseDetailApiResponse.jsonBody,
                                                                                ),
                                                                                'Level',
                                                                              ),
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .duration(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          null &&
                                                                      EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .duration(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          '')
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/schedule_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                EducationAPIsGroup.courseDetailApiCall.duration(
                                                                                  containerCourseDetailApiResponse.jsonBody,
                                                                                ),
                                                                                'Duration',
                                                                              ),
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .language(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          null &&
                                                                      EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .language(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          ) !=
                                                                          '')
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/translation_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              valueOrDefault<String>(
                                                                                EducationAPIsGroup.courseDetailApiCall.language(
                                                                                  containerCourseDetailApiResponse.jsonBody,
                                                                                ),
                                                                                'language',
                                                                              ),
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (EducationAPIsGroup
                                                                          .courseDetailApiCall
                                                                          .isCertified(
                                                                        containerCourseDetailApiResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null)
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/certificate_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Certificate',
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (EducationAPIsGroup
                                                                          .courseDetailApiCall
                                                                          .isSecure(
                                                                        containerCourseDetailApiResponse
                                                                            .jsonBody,
                                                                      ) !=
                                                                      null)
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          83.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFF3F6FF),
                                                                        borderRadius:
                                                                            BorderRadius.circular(12.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            12.0,
                                                                            12.0,
                                                                            12.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceAround,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.circular(0.0),
                                                                              child: Image.asset(
                                                                                'assets/images/shield_1.png',
                                                                                width: 30.0,
                                                                                height: 30.0,
                                                                                fit: BoxFit.contain,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              'Fully Secure',
                                                                              textAlign: TextAlign.center,
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ].addToStart(SizedBox(
                                                              height: 20.0)),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    8.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
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
                                                                        20.0,
                                                                        0.0,
                                                                        20.0,
                                                                        0.0),
                                                                child: Text(
                                                                  'Instructor',
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
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) {
                                                                  final instructorIdList = EducationAPIsGroup
                                                                          .courseDetailApiCall
                                                                          .instructorIdList(
                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                          )
                                                                          ?.toList() ??
                                                                      [];

                                                                  return ListView
                                                                      .separated(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .fromLTRB(
                                                                      0,
                                                                      12.0,
                                                                      0,
                                                                      20.0,
                                                                    ),
                                                                    primary:
                                                                        false,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        instructorIdList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                20.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            instructorIdListIndex) {
                                                                      final instructorIdListItem =
                                                                          instructorIdList[
                                                                              instructorIdListIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
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
                                                                              InstructorProfilePageWidget.routeName,
                                                                              queryParameters: {
                                                                                'image': serializeParam(
                                                                                  '${FFAppConstants.imageUrl}${getJsonField(
                                                                                    instructorIdListItem,
                                                                                    r'''$.avatar''',
                                                                                  ).toString()}',
                                                                                  ParamType.String,
                                                                                ),
                                                                                'name': serializeParam(
                                                                                  getJsonField(
                                                                                    instructorIdListItem,
                                                                                    r'''$.instructor''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'degree': serializeParam(
                                                                                  getJsonField(
                                                                                    instructorIdListItem,
                                                                                    r'''$.degree''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                                'instructorId': serializeParam(
                                                                                  getJsonField(
                                                                                    instructorIdListItem,
                                                                                    r'''$._id''',
                                                                                  ).toString(),
                                                                                  ParamType.String,
                                                                                ),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  blurRadius: 10.0,
                                                                                  color: FlutterFlowTheme.of(context).shadowColor,
                                                                                  offset: Offset(
                                                                                    0.0,
                                                                                    5.0,
                                                                                  ),
                                                                                )
                                                                              ],
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 200),
                                                                                      fadeOutDuration: Duration(milliseconds: 200),
                                                                                      imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                        instructorIdListItem,
                                                                                        r'''$.avatar''',
                                                                                      ).toString()}',
                                                                                      width: 71.0,
                                                                                      height: 71.0,
                                                                                      fit: BoxFit.cover,
                                                                                      alignment: Alignment(0.0, -1.0),
                                                                                      errorWidget: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.jpg',
                                                                                        width: 71.0,
                                                                                        height: 71.0,
                                                                                        fit: BoxFit.cover,
                                                                                        alignment: Alignment(0.0, -1.0),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              instructorIdListItem,
                                                                                              r'''$.instructor''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'SF Pro Display',
                                                                                                  fontSize: 17.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            getJsonField(
                                                                                              instructorIdListItem,
                                                                                              r'''$.degree''',
                                                                                            ).toString(),
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'SF Pro Display',
                                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 6.0)),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(0.0),
                                                                                    child: SvgPicture.asset(
                                                                                      'assets/images/arrow-right.svg',
                                                                                      width: 24.0,
                                                                                      height: 24.0,
                                                                                      fit: BoxFit.contain,
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
                                                            ].addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        20.0)),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    8.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
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
                                                                          12.0),
                                                                  child: Text(
                                                                    'Skill',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
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
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    EducationAPIsGroup
                                                                        .courseDetailApiCall
                                                                        .skill(
                                                                      containerCourseDetailApiResponse
                                                                          .jsonBody,
                                                                    ),
                                                                    'Skill',
                                                                  ),
                                                                  maxLines: 2,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            'SF Pro Display',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .davysGrey,
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else if (_model.indexTabbar ==
                                                    1) {
                                                  return FutureBuilder<
                                                      ApiCallResponse>(
                                                    future: (_model
                                                                .apiRequestCompleter2 ??=
                                                            Completer<
                                                                ApiCallResponse>()
                                                              ..complete(
                                                                  EducationAPIsGroup
                                                                      .lessonApiCall
                                                                      .call(
                                                                courseId:
                                                                    widget.id,
                                                                userId:
                                                                    FFAppState()
                                                                        .userId,
                                                              )))
                                                        .future,
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            height:
                                                                double.infinity,
                                                            child:
                                                                LessonsShimmerWidget(),
                                                          ),
                                                        );
                                                      }
                                                      final listViewLessonApiResponse =
                                                          snapshot.data!;

                                                      return Builder(
                                                        builder: (context) {
                                                          final lessonsList =
                                                              EducationAPIsGroup
                                                                      .lessonApiCall
                                                                      .lessonsList(
                                                                        listViewLessonApiResponse
                                                                            .jsonBody,
                                                                      )
                                                                      ?.toList() ??
                                                                  [];
                                                          if (lessonsList
                                                              .isEmpty) {
                                                            return Center(
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                height: MediaQuery.sizeOf(
                                                                            context)
                                                                        .height *
                                                                    0.4,
                                                                child:
                                                                    NoLessonComponantWidget(),
                                                              ),
                                                            );
                                                          }

                                                          return RefreshIndicator(
                                                            key: Key(
                                                                'RefreshIndicator_w84ugs16'),
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
                                                                20.0,
                                                                0,
                                                                20.0,
                                                              ),
                                                              primary: false,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  lessonsList
                                                                      .length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          20.0),
                                                              itemBuilder: (context,
                                                                  lessonsListIndex) {
                                                                final lessonsListItem =
                                                                    lessonsList[
                                                                        lessonsListIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              10.0,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).shadowColor,
                                                                          offset:
                                                                              Offset(
                                                                            0.0,
                                                                            5.0,
                                                                          ),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        child:
                                                                            ExpandableNotifier(
                                                                          initialExpanded:
                                                                              false,
                                                                          child:
                                                                              ExpandablePanel(
                                                                            header:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  child: CachedNetworkImage(
                                                                                    fadeInDuration: Duration(milliseconds: 200),
                                                                                    fadeOutDuration: Duration(milliseconds: 200),
                                                                                    imageUrl: '${FFAppConstants.imageUrl}${getJsonField(
                                                                                      lessonsListItem,
                                                                                      r'''$.avatar''',
                                                                                    ).toString()}',
                                                                                    width: 46.0,
                                                                                    height: 46.0,
                                                                                    fit: BoxFit.cover,
                                                                                    alignment: Alignment(0.0, -1.0),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            lessonsListItem,
                                                                                            r'''$.lesson''',
                                                                                          ).toString(),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: 'SF Pro Display',
                                                                                                fontSize: 18.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: false,
                                                                                                lineHeight: 1.5,
                                                                                              ),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                            borderRadius: BorderRadius.circular(22.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(8.0, 1.0, 8.0, 1.0),
                                                                                            child: Text(
                                                                                              'Lesson ${(lessonsListIndex + 1).toString()}',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: 'SF Pro Display',
                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            collapsed:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(0.0),
                                                                                  topRight: Radius.circular(0.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            expanded:
                                                                                Builder(
                                                                              builder: (context) {
                                                                                final topicsList = getJsonField(
                                                                                  lessonsListItem,
                                                                                  r'''$.topics''',
                                                                                ).toList();

                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: List.generate(topicsList.length, (topicsListIndex) {
                                                                                    final topicsListItem = topicsList[topicsListIndex];
                                                                                    return Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(4.0, 0.0, 0.0, 0.0),
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(0.0),
                                                                                            child: SvgPicture.asset(
                                                                                              'assets/images/video-circle.svg',
                                                                                              width: 20.0,
                                                                                              height: 20.0,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Text(
                                                                                            getJsonField(
                                                                                              topicsListItem,
                                                                                              r'''$.topic''',
                                                                                            ).toString(),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: 'SF Pro Display',
                                                                                                  fontSize: 17.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: false,
                                                                                                  lineHeight: 1.5,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                    );
                                                                                  }).divide(SizedBox(height: 7.0)).addToStart(SizedBox(height: 16.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                            theme:
                                                                                ExpandableThemeData(
                                                                              tapHeaderToExpand: true,
                                                                              tapBodyToExpand: false,
                                                                              tapBodyToCollapse: false,
                                                                              headerAlignment: ExpandablePanelHeaderAlignment.top,
                                                                              hasIcon: true,
                                                                              expandIcon: Icons.keyboard_arrow_down_sharp,
                                                                              collapseIcon: Icons.keyboard_arrow_up_outlined,
                                                                              iconSize: 24.0,
                                                                              iconColor: FlutterFlowTheme.of(context).primary,
                                                                              iconPadding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                } else {
                                                  return Builder(
                                                    builder: (context) {
                                                      if (EducationAPIsGroup
                                                                  .courseDetailApiCall
                                                                  .reviewList(
                                                                containerCourseDetailApiResponse
                                                                    .jsonBody,
                                                              ) !=
                                                              null &&
                                                          (EducationAPIsGroup
                                                                  .courseDetailApiCall
                                                                  .reviewList(
                                                            containerCourseDetailApiResponse
                                                                .jsonBody,
                                                          ))!
                                                              .isNotEmpty) {
                                                        return ListView(
                                                          padding: EdgeInsets
                                                              .fromLTRB(
                                                            0,
                                                            20.0,
                                                            0,
                                                            20.0,
                                                          ),
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Rating & Reviews',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .start,
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
                                                                  InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        RecentreviewsPageWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'reviewsList':
                                                                              serializeParam(
                                                                            EducationAPIsGroup.courseDetailApiCall.reviewList(
                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                            ),
                                                                            ParamType.JSON,
                                                                            isList:
                                                                                true,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      'View All',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
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
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .averageRating(
                                                                                containerCourseDetailApiResponse.jsonBody,
                                                                              )
                                                                              ?.toString(),
                                                                          '5',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 34.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        'out of 5',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: 'SF Pro Display',
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: false,
                                                                              lineHeight: 1.5,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            5.0)),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          53.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: getJsonField(
                                                                                          EducationAPIsGroup.courseDetailApiCall.ratingCounts(
                                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                                          ),
                                                                                          r'''$.five''',
                                                                                        ) /
                                                                                        EducationAPIsGroup.courseDetailApiCall
                                                                                            .reviewList(
                                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                                            )!
                                                                                            .length,
                                                                                    lineHeight: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: Color(0xFFCFCFCF),
                                                                                    barRadius: Radius.circular(10.0),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: getJsonField(
                                                                                          EducationAPIsGroup.courseDetailApiCall.ratingCounts(
                                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                                          ),
                                                                                          r'''$.four''',
                                                                                        ) /
                                                                                        EducationAPIsGroup.courseDetailApiCall
                                                                                            .reviewList(
                                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                                            )!
                                                                                            .length,
                                                                                    lineHeight: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: Color(0xFFCFCFCF),
                                                                                    barRadius: Radius.circular(10.0),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: getJsonField(
                                                                                          EducationAPIsGroup.courseDetailApiCall.ratingCounts(
                                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                                          ),
                                                                                          r'''$.three''',
                                                                                        ) /
                                                                                        EducationAPIsGroup.courseDetailApiCall
                                                                                            .reviewList(
                                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                                            )!
                                                                                            .length,
                                                                                    lineHeight: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: Color(0xFFCFCFCF),
                                                                                    barRadius: Radius.circular(10.0),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: getJsonField(
                                                                                          EducationAPIsGroup.courseDetailApiCall.ratingCounts(
                                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                                          ),
                                                                                          r'''$.two''',
                                                                                        ) /
                                                                                        EducationAPIsGroup.courseDetailApiCall
                                                                                            .reviewList(
                                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                                            )!
                                                                                            .length,
                                                                                    lineHeight: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: Color(0xFFCFCFCF),
                                                                                    barRadius: Radius.circular(10.0),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              ClipRRect(
                                                                                borderRadius: BorderRadius.circular(0.0),
                                                                                child: SvgPicture.asset(
                                                                                  'assets/images/star_blue.svg',
                                                                                  width: 10.0,
                                                                                  height: 10.0,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Expanded(
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                                                                                  child: LinearPercentIndicator(
                                                                                    percent: getJsonField(
                                                                                          EducationAPIsGroup.courseDetailApiCall.ratingCounts(
                                                                                            containerCourseDetailApiResponse.jsonBody,
                                                                                          ),
                                                                                          r'''$.one''',
                                                                                        ) /
                                                                                        EducationAPIsGroup.courseDetailApiCall
                                                                                            .reviewList(
                                                                                              containerCourseDetailApiResponse.jsonBody,
                                                                                            )!
                                                                                            .length,
                                                                                    lineHeight: 6.0,
                                                                                    animation: true,
                                                                                    animateFromLastPercent: true,
                                                                                    progressColor: FlutterFlowTheme.of(context).primary,
                                                                                    backgroundColor: Color(0xFFCFCFCF),
                                                                                    barRadius: Radius.circular(10.0),
                                                                                    padding: EdgeInsets.zero,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 2.0)),
                                                                          ),
                                                                        ].divide(SizedBox(height: 4.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        8.0,
                                                                        20.0,
                                                                        11.0),
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    '${functions.numberFormatters(EducationAPIsGroup.courseDetailApiCall.reviewList(
                                                                          containerCourseDetailApiResponse
                                                                              .jsonBody,
                                                                        )!.length.toString())} Reviews',
                                                                    '1',
                                                                  ),
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
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          12.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      'Write A Review',
                                                                      maxLines:
                                                                          1,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                16.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
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
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/rating.svg',
                                                                        width:
                                                                            21.0,
                                                                        height:
                                                                            21.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/rating.svg',
                                                                        width:
                                                                            21.0,
                                                                        height:
                                                                            21.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/rating.svg',
                                                                        width:
                                                                            21.0,
                                                                        height:
                                                                            21.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/rating.svg',
                                                                        width:
                                                                            21.0,
                                                                        height:
                                                                            21.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            2.0,
                                                                            0.0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0.0),
                                                                      child: SvgPicture
                                                                          .asset(
                                                                        'assets/images/rating.svg',
                                                                        width:
                                                                            21.0,
                                                                        height:
                                                                            21.0,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final reviewList = (EducationAPIsGroup
                                                                              .courseDetailApiCall
                                                                              .reviewList(
                                                                                containerCourseDetailApiResponse.jsonBody,
                                                                              )
                                                                              ?.toList() ??
                                                                          [])
                                                                      .take(5)
                                                                      .toList();

                                                                  return ListView
                                                                      .separated(
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
                                                                        reviewList
                                                                            .length,
                                                                    separatorBuilder: (_,
                                                                            __) =>
                                                                        SizedBox(
                                                                            height:
                                                                                14.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            reviewListIndex) {
                                                                      final reviewListItem =
                                                                          reviewList[
                                                                              reviewListIndex];
                                                                      return Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children: [
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              if (getJsonField(
                                                                                    reviewListItem,
                                                                                    r'''$.userId.avatar''',
                                                                                  ) !=
                                                                                  null) {
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: CachedNetworkImage(
                                                                                      fadeInDuration: Duration(milliseconds: 200),
                                                                                      fadeOutDuration: Duration(milliseconds: 200),
                                                                                      imageUrl: '${FFAppConstants.userUrl}${getJsonField(
                                                                                        reviewListItem,
                                                                                        r'''$.userId.avatar''',
                                                                                      ).toString()}',
                                                                                      fit: BoxFit.cover,
                                                                                      alignment: Alignment(0.0, -1.0),
                                                                                    ),
                                                                                  ).animateOnPageLoad(animationsMap['circleImageOnPageLoadAnimation1']!),
                                                                                );
                                                                              } else {
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 32.0,
                                                                                    height: 32.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.asset(
                                                                                      'assets/images/Profile.png',
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ).animateOnPageLoad(animationsMap['circleImageOnPageLoadAnimation2']!),
                                                                                );
                                                                              }
                                                                            },
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: Text(
                                                                                getJsonField(
                                                                                  reviewListItem,
                                                                                  r'''$.review''',
                                                                                ).toString(),
                                                                                maxLines: 2,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).borderColor,
                                                                                      fontSize: 14.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: false,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                                            ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(0.0),
                                                                                  child: SvgPicture.asset(
                                                                                    'assets/images/rating.svg',
                                                                                    width: 16.0,
                                                                                    height: 16.0,
                                                                                    fit: BoxFit.contain,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  reviewListItem,
                                                                                  r'''$.rating''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'SF Pro Display',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: false,
                                                                                      lineHeight: 1.5,
                                                                                    ),
                                                                              ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      } else {
                                                        return Container(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.4,
                                                          child: wrapWithModel(
                                                            model: _model
                                                                .noReviewComponantModel,
                                                            updateCallback: () =>
                                                                safeSetState(
                                                                    () {}),
                                                            child:
                                                                NoReviewComponantWidget(),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  );
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 24.0, 20.0, 30.0),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (FFAppState().isLogin == true) {
                                              if ('1' ==
                                                  getJsonField(
                                                    containerCourseDetailApiResponse
                                                        .jsonBody,
                                                    r'''$.data.coursedetails[:].is_buy''',
                                                  ).toString()) {
                                                await actions
                                                    .showCustomToastBottom(
                                                  '     You already Buy this course !!     ',
                                                );
                                              } else {
                                                if (EducationAPIsGroup
                                                        .courseDetailApiCall
                                                        .price(
                                                      containerCourseDetailApiResponse
                                                          .jsonBody,
                                                    ) ==
                                                    0.0) {
                                                  _model.bookingFreeStatus =
                                                      await EducationAPIsGroup
                                                          .enrollApiCall
                                                          .call(
                                                    courseId: widget.id,
                                                    userId: FFAppState().userId,
                                                    paymentMode: 'Free',
                                                    price: 0.0,
                                                    token: FFAppState().token,
                                                    payment: 'success',
                                                    date: functions.convertDate(
                                                        getCurrentTimestamp
                                                            .toString()),
                                                    transactionId:
                                                        'EDUCATIONFREE',
                                                  );

                                                  if (EducationAPIsGroup
                                                          .enrollApiCall
                                                          .success(
                                                        (_model.bookingFreeStatus
                                                                ?.jsonBody ??
                                                            ''),
                                                      ) ==
                                                      1) {
                                                    await actions
                                                        .showCustomToastBottom(
                                                      EducationAPIsGroup
                                                          .enrollApiCall
                                                          .message(
                                                        (_model.bookingFreeStatus
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
                                                    );
                                                  } else {
                                                    await actions
                                                        .showCustomToastBottom(
                                                      EducationAPIsGroup
                                                          .enrollApiCall
                                                          .message(
                                                        (_model.bookingFreeStatus
                                                                ?.jsonBody ??
                                                            ''),
                                                      )!,
                                                    );
                                                  }
                                                } else {
                                                  context.pushNamed(
                                                    CheckoutPaymentPageWidget
                                                        .routeName,
                                                    queryParameters: {
                                                      'price': serializeParam(
                                                        EducationAPIsGroup
                                                            .courseDetailApiCall
                                                            .price(
                                                          containerCourseDetailApiResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.double,
                                                      ),
                                                      'courseId':
                                                          serializeParam(
                                                        widget.id,
                                                        ParamType.String,
                                                      ),
                                                      'userId': serializeParam(
                                                        FFAppState().userId,
                                                        ParamType.String,
                                                      ),
                                                      'courseName':
                                                          serializeParam(
                                                        widget.courseName,
                                                        ParamType.String,
                                                      ),
                                                      'currencySymbol':
                                                          serializeParam(
                                                        widget.currencySymbol,
                                                        ParamType.String,
                                                      ),
                                                      'courseImage':
                                                          serializeParam(
                                                        EducationAPIsGroup
                                                            .courseDetailApiCall
                                                            .avatar(
                                                          containerCourseDetailApiResponse
                                                              .jsonBody,
                                                        ),
                                                        ParamType.String,
                                                      ),
                                                    }.withoutNulls,
                                                  );
                                                }
                                              }
                                            } else {
                                              context.pushNamed(
                                                  SigninPageWidget.routeName);
                                            }

                                            safeSetState(() {});
                                          },
                                          text: 'Enroll Now',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    24.0, 0.0, 24.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'SF Pro Display',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  fontSize: 18.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
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
                              },
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
      ),
    );
  }
}
