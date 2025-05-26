import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/index.dart';
import 'dart:async';
import 'recently_addcourse_page_widget.dart' show RecentlyAddcoursePageWidget;
import 'package:flutter/material.dart';

class RecentlyAddcoursePageModel
    extends FlutterFlowModel<RecentlyAddcoursePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  bool apiRequestCompleted = false;
  String? apiRequestLastUniqueKey;
  // Stores action output result for [Backend Call - API (UnfavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllTrendingCourseDetete;
  // Stores action output result for [Backend Call - API (FavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllTrendingCourseAdd;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
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
