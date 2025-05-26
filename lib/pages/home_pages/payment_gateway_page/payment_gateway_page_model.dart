import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/index.dart';
import 'payment_gateway_page_widget.dart' show PaymentGatewayPageWidget;
import 'package:flutter/material.dart';

class PaymentGatewayPageModel
    extends FlutterFlowModel<PaymentGatewayPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Stores action output result for [Backend Call - API (EnrollApi)] action in Button widget.
  ApiCallResponse? bookingStripeStatus;

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
