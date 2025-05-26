import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/index.dart';
import 'checkout_payment_page_widget.dart' show CheckoutPaymentPageWidget;
import 'package:flutter/material.dart';

class CheckoutPaymentPageModel
    extends FlutterFlowModel<CheckoutPaymentPageWidget> {
  ///  Local state fields for this page.

  int? selectPayment = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetuserApi)] action in CheckoutPaymentPage widget.
  ApiCallResponse? getUserPaymentPageFunction;
  // Stores action output result for [Backend Call - API (isVerifyAccount)] action in CheckoutPaymentPage widget.
  ApiCallResponse? userVerifiedPaymentFunction;
  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
  }
}
