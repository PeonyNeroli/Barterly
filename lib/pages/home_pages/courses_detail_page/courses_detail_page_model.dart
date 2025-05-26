import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/no_review_componant/no_review_componant_widget.dart';
import '/index.dart';
import 'courses_detail_page_widget.dart' show CoursesDetailPageWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CoursesDetailPageModel extends FlutterFlowModel<CoursesDetailPageWidget> {
  ///  Local state fields for this page.

  int? indexTabbar = 0;

  bool isProcess = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (GetuserApi)] action in CoursesDetailPage widget.
  ApiCallResponse? getUserDetailPageFunction;
  // Stores action output result for [Backend Call - API (isVerifyAccount)] action in CoursesDetailPage widget.
  ApiCallResponse? userVerifiedDetailPageFunction;
  Completer<ApiCallResponse>? apiRequestCompleter1;
  // Stores action output result for [Backend Call - API (UnfavouriteApi)] action in Container widget.
  ApiCallResponse? getAllTrendingCourseDetete;
  // Stores action output result for [Backend Call - API (FavouriteApi)] action in Container widget.
  ApiCallResponse? getAllTrendingCourseAdd;
  Completer<ApiCallResponse>? apiRequestCompleter2;
  // Model for NoReviewComponant component.
  late NoReviewComponantModel noReviewComponantModel;
  // Stores action output result for [Backend Call - API (EnrollApi)] action in Button widget.
  ApiCallResponse? bookingFreeStatus;

  @override
  void initState(BuildContext context) {
    noReviewComponantModel =
        createModel(context, () => NoReviewComponantModel());
  }

  @override
  void dispose() {
    noReviewComponantModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter1?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted2({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleter2?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
