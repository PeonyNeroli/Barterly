// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/gestures.dart';
import 'dart:async';
import '/backend/api_requests/api_calls.dart';

class ForgotTimerWidget extends StatefulWidget {
  const ForgotTimerWidget({
    super.key,
    this.width,
    this.height,
    this.email,
  });

  final double? width;
  final double? height;

  final String? email;

  @override
  State<ForgotTimerWidget> createState() => _ForgotTimerWidgetState();
}

class _ForgotTimerWidgetState extends State<ForgotTimerWidget> {
  Timer? timer;
  int secondsLeft = 60;

  void startTimer() {
    timer = new Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (secondsLeft > 0) {
          secondsLeft--;
        } else {
          timer.cancel(); // Stop the timer when it reaches 0
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  String formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    String second = remainingSeconds.toString().padLeft(2, '0');
    return '$minutes:$second';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(0, -1),
          child: Text(
            formatTime(secondsLeft),
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              color: FlutterFlowTheme.of(context).primaryText,
              fontWeight: FontWeight.w600,
              fontSize: 18.0,
              height: 1.5,
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, -1),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: RichText(
              textScaler: MediaQuery.of(context).textScaler,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Don’t receive an code? ",
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'SF Pro Display',
                          color: FlutterFlowTheme.of(context).primaryText,
                          fontSize: 17,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w400,
                          useGoogleFonts: false,
                          lineHeight: 1.5,
                        ),
                  ),
                  TextSpan(
                    text: 'Resend now',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      color: secondsLeft == 0
                          ? FlutterFlowTheme.of(context).primaryText
                          : FlutterFlowTheme.of(context).spanishGray,
                      //  color: FlutterFlowTheme.of(context).primaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      height: 1.5,
                    ),
                    mouseCursor: SystemMouseCursors.click,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        if (secondsLeft == 0) {
                          secondsLeft = 60;
                          startTimer();

                          await EducationAPIsGroup.forgotpasswordApiCall.call(
                            email: widget!.email,
                          );
                          await actions.showCustomToastBottom(
                            '     OTP Resend!     ',
                          );

                          setState(() {});
                        }
                      },
                  )
                ],
                style: FlutterFlowTheme.of(context).bodyMedium,
              ),
            ),
          ),
        )
      ],
    );
  }
}
