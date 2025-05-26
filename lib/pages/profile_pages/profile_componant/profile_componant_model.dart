import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/single_appbar/single_appbar_widget.dart';
import 'profile_componant_widget.dart' show ProfileComponantWidget;
import 'package:flutter/material.dart';

class ProfileComponantModel extends FlutterFlowModel<ProfileComponantWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }
}
