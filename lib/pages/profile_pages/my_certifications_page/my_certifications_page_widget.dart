import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/no_certificate/no_certificate_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'my_certifications_page_model.dart';
export 'my_certifications_page_model.dart';

class MyCertificationsPageWidget extends StatefulWidget {
  const MyCertificationsPageWidget({super.key});

  static String routeName = 'MyCertificationsPage';
  static String routePath = '/myCertificationsPage';

  @override
  State<MyCertificationsPageWidget> createState() =>
      _MyCertificationsPageWidgetState();
}

class _MyCertificationsPageWidgetState
    extends State<MyCertificationsPageWidget> {
  late MyCertificationsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyCertificationsPageModel());

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
                          title: 'My Certifications',
                          backIcon: false,
                          addIcon: false,
                          onTapAdd: () async {},
                          onTapBack: () async {},
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: FFAppState().myCertificateShimmer(
                            uniqueQueryKey: FFAppState().userId,
                            requestFn: () => EducationAPIsGroup
                                .getCertificateListApiCall
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
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            final containerGetCertificateListApiResponse =
                                snapshot.data!;

                            return Container(
                              width: double.infinity,
                              height: double.infinity,
                              decoration: BoxDecoration(),
                              child: Builder(
                                builder: (context) {
                                  if ((EducationAPIsGroup
                                                  .getCertificateListApiCall
                                                  .certificateList(
                                                containerGetCertificateListApiResponse
                                                    .jsonBody,
                                              ) !=
                                              null &&
                                          (EducationAPIsGroup
                                                  .getCertificateListApiCall
                                                  .certificateList(
                                            containerGetCertificateListApiResponse
                                                .jsonBody,
                                          ))!
                                              .isNotEmpty) &&
                                      (EducationAPIsGroup
                                              .getCertificateListApiCall
                                              .success(
                                            containerGetCertificateListApiResponse
                                                .jsonBody,
                                          ) ==
                                          1)) {
                                    return ListView(
                                      padding: EdgeInsets.fromLTRB(
                                        0,
                                        16.0,
                                        0,
                                        16.0,
                                      ),
                                      scrollDirection: Axis.vertical,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 0.0, 16.0, 0.0),
                                          child: Builder(
                                            builder: (context) {
                                              final certificateList =
                                                  EducationAPIsGroup
                                                          .getCertificateListApiCall
                                                          .certificateList(
                                                            containerGetCertificateListApiResponse
                                                                .jsonBody,
                                                          )
                                                          ?.toList() ??
                                                      [];

                                              return Wrap(
                                                spacing: 16.0,
                                                runSpacing: 16.0,
                                                alignment: WrapAlignment.start,
                                                crossAxisAlignment:
                                                    WrapCrossAlignment.center,
                                                direction: Axis.horizontal,
                                                runAlignment:
                                                    WrapAlignment.start,
                                                verticalDirection:
                                                    VerticalDirection.down,
                                                clipBehavior: Clip.antiAlias,
                                                children: List.generate(
                                                    certificateList.length,
                                                    (certificateListIndex) {
                                                  final certificateListItem =
                                                      certificateList[
                                                          certificateListIndex];
                                                  return Container(
                                                    width: () {
                                                      if (MediaQuery.sizeOf(
                                                                  context)
                                                              .width <
                                                          810.0) {
                                                        return ((MediaQuery.sizeOf(
                                                                        context)
                                                                    .width -
                                                                48) *
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
                                                                80) *
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
                                                                112) *
                                                            1 /
                                                            6);
                                                      } else {
                                                        return ((MediaQuery.sizeOf(
                                                                        context)
                                                                    .width -
                                                                112) *
                                                            1 /
                                                            6);
                                                      }
                                                    }(),
                                                    height: 300.0,
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
                                                          EdgeInsets.all(16.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
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
                                                                certificateListItem,
                                                                r'''$.imagePath''',
                                                              ).toString()}',
                                                              width: double
                                                                  .infinity,
                                                              height: 194.0,
                                                              fit: BoxFit.fill,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                Text(
                                                                  getJsonField(
                                                                    certificateListItem,
                                                                    r'''$.courseId.course''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  maxLines: 1,
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
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await actions
                                                                        .convertNetworkImageToPdf(
                                                                      '${FFAppConstants.imageUrl}${getJsonField(
                                                                        certificateListItem,
                                                                        r'''$.imagePath''',
                                                                      ).toString()}',
                                                                    );
                                                                  },
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(0.0),
                                                                        child: SvgPicture
                                                                            .asset(
                                                                          'assets/images/download.svg',
                                                                          width:
                                                                              24.0,
                                                                          height:
                                                                              24.0,
                                                                          fit: BoxFit
                                                                              .contain,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Download',
                                                                        maxLines:
                                                                            1,
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
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 2.0)),
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return wrapWithModel(
                                      model: _model.noCertificateModel,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NoCertificateWidget(),
                                    );
                                  }
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
