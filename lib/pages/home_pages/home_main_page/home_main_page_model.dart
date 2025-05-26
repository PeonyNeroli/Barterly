import '/flutter_flow/flutter_flow_util.dart';
import '/pages/favourite_pages/favourite_componant/favourite_componant_widget.dart';
import '/pages/home_pages/home_componant/home_componant_widget.dart';
import '/pages/profile_pages/profile_componant/profile_componant_widget.dart';
import '/pages/trending_course_pages/trending_course_componant/trending_course_componant_widget.dart';
import 'home_main_page_widget.dart' show HomeMainPageWidget;
import 'package:flutter/material.dart';

class HomeMainPageModel extends FlutterFlowModel<HomeMainPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for HomeComponant component.
  late HomeComponantModel homeComponantModel;
  // Model for TrendingCourseComponant component.
  late TrendingCourseComponantModel trendingCourseComponantModel;
  // Model for FavouriteComponant component.
  late FavouriteComponantModel favouriteComponantModel;
  // Model for ProfileComponant component.
  late ProfileComponantModel profileComponantModel;

  @override
  void initState(BuildContext context) {
    homeComponantModel = createModel(context, () => HomeComponantModel());
    trendingCourseComponantModel =
        createModel(context, () => TrendingCourseComponantModel());
    favouriteComponantModel =
        createModel(context, () => FavouriteComponantModel());
    profileComponantModel = createModel(context, () => ProfileComponantModel());
  }

  @override
  void dispose() {
    homeComponantModel.dispose();
    trendingCourseComponantModel.dispose();
    favouriteComponantModel.dispose();
    profileComponantModel.dispose();
  }
}
