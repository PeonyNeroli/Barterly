import '/flutter_flow/flutter_flow_util.dart';
import '/pages/componant/custom_center_appbar/custom_center_appbar_widget.dart';
import '/pages/componant/no_review_course/no_review_course_widget.dart';
import 'recentreviews_page_widget.dart' show RecentreviewsPageWidget;
import 'package:flutter/material.dart';

class RecentreviewsPageModel extends FlutterFlowModel<RecentreviewsPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for Custom_center_appbar component.
  late CustomCenterAppbarModel customCenterAppbarModel;
  // Model for NoReviewCourse component.
  late NoReviewCourseModel noReviewCourseModel;

  @override
  void initState(BuildContext context) {
    customCenterAppbarModel =
        createModel(context, () => CustomCenterAppbarModel());
    noReviewCourseModel = createModel(context, () => NoReviewCourseModel());
  }

  @override
  void dispose() {
    customCenterAppbarModel.dispose();
    noReviewCourseModel.dispose();
  }
}
