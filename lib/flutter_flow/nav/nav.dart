import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? SigninPageWidget() : SplashPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? SigninPageWidget()
              : SplashPageWidget(),
        ),
        FFRoute(
          name: SplashPageWidget.routeName,
          path: SplashPageWidget.routePath,
          builder: (context, params) => SplashPageWidget(),
        ),
        FFRoute(
          name: OnBoardingPageWidget.routeName,
          path: OnBoardingPageWidget.routePath,
          builder: (context, params) => OnBoardingPageWidget(
            introList: params.getParam<dynamic>(
              'introList',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: SigninPageWidget.routeName,
          path: SigninPageWidget.routePath,
          builder: (context, params) => SigninPageWidget(),
        ),
        FFRoute(
          name: ForgotPasswordPageWidget.routeName,
          path: ForgotPasswordPageWidget.routePath,
          builder: (context, params) => ForgotPasswordPageWidget(),
        ),
        FFRoute(
          name: SignUpPageWidget.routeName,
          path: SignUpPageWidget.routePath,
          builder: (context, params) => SignUpPageWidget(),
        ),
        FFRoute(
          name: TermsandPrivacyPageWidget.routeName,
          path: TermsandPrivacyPageWidget.routePath,
          builder: (context, params) => TermsandPrivacyPageWidget(),
        ),
        FFRoute(
          name: VerificationPageWidget.routeName,
          path: VerificationPageWidget.routePath,
          builder: (context, params) => VerificationPageWidget(
            firstname: params.getParam(
              'firstname',
              ParamType.String,
            ),
            lastname: params.getParam(
              'lastname',
              ParamType.String,
            ),
            email: params.getParam(
              'email',
              ParamType.String,
            ),
            password: params.getParam(
              'password',
              ParamType.String,
            ),
            phone: params.getParam(
              'phone',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ResetPasswordPageWidget.routeName,
          path: ResetPasswordPageWidget.routePath,
          builder: (context, params) => ResetPasswordPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ForgotVerificationPageWidget.routeName,
          path: ForgotVerificationPageWidget.routePath,
          builder: (context, params) => ForgotVerificationPageWidget(
            email: params.getParam(
              'email',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MorePageWidget.routeName,
          path: MorePageWidget.routePath,
          builder: (context, params) => MorePageWidget(),
        ),
        FFRoute(
          name: MyCertificationsPageWidget.routeName,
          path: MyCertificationsPageWidget.routePath,
          builder: (context, params) => MyCertificationsPageWidget(),
        ),
        FFRoute(
          name: PrivacypolicyPageWidget.routeName,
          path: PrivacypolicyPageWidget.routePath,
          builder: (context, params) => PrivacypolicyPageWidget(),
        ),
        FFRoute(
          name: FeedbackPageWidget.routeName,
          path: FeedbackPageWidget.routePath,
          builder: (context, params) => FeedbackPageWidget(),
        ),
        FFRoute(
          name: MyCoursesDetailPageWidget.routeName,
          path: MyCoursesDetailPageWidget.routePath,
          builder: (context, params) => MyCoursesDetailPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: MyCoursesVideoOldPageWidget.routeName,
          path: MyCoursesVideoOldPageWidget.routePath,
          builder: (context, params) => MyCoursesVideoOldPageWidget(
            videoLink: params.getParam(
              'videoLink',
              ParamType.String,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            lessonId: params.getParam(
              'lessonId',
              ParamType.String,
            ),
            topicId: params.getParam(
              'topicId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: TrendingCourseAllPageWidget.routeName,
          path: TrendingCourseAllPageWidget.routePath,
          builder: (context, params) => TrendingCourseAllPageWidget(),
        ),
        FFRoute(
          name: RecentlyAddcoursePageWidget.routeName,
          path: RecentlyAddcoursePageWidget.routePath,
          builder: (context, params) => RecentlyAddcoursePageWidget(),
        ),
        FFRoute(
          name: ChooseYourPlanPageWidget.routeName,
          path: ChooseYourPlanPageWidget.routePath,
          builder: (context, params) => ChooseYourPlanPageWidget(),
        ),
        FFRoute(
          name: CheckoutPaymentPageWidget.routeName,
          path: CheckoutPaymentPageWidget.routePath,
          builder: (context, params) => CheckoutPaymentPageWidget(
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            courseName: params.getParam(
              'courseName',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
            courseImage: params.getParam(
              'courseImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CoursesDetailPageWidget.routeName,
          path: CoursesDetailPageWidget.routePath,
          builder: (context, params) => CoursesDetailPageWidget(
            id: params.getParam(
              'id',
              ParamType.String,
            ),
            courseName: params.getParam(
              'courseName',
              ParamType.String,
            ),
            currencySymbol: params.getParam(
              'currencySymbol',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SearchPageWidget.routeName,
          path: SearchPageWidget.routePath,
          builder: (context, params) => SearchPageWidget(),
        ),
        FFRoute(
          name: EditProfilePageWidget.routeName,
          path: EditProfilePageWidget.routePath,
          builder: (context, params) => EditProfilePageWidget(),
        ),
        FFRoute(
          name: MyProfilePageWidget.routeName,
          path: MyProfilePageWidget.routePath,
          builder: (context, params) => MyProfilePageWidget(),
        ),
        FFRoute(
          name: RecentreviewsPageWidget.routeName,
          path: RecentreviewsPageWidget.routePath,
          builder: (context, params) => RecentreviewsPageWidget(
            reviewsList: params.getParam<dynamic>(
              'reviewsList',
              ParamType.JSON,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: MyCompleteCoursesDetailPageWidget.routeName,
          path: MyCompleteCoursesDetailPageWidget.routePath,
          builder: (context, params) => MyCompleteCoursesDetailPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            courseName: params.getParam(
              'courseName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: HomeMainPageWidget.routeName,
          path: HomeMainPageWidget.routePath,
          builder: (context, params) => HomeMainPageWidget(),
        ),
        FFRoute(
          name: PaymentFailedPageWidget.routeName,
          path: PaymentFailedPageWidget.routePath,
          builder: (context, params) => PaymentFailedPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            date: params.getParam(
              'date',
              ParamType.String,
            ),
            payment: params.getParam(
              'payment',
              ParamType.String,
            ),
            paymentMode: params.getParam(
              'paymentMode',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: PaymentSucessfulScreenWidget.routeName,
          path: PaymentSucessfulScreenWidget.routePath,
          builder: (context, params) => PaymentSucessfulScreenWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            userId: params.getParam(
              'userId',
              ParamType.String,
            ),
            date: params.getParam(
              'date',
              ParamType.String,
            ),
            payment: params.getParam(
              'payment',
              ParamType.String,
            ),
            paymentMode: params.getParam(
              'paymentMode',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.double,
            ),
          ),
        ),
        FFRoute(
          name: PaymentGatewayPageWidget.routeName,
          path: PaymentGatewayPageWidget.routePath,
          builder: (context, params) => PaymentGatewayPageWidget(
            price: params.getParam(
              'price',
              ParamType.double,
            ),
            paymentToName: params.getParam(
              'paymentToName',
              ParamType.String,
            ),
            paymentMethod: params.getParam(
              'paymentMethod',
              ParamType.String,
            ),
            cureencySymbol: params.getParam(
              'cureencySymbol',
              ParamType.String,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            stripeSecretKey: params.getParam(
              'stripeSecretKey',
              ParamType.String,
            ),
            stripePublishableKey: params.getParam(
              'stripePublishableKey',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QuizPageWidget.routeName,
          path: QuizPageWidget.routePath,
          builder: (context, params) => QuizPageWidget(
            assignmentsId: params.getParam(
              'assignmentsId',
              ParamType.String,
            ),
            assignmentsName: params.getParam(
              'assignmentsName',
              ParamType.String,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            courseName: params.getParam(
              'courseName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AssignmentPageWidget.routeName,
          path: AssignmentPageWidget.routePath,
          builder: (context, params) => AssignmentPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            courseName: params.getParam(
              'courseName',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: QuizResultPageWidget.routeName,
          path: QuizResultPageWidget.routePath,
          builder: (context, params) => QuizResultPageWidget(
            assignmentsId: params.getParam(
              'assignmentsId',
              ParamType.String,
            ),
            assignmentsName: params.getParam(
              'assignmentsName',
              ParamType.String,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CertificationsPageWidget.routeName,
          path: CertificationsPageWidget.routePath,
          builder: (context, params) => CertificationsPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ReviewPageWidget.routeName,
          path: ReviewPageWidget.routePath,
          builder: (context, params) => ReviewPageWidget(
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CategoryListPageWidget.routeName,
          path: CategoryListPageWidget.routePath,
          builder: (context, params) => CategoryListPageWidget(
            categoryId: params.getParam(
              'categoryId',
              ParamType.String,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CategoryAllPageWidget.routeName,
          path: CategoryAllPageWidget.routePath,
          builder: (context, params) => CategoryAllPageWidget(),
        ),
        FFRoute(
          name: ChatDetailPageWidget.routeName,
          path: ChatDetailPageWidget.routePath,
          builder: (context, params) => ChatDetailPageWidget(),
        ),
        FFRoute(
          name: CoursePaymentPageWidget.routeName,
          path: CoursePaymentPageWidget.routePath,
          builder: (context, params) => CoursePaymentPageWidget(),
        ),
        FFRoute(
          name: InstructorProfilePageWidget.routeName,
          path: InstructorProfilePageWidget.routePath,
          builder: (context, params) => InstructorProfilePageWidget(
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            degree: params.getParam(
              'degree',
              ParamType.String,
            ),
            instructorId: params.getParam(
              'instructorId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: AboutUsPageWidget.routeName,
          path: AboutUsPageWidget.routePath,
          builder: (context, params) => AboutUsPageWidget(),
        ),
        FFRoute(
          name: MyCoursesVideoPageWidget.routeName,
          path: MyCoursesVideoPageWidget.routePath,
          builder: (context, params) => MyCoursesVideoPageWidget(
            link: params.getParam(
              'link',
              ParamType.String,
            ),
            courseId: params.getParam(
              'courseId',
              ParamType.String,
            ),
            lessonId: params.getParam(
              'lessonId',
              ParamType.String,
            ),
            topicId: params.getParam(
              'topicId',
              ParamType.String,
            ),
            name: params.getParam(
              'name',
              ParamType.String,
            ),
            description: params.getParam(
              'description',
              ParamType.String,
            ),
            url: params.getParam(
              'url',
              ParamType.String,
            ),
            video: params.getParam(
              'video',
              ParamType.String,
            ),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splashPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
