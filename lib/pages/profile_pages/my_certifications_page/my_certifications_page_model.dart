import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/no_certificate/no_certificate_widget.dart';
import 'my_certifications_page_widget.dart' show MyCertificationsPageWidget;
import 'package:flutter/material.dart';

class MyCertificationsPageModel
    extends FlutterFlowModel<MyCertificationsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Model for NoCertificate component.
  late NoCertificateModel noCertificateModel;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    noCertificateModel = createModel(context, () => NoCertificateModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    noCertificateModel.dispose();
  }
}
