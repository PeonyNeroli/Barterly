import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componant/blank_componant/blank_componant_widget.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'filter_bottom_sheet_model.dart';
export 'filter_bottom_sheet_model.dart';

class FilterBottomSheetWidget extends StatefulWidget {
  const FilterBottomSheetWidget({super.key});

  @override
  State<FilterBottomSheetWidget> createState() =>
      _FilterBottomSheetWidgetState();
}

class _FilterBottomSheetWidgetState extends State<FilterBottomSheetWidget> {
  late FilterBottomSheetModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilterBottomSheetModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 100.0, 0.0, 0.0),
        child: SafeArea(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).primaryBackground,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 16.0),
              child: FutureBuilder<ApiCallResponse>(
                future: EducationAPIsGroup.currencyApiCall.call(
                  token: FFAppState().token,
                ),
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
                  final columnCurrencyApiResponse = snapshot.data!;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 70.0,
                            height: 5.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context).gainsboro,
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 16.0, 20.0, 12.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 44.0,
                              height: 44.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0.0, 0.0),
                            ),
                            Text(
                              'Filter',
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context).cultured,
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0.0, 0.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: SvgPicture.asset(
                                    'assets/images/close_ic.svg',
                                    width: 24.0,
                                    height: 24.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1.0,
                        thickness: 1.0,
                        color: FlutterFlowTheme.of(context).gainsboro,
                      ),
                      Expanded(
                        child: ListView(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            20.0,
                            0,
                            0,
                          ),
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 16.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 4.0, 0.0),
                                      child: Text(
                                        'Price',
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
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: custom_widgets.GetCurrencySymbool(
                                      width: 12.0,
                                      height: 20.0,
                                      isSimbool: EducationAPIsGroup
                                          .currencyApiCall
                                          .currency(
                                        columnCurrencyApiResponse.jsonBody,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .davysGrey,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  Text(
                                    '${FFAppState().lowerPrice.toString()}-',
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .davysGrey,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 4.0),
                                    child: custom_widgets.GetCurrencySymbool(
                                      width: 12.0,
                                      height: 20.0,
                                      isSimbool: EducationAPIsGroup
                                          .currencyApiCall
                                          .currency(
                                        columnCurrencyApiResponse.jsonBody,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .davysGrey,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                  Text(
                                    FFAppState().highPrice.toString(),
                                    textAlign: TextAlign.start,
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'SF Pro Display',
                                          color: FlutterFlowTheme.of(context)
                                              .davysGrey,
                                          fontSize: 17.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                          lineHeight: 1.0,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
                              child: custom_widgets.RangeSliderCustom(
                                width: double.infinity,
                                height: 50.0,
                              ),
                            ),
                            FutureBuilder<ApiCallResponse>(
                              future: FFAppState().categoryCache(
                                uniqueQueryKey: FFAppState().userId,
                                requestFn: () =>
                                    EducationAPIsGroup.categoryApiCall.call(),
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
                                final containerCategoryApiResponse =
                                    snapshot.data!;

                                return Container(
                                  decoration: BoxDecoration(),
                                  child: Visibility(
                                    visible: (EducationAPIsGroup.categoryApiCall
                                                    .categoryList(
                                                  containerCategoryApiResponse
                                                      .jsonBody,
                                                ) !=
                                                null &&
                                            (EducationAPIsGroup.categoryApiCall
                                                    .categoryList(
                                              containerCategoryApiResponse
                                                  .jsonBody,
                                            ))!
                                                .isNotEmpty) &&
                                        (EducationAPIsGroup.categoryApiCall
                                                .success(
                                              containerCategoryApiResponse
                                                  .jsonBody,
                                            ) ==
                                            1),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 24.0, 20.0, 16.0),
                                          child: Text(
                                            'Categories',
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
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20.0, 0.0, 20.0, 0.0),
                                          child: ListView(
                                            padding: EdgeInsets.zero,
                                            primary: false,
                                            shrinkWrap: true,
                                            scrollDirection: Axis.vertical,
                                            children: [
                                              if ((EducationAPIsGroup
                                                              .categoryApiCall
                                                              .categoryList(
                                                            containerCategoryApiResponse
                                                                .jsonBody,
                                                          ) !=
                                                          null &&
                                                      (EducationAPIsGroup
                                                              .categoryApiCall
                                                              .categoryList(
                                                        containerCategoryApiResponse
                                                            .jsonBody,
                                                      ))!
                                                          .isNotEmpty) &&
                                                  (EducationAPIsGroup
                                                          .categoryApiCall
                                                          .success(
                                                        containerCategoryApiResponse
                                                            .jsonBody,
                                                      ) ==
                                                      1))
                                                Builder(
                                                  builder: (context) {
                                                    final categoryList =
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
                                                      runSpacing: 8.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          categoryList.length,
                                                          (categoryListIndex) {
                                                        final categoryListItem =
                                                            categoryList[
                                                                categoryListIndex];
                                                        return InkWell(
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
                                                                    .categoryId
                                                                    .contains(
                                                                        getJsonField(
                                                                      categoryListItem,
                                                                      r'''$._id''',
                                                                    ).toString()) ==
                                                                true) {
                                                              FFAppState()
                                                                  .removeFromCategoryId(
                                                                      getJsonField(
                                                                categoryListItem,
                                                                r'''$._id''',
                                                              ).toString());
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            } else {
                                                              FFAppState()
                                                                  .addToCategoryId(
                                                                      getJsonField(
                                                                categoryListItem,
                                                                r'''$._id''',
                                                              ).toString());
                                                              FFAppState()
                                                                  .update(
                                                                      () {});
                                                            }
                                                          },
                                                          child: Container(
                                                            width: () {
                                                              if (MediaQuery.sizeOf(
                                                                          context)
                                                                      .width <
                                                                  810.0) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        56) *
                                                                    1 /
                                                                    2);
                                                              } else if ((MediaQuery.sizeOf(
                                                                              context)
                                                                          .width >=
                                                                      810.0) &&
                                                                  (MediaQuery.sizeOf(
                                                                              context)
                                                                          .width <
                                                                      1280.0)) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        88) *
                                                                    1 /
                                                                    4);
                                                              } else if (MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width >=
                                                                  1280.0) {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        120) *
                                                                    1 /
                                                                    6);
                                                              } else {
                                                                return ((MediaQuery.sizeOf(context)
                                                                            .width -
                                                                        152) *
                                                                    1 /
                                                                    8);
                                                              }
                                                            }(),
                                                            height: 50.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .categoryId
                                                                          .contains(
                                                                              getJsonField(
                                                                            categoryListItem,
                                                                            r'''$._id''',
                                                                          )
                                                                                  .toString()) ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          26.0),
                                                              border:
                                                                  Border.all(
                                                                color: FFAppState()
                                                                            .categoryId
                                                                            .contains(
                                                                                getJsonField(
                                                                              categoryListItem,
                                                                              r'''$._id''',
                                                                            )
                                                                                    .toString()) ==
                                                                        true
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .davysGrey,
                                                              ),
                                                            ),
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          6.0,
                                                                          16.0,
                                                                          6.0),
                                                              child: Text(
                                                                getJsonField(
                                                                  categoryListItem,
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
                                                                      color: FFAppState().categoryId.contains(getJsonField(
                                                                                    categoryListItem,
                                                                                    r'''$._id''',
                                                                                  ).toString()) ==
                                                                              true
                                                                          ? FlutterFlowTheme.of(context).primary
                                                                          : FlutterFlowTheme.of(context).davysGrey,
                                                                      fontSize:
                                                                          17.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          false,
                                                                      lineHeight:
                                                                          1.2,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().lowerPrice = 0.0;
                                  FFAppState().highPrice = 200.0;
                                  FFAppState().categoryId = [];
                                  FFAppState().filterVariable = false;
                                  FFAppState().update(() {});
                                  Navigator.pop(context);
                                },
                                text: 'Clear All',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: Colors.transparent,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 18.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        useGoogleFonts: false,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ),
                            Expanded(
                              child: FFButtonWidget(
                                onPressed: () async {
                                  _model.filterApi = await EducationAPIsGroup
                                      .courseFilterApiCall
                                      .call(
                                    categoryIdList: FFAppState().categoryId,
                                    minPrice: FFAppState().lowerPrice,
                                    maxPrice: FFAppState().highPrice,
                                  );

                                  FFAppState().filterVariable = true;
                                  FFAppState().update(() {});
                                  FFAppState().clearCategoryFilterCacheCache();
                                  Navigator.pop(context);

                                  safeSetState(() {});
                                },
                                text: 'Apply',
                                options: FFButtonOptions(
                                  width: double.infinity,
                                  height: 56.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'SF Pro Display',
                                        color: FlutterFlowTheme.of(context)
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
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                showLoadingIndicator: false,
                              ),
                            ),
                          ]
                              .divide(SizedBox(width: 20.0))
                              .addToStart(SizedBox(width: 20.0))
                              .addToEnd(SizedBox(width: 20.0)),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
