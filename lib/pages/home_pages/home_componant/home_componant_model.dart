import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/no_recently_add_course/no_recently_add_course_widget.dart';
import '/pages/componant/no_trending_course/no_trending_course_widget.dart';
import 'dart:async';
import 'home_componant_widget.dart' show HomeComponantWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeComponantModel extends FlutterFlowModel<HomeComponantWidget> {
  ///  State fields for stateful widgets in this component.

  bool apiRequestCompleted3 = false;
  String? apiRequestLastUniqueKey3;
  bool apiRequestCompleted4 = false;
  String? apiRequestLastUniqueKey4;
  bool apiRequestCompleted1 = false;
  String? apiRequestLastUniqueKey1;
  bool apiRequestCompleted2 = false;
  String? apiRequestLastUniqueKey2;
  bool apiRequestCompleted5 = false;
  String? apiRequestLastUniqueKey5;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - API (UnfavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllTrendingCourseDetete;
  // Stores action output result for [Backend Call - API (FavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllTrendingCourseAdd;
  // Model for NoTrendingCourse component.
  late NoTrendingCourseModel noTrendingCourseModel;
  // Stores action output result for [Backend Call - API (UnfavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllRecentlyCourseDetete;
  // Stores action output result for [Backend Call - API (FavouriteApi)] action in MainContainerComponant widget.
  ApiCallResponse? getAllRecentlyCourseAdd;
  // Model for NoRecentlyAddCourse component.
  late NoRecentlyAddCourseModel noRecentlyAddCourseModel;

  @override
  void initState(BuildContext context) {
    noTrendingCourseModel = createModel(context, () => NoTrendingCourseModel());
    noRecentlyAddCourseModel =
        createModel(context, () => NoRecentlyAddCourseModel());
  }

  @override
  void dispose() {
    noTrendingCourseModel.dispose();
    noRecentlyAddCourseModel.dispose();
  }

  /// Additional helper methods.
  Future waitForApiRequestCompleted3({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted3;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted4({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted4;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted1({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted1;
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
      final requestComplete = apiRequestCompleted2;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }

  Future waitForApiRequestCompleted5({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = apiRequestCompleted5;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
