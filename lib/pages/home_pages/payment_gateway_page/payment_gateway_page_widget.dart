import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/payment_dialog/payment_dialog_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'payment_gateway_page_model.dart';
export 'payment_gateway_page_model.dart';

class PaymentGatewayPageWidget extends StatefulWidget {
  const PaymentGatewayPageWidget({
    super.key,
    required this.price,
    required this.paymentToName,
    required this.paymentMethod,
    required this.cureencySymbol,
    required this.courseId,
    required this.stripeSecretKey,
    required this.stripePublishableKey,
  });

  final double? price;
  final String? paymentToName;
  final String? paymentMethod;
  final String? cureencySymbol;
  final String? courseId;
  final String? stripeSecretKey;
  final String? stripePublishableKey;

  static String routeName = 'PaymentGatewayPage';
  static String routePath = '/paymentGatewayPage';

  @override
  State<PaymentGatewayPageWidget> createState() =>
      _PaymentGatewayPageWidgetState();
}

class _PaymentGatewayPageWidgetState extends State<PaymentGatewayPageWidget>
    with TickerProviderStateMixin {
  late PaymentGatewayPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentGatewayPageModel());

    animationsMap.addAll({
      'buttonOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
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
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      wrapWithModel(
                        model: _model.customCenterAppbarModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CustomCenterAppbarWidget(
                          title: 'Payment',
                          backIcon: false,
                          addIcon: false,
                          onTapAdd: () async {},
                          onTapBack: () async {},
                        ),
                      ),
                      Expanded(
                        child: FutureBuilder<ApiCallResponse>(
                          future: EducationAPIsGroup.paymentMethodApiCall.call(
                            token: FFAppState().token,
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
                            final containerPaymentMethodApiResponse =
                                snapshot.data!;

                            return Container(
                              decoration: BoxDecoration(),
                              child: FutureBuilder<ApiCallResponse>(
                                future: FFAppState().getUserCache(
                                  uniqueQueryKey: FFAppState().userId,
                                  requestFn: () =>
                                      EducationAPIsGroup.getuserApiCall.call(
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
                                  final containerGetuserApiResponse =
                                      snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Builder(
                                      builder: (context) {
                                        if (EducationAPIsGroup
                                                .paymentMethodApiCall
                                                .success(
                                              containerPaymentMethodApiResponse
                                                  .jsonBody,
                                            ) ==
                                            1) {
                                          return Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                      0,
                                                      16.0,
                                                      0,
                                                      16.0,
                                                    ),
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 32.0,
                                                              color: Color(
                                                                  0x289A90B8),
                                                              offset: Offset(
                                                                0.0,
                                                                9.0,
                                                              ),
                                                            )
                                                          ],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      22.0),
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
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            16.0),
                                                                child: Text(
                                                                  'Your Secured Payment Detail',
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
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            1.5,
                                                                      ),
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 1.0,
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dividerColor,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      'Name:',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .start,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
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
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          '${functions.capitalizeFirst(EducationAPIsGroup.getuserApiCall.firstName(
                                                                            containerGetuserApiResponse.jsonBody,
                                                                          )!)} ${EducationAPIsGroup.getuserApiCall.lastName(
                                                                            containerGetuserApiResponse.jsonBody,
                                                                          )}',
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 17.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 1.0,
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dividerColor,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Mobile No:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
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
                                                                    Text(
                                                                      '+${EducationAPIsGroup.getuserApiCall.countryCode(
                                                                        containerGetuserApiResponse
                                                                            .jsonBody,
                                                                      )} ${EducationAPIsGroup.getuserApiCall.phone(
                                                                        containerGetuserApiResponse
                                                                            .jsonBody,
                                                                      )}',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            fontSize:
                                                                                15.0,
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
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 1.0,
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dividerColor,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        16.0,
                                                                        0.0,
                                                                        16.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Amount:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
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
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              3.0),
                                                                          child:
                                                                              custom_widgets.GetCurrencySymbool(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                17.0,
                                                                            isSimbool:
                                                                                widget.cureencySymbol,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                15.0,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          (widget.price!)
                                                                              .toStringAsFixed(2),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.2,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                              Divider(
                                                                height: 1.0,
                                                                thickness: 2.0,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .dividerColor,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            16.0,
                                                                            0.0,
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
                                                                      'Course Name:',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                'SF Pro Display',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                15.0,
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
                                                                    Expanded(
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            1.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            widget.paymentToName,
                                                                            'CouseName',
                                                                          ),
                                                                          textAlign:
                                                                              TextAlign.end,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: 'SF Pro Display',
                                                                                fontSize: 15.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                useGoogleFonts: false,
                                                                                lineHeight: 1.5,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          12.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    20.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Your payment will be processed securely via ${widget.paymentMethod}',
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'SF Pro Display',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                useGoogleFonts:
                                                                    false,
                                                                lineHeight: 1.5,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                ),
                                                child: Builder(
                                                  builder: (context) => Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                24.0,
                                                                20.0,
                                                                30.0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        if (widget
                                                                .paymentMethod ==
                                                            'Paypal') {
                                                          await actions
                                                              .paypalCustom(
                                                            context,
                                                            EducationAPIsGroup
                                                                .paymentMethodApiCall
                                                                .paypalPublicKey(
                                                              containerPaymentMethodApiResponse
                                                                  .jsonBody,
                                                            )!,
                                                            EducationAPIsGroup
                                                                .paymentMethodApiCall
                                                                .paypalPrivateKey(
                                                              containerPaymentMethodApiResponse
                                                                  .jsonBody,
                                                            )!,
                                                            widget.price!
                                                                .toString(),
                                                            widget
                                                                .cureencySymbol!,
                                                            () async {
                                                              context.goNamed(
                                                                PaymentSucessfulScreenWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'courseId':
                                                                      serializeParam(
                                                                    widget
                                                                        .courseId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userId':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                        .userId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'date':
                                                                      serializeParam(
                                                                    functions.convertDate(
                                                                        getCurrentTimestamp
                                                                            .toString()),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'payment':
                                                                      serializeParam(
                                                                    'success',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'paymentMode':
                                                                      serializeParam(
                                                                    widget
                                                                        .paymentMethod,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'price':
                                                                      serializeParam(
                                                                    widget
                                                                        .price,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            () async {
                                                              context.goNamed(
                                                                PaymentFailedPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'courseId':
                                                                      serializeParam(
                                                                    widget
                                                                        .courseId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userId':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                        .userId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'date':
                                                                      serializeParam(
                                                                    functions.convertDate(
                                                                        getCurrentTimestamp
                                                                            .toString()),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'payment':
                                                                      serializeParam(
                                                                    'Success',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'paymentMode':
                                                                      serializeParam(
                                                                    '',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'price':
                                                                      serializeParam(
                                                                    widget
                                                                        .price,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            () async {
                                                              context.pushNamed(
                                                                PaymentFailedPageWidget
                                                                    .routeName,
                                                                queryParameters:
                                                                    {
                                                                  'courseId':
                                                                      serializeParam(
                                                                    widget
                                                                        .courseId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'userId':
                                                                      serializeParam(
                                                                    FFAppState()
                                                                        .userId,
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'date':
                                                                      serializeParam(
                                                                    functions.convertDate(
                                                                        getCurrentTimestamp
                                                                            .toString()),
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'payment':
                                                                      serializeParam(
                                                                    'Success',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'paymentMode':
                                                                      serializeParam(
                                                                    '',
                                                                    ParamType
                                                                        .String,
                                                                  ),
                                                                  'price':
                                                                      serializeParam(
                                                                    widget
                                                                        .price,
                                                                    ParamType
                                                                        .double,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          if (widget
                                                                  .paymentMethod ==
                                                              'Stripe') {
                                                            await actions
                                                                .initStripe(
                                                              EducationAPIsGroup
                                                                  .paymentMethodApiCall
                                                                  .stripePublishableKey(
                                                                containerPaymentMethodApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                            );
                                                            await actions
                                                                .stripeCustom(
                                                              context,
                                                              widget.price!
                                                                  .toString(),
                                                              widget
                                                                  .cureencySymbol!,
                                                              () async {
                                                                _model.bookingStripeStatus =
                                                                    await EducationAPIsGroup
                                                                        .enrollApiCall
                                                                        .call(
                                                                  courseId: widget
                                                                      .courseId,
                                                                  userId:
                                                                      FFAppState()
                                                                          .userId,
                                                                  paymentMode:
                                                                      widget
                                                                          .paymentMethod,
                                                                  price: widget
                                                                      .price,
                                                                  token:
                                                                      FFAppState()
                                                                          .token,
                                                                  payment:
                                                                      'success',
                                                                  date: functions
                                                                      .convertDate(
                                                                          getCurrentTimestamp
                                                                              .toString()),
                                                                  transactionId:
                                                                      FFAppState()
                                                                          .paypalTransationId,
                                                                );

                                                                if (EducationAPIsGroup
                                                                        .enrollApiCall
                                                                        .success(
                                                                      (_model.bookingStripeStatus
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    ) ==
                                                                    1) {
                                                                  await actions
                                                                      .showCustomToastBottom(
                                                                    EducationAPIsGroup
                                                                        .enrollApiCall
                                                                        .message(
                                                                      (_model.bookingStripeStatus
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                  );
                                                                  await showDialog(
                                                                    barrierDismissible:
                                                                        false,
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                PaymentDialogWidget(
                                                                              onTapHome: () async {
                                                                                Navigator.pop(context);
                                                                                FFAppState().clearOnGoingCacheCache();

                                                                                context.goNamed(CoursePaymentPageWidget.routeName);
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                } else {
                                                                  await actions
                                                                      .showCustomToastBottom(
                                                                    EducationAPIsGroup
                                                                        .enrollApiCall
                                                                        .message(
                                                                      (_model.bookingStripeStatus
                                                                              ?.jsonBody ??
                                                                          ''),
                                                                    )!,
                                                                  );

                                                                  context.goNamed(
                                                                      HomeMainPageWidget
                                                                          .routeName);
                                                                }
                                                              },
                                                              () async {
                                                                context.goNamed(
                                                                  PaymentFailedPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'courseId':
                                                                        serializeParam(
                                                                      widget
                                                                          .courseId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'userId':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .userId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'date':
                                                                        serializeParam(
                                                                      functions.convertDate(
                                                                          getCurrentTimestamp
                                                                              .toString()),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'payment':
                                                                        serializeParam(
                                                                      'Success',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'paymentMode':
                                                                        serializeParam(
                                                                      '',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'price':
                                                                        serializeParam(
                                                                      widget
                                                                          .price,
                                                                      ParamType
                                                                          .double,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              EducationAPIsGroup
                                                                  .paymentMethodApiCall
                                                                  .stripeSecretKey(
                                                                containerPaymentMethodApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                            );
                                                          } else {
                                                            await actions
                                                                .razorpayCustom(
                                                              context,
                                                              EducationAPIsGroup
                                                                  .paymentMethodApiCall
                                                                  .razorpayKeySecret(
                                                                containerPaymentMethodApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                              widget.price!
                                                                  .toString(),
                                                              '${EducationAPIsGroup.getuserApiCall.firstName(
                                                                containerGetuserApiResponse
                                                                    .jsonBody,
                                                              )} ${EducationAPIsGroup.getuserApiCall.lastName(
                                                                containerGetuserApiResponse
                                                                    .jsonBody,
                                                              )}',
                                                              'for by a service',
                                                              '+${EducationAPIsGroup.getuserApiCall.countryCode(
                                                                containerGetuserApiResponse
                                                                    .jsonBody,
                                                              )} ${EducationAPIsGroup.getuserApiCall.phone(
                                                                containerGetuserApiResponse
                                                                    .jsonBody,
                                                              )}',
                                                              EducationAPIsGroup
                                                                  .getuserApiCall
                                                                  .email(
                                                                containerGetuserApiResponse
                                                                    .jsonBody,
                                                              )!,
                                                              () async {
                                                                context.goNamed(
                                                                  PaymentSucessfulScreenWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'courseId':
                                                                        serializeParam(
                                                                      widget
                                                                          .courseId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'userId':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .userId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'date':
                                                                        serializeParam(
                                                                      functions.convertDate(
                                                                          getCurrentTimestamp
                                                                              .toString()),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'payment':
                                                                        serializeParam(
                                                                      'success',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'paymentMode':
                                                                        serializeParam(
                                                                      widget
                                                                          .paymentMethod,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'price':
                                                                        serializeParam(
                                                                      widget
                                                                          .price,
                                                                      ParamType
                                                                          .double,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              () async {
                                                                context.goNamed(
                                                                  PaymentFailedPageWidget
                                                                      .routeName,
                                                                  queryParameters:
                                                                      {
                                                                    'courseId':
                                                                        serializeParam(
                                                                      widget
                                                                          .courseId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'userId':
                                                                        serializeParam(
                                                                      FFAppState()
                                                                          .userId,
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'date':
                                                                        serializeParam(
                                                                      functions.convertDate(
                                                                          getCurrentTimestamp
                                                                              .toString()),
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'payment':
                                                                        serializeParam(
                                                                      'Success',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'paymentMode':
                                                                        serializeParam(
                                                                      '',
                                                                      ParamType
                                                                          .String,
                                                                    ),
                                                                    'price':
                                                                        serializeParam(
                                                                      widget
                                                                          .price,
                                                                      ParamType
                                                                          .double,
                                                                    ),
                                                                  }.withoutNulls,
                                                                );
                                                              },
                                                              widget
                                                                  .cureencySymbol!,
                                                            );
                                                          }
                                                        }

                                                        safeSetState(() {});
                                                      },
                                                      text: 'Pay Now',
                                                      options: FFButtonOptions(
                                                        width: double.infinity,
                                                        height: 54.0,
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    24.0,
                                                                    0.0,
                                                                    24.0,
                                                                    0.0),
                                                        iconPadding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleSmall
                                                                .override(
                                                                  fontFamily:
                                                                      'SF Pro Display',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      18.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                        elevation: 0.0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(16.0),
                                                      ),
                                                    ).animateOnPageLoad(
                                                        animationsMap[
                                                            'buttonOnPageLoadAnimation']!),
                                                  ),
                                                ),
                                              ),
                                            ],
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
