import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'verified_email_otp_dialog_widget.dart'
    show VerifiedEmailOtpDialogWidget;
import 'package:flutter/material.dart';

class VerifiedEmailOtpDialogModel
    extends FlutterFlowModel<VerifiedEmailOtpDialogWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for PinCode widget.
  TextEditingController? pinCodeController;
  FocusNode? pinCodeFocusNode;
  String? Function(BuildContext, String?)? pinCodeControllerValidator;
  String? _pinCodeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter a valid OTP';
    }
    if (val.length < 4) {
      return 'Requires 4 characters.';
    }
    return null;
  }

  // Stores action output result for [Backend Call - API (VerifyotpApi)] action in Button widget.
  ApiCallResponse? otpVerificationFunction;

  @override
  void initState(BuildContext context) {
    pinCodeController = TextEditingController();
    pinCodeControllerValidator = _pinCodeControllerValidator;
  }

  @override
  void dispose() {
    pinCodeFocusNode?.dispose();
    pinCodeController?.dispose();
  }
}
