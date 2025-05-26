import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'payment_sucessful_screen_model.dart';
export 'payment_sucessful_screen_model.dart';

class PaymentSucessfulScreenWidget extends StatefulWidget {
  const PaymentSucessfulScreenWidget({
    super.key,
    required this.courseId,
    required this.userId,
    required this.date,
    required this.payment,
    required this.paymentMode,
    required this.price,
  });

  final String? courseId;
  final String? userId;
  final String? date;
  final String? payment;
  final String? paymentMode;
  final double? price;

  static String routeName = 'PaymentSucessfulScreen';
  static String routePath = '/paymentSucessfulScreen';

  @override
  State<PaymentSucessfulScreenWidget> createState() =>
      _PaymentSucessfulScreenWidgetState();
}

class _PaymentSucessfulScreenWidgetState
    extends State<PaymentSucessfulScreenWidget> {
  late PaymentSucessfulScreenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentSucessfulScreenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().paymentSuccessCheck == true) {
        _model.bookingStripeStatus =
            await EducationAPIsGroup.enrollApiCall.call(
          courseId: widget.courseId,
          userId: FFAppState().userId,
          paymentMode: widget.paymentMode,
          price: widget.price,
          token: FFAppState().token,
          payment: 'success',
          date: functions.convertDate(getCurrentTimestamp.toString()),
          transactionId: FFAppState().paypalTransationId,
        );

        if (EducationAPIsGroup.enrollApiCall.success(
              (_model.bookingStripeStatus?.jsonBody ?? ''),
            ) ==
            1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                EducationAPIsGroup.enrollApiCall.message(
                  (_model.bookingStripeStatus?.jsonBody ?? ''),
                )!,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 2000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                EducationAPIsGroup.enrollApiCall.message(
                  (_model.bookingStripeStatus?.jsonBody ?? ''),
                )!,
                style: TextStyle(
                  color: FlutterFlowTheme.of(context).primaryText,
                ),
              ),
              duration: Duration(milliseconds: 2000),
              backgroundColor: FlutterFlowTheme.of(context).secondary,
            ),
          );
        }
      }
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
        backgroundColor: FlutterFlowTheme.of(context).cultured,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.asset(
                  'assets/images/confirm_payment_alrt.png',
                  width: 96.0,
                  height: 96.0,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 8.0),
                child: Text(
                  'Payment successfull!',
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'SF Pro Display',
                        fontSize: 28.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: false,
                      ),
                ),
              ),
              Text(
                'Congratulations, you have successfully paid.',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'SF Pro Display',
                      fontSize: 17.0,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
              ),
              Padding(
                padding:
                    EdgeInsetsDirectional.fromSTEB(100.0, 40.0, 100.0, 0.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    context.goNamed(CoursePaymentPageWidget.routeName);

                    FFAppState().clearOnGoingCacheCache();
                  },
                  text: 'Ok',
                  options: FFButtonOptions(
                    width: 190.0,
                    height: 46.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'SF Pro Display',
                          color: Colors.white,
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0.0,
                    ),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
