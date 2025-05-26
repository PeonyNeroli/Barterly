import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/single_appbar/single_appbar_widget.dart';
import 'dart:async';
import 'favourite_componant_widget.dart' show FavouriteComponantWidget;
import 'package:flutter/material.dart';

class FavouriteComponantModel
    extends FlutterFlowModel<FavouriteComponantWidget> {
  ///  Local state fields for this component.

  bool onTapChange = false;

  ///  State fields for stateful widgets in this component.

  // Model for SingleAppbar component.
  late SingleAppbarModel singleAppbarModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (UnfavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllTrendingCourseDetete;

  @override
  void initState(BuildContext context) {
    singleAppbarModel = createModel(context, () => SingleAppbarModel());
  }

  @override
  void dispose() {
    singleAppbarModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
