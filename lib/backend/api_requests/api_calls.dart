import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start EducationAPIs Group Code

class EducationAPIsGroup {
  static String getBaseUrl({
    String? token = '',
  }) =>
      'https://education.templatevilla.net/api/';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [token]',
  };
  static CheckregisteruserApiCall checkregisteruserApiCall =
      CheckregisteruserApiCall();
  static SignupApiCall signupApiCall = SignupApiCall();
  static VerifyotpApiCall verifyotpApiCall = VerifyotpApiCall();
  static SigninApiCall signinApiCall = SigninApiCall();
  static ForgotpasswordApiCall forgotpasswordApiCall = ForgotpasswordApiCall();
  static ForgotpasswordverificationApiCall forgotpasswordverificationApiCall =
      ForgotpasswordverificationApiCall();
  static ChangepasswordApiCall changepasswordApiCall = ChangepasswordApiCall();
  static UsereditApiCall usereditApiCall = UsereditApiCall();
  static ImageApiCall imageApiCall = ImageApiCall();
  static SliderApiCall sliderApiCall = SliderApiCall();
  static CategoryApiCall categoryApiCall = CategoryApiCall();
  static InstructorApiCall instructorApiCall = InstructorApiCall();
  static CurrencyApiCall currencyApiCall = CurrencyApiCall();
  static GetuserApiCall getuserApiCall = GetuserApiCall();
  static EnrollApiCall enrollApiCall = EnrollApiCall();
  static MycourselistApiCall mycourselistApiCall = MycourselistApiCall();
  static CourseFilterApiCall courseFilterApiCall = CourseFilterApiCall();
  static LessonApiCall lessonApiCall = LessonApiCall();
  static ReviewApiCall reviewApiCall = ReviewApiCall();
  static ReadlessonApiCall readlessonApiCall = ReadlessonApiCall();
  static TrendingcourseApiCall trendingcourseApiCall = TrendingcourseApiCall();
  static CompletedcourseApiCall completedcourseApiCall =
      CompletedcourseApiCall();
  static GetcertificateApiCall getcertificateApiCall = GetcertificateApiCall();
  static FavouriteApiCall favouriteApiCall = FavouriteApiCall();
  static GetfavouriteApiCall getfavouriteApiCall = GetfavouriteApiCall();
  static UnfavouriteApiCall unfavouriteApiCall = UnfavouriteApiCall();
  static LogoutApiCall logoutApiCall = LogoutApiCall();
  static DeleteaccountApiCall deleteaccountApiCall = DeleteaccountApiCall();
  static UserchatApiCall userchatApiCall = UserchatApiCall();
  static GetUserallchatApiCall getUserallchatApiCall = GetUserallchatApiCall();
  static SearchCourseApiCall searchCourseApiCall = SearchCourseApiCall();
  static CourseDetailApiCall courseDetailApiCall = CourseDetailApiCall();
  static RecentlyAddCourseApiCall recentlyAddCourseApiCall =
      RecentlyAddCourseApiCall();
  static GetAssignmentApiCall getAssignmentApiCall = GetAssignmentApiCall();
  static GetQuestionsApiCall getQuestionsApiCall = GetQuestionsApiCall();
  static AssignmentApiCall assignmentApiCall = AssignmentApiCall();
  static GetResultApiCall getResultApiCall = GetResultApiCall();
  static GetCertificateListApiCall getCertificateListApiCall =
      GetCertificateListApiCall();
  static IntroApiCall introApiCall = IntroApiCall();
  static CourseNameFilterApiCall courseNameFilterApiCall =
      CourseNameFilterApiCall();
  static PaymentMethodApiCall paymentMethodApiCall = PaymentMethodApiCall();
  static IsVerifyAccountCall isVerifyAccountCall = IsVerifyAccountCall();
  static ResendOtpCall resendOtpCall = ResendOtpCall();
  static ResetPasswordCall resetPasswordCall = ResetPasswordCall();
  static GetPageCall getPageCall = GetPageCall();
  static InstructorCourseCall instructorCourseCall = InstructorCourseCall();
  static GetAssignmentScoreCall getAssignmentScoreCall =
      GetAssignmentScoreCall();
}

class CheckregisteruserApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CheckregisteruserApi',
      apiUrl: '${baseUrl}/checkregisteruser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class SignupApiCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? email = '',
    String? password = '',
    String? phone = '',
    String? countryCode = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "firstname": "${firstname}",
  "lastname": "${lastname}",
  "email": "${email}",
  "password": "${password}",
  "country_code": "${countryCode}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SignupApi',
      apiUrl: '${baseUrl}/signup',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class VerifyotpApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VerifyotpApi',
      apiUrl: '${baseUrl}/verifyotp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  String? countryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country_code''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstname''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastname''',
      ));
}

class SigninApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SigninApi',
      apiUrl: '${baseUrl}/signin',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstname''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastname''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  bool? userActive(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.user.active''',
      ));
  String? userid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
}

class ForgotpasswordApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotpasswordApi',
      apiUrl: '${baseUrl}/forgotpassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ForgotpasswordverificationApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    int? otp,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "otp": ${otp}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ForgotpasswordverificationApi',
      apiUrl: '${baseUrl}/forgotpasswordverification',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ChangepasswordApiCall {
  Future<ApiCallResponse> call({
    String? currentPassword = '',
    String? newPassword = '',
    String? confirmPassword = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "currentPassword": "${currentPassword}",
  "newPassword": "${newPassword}",
  "confirmPassword": "${confirmPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ChangepasswordApi',
      apiUrl: '${baseUrl}/changepassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class UsereditApiCall {
  Future<ApiCallResponse> call({
    String? firstname = '',
    String? lastname = '',
    String? countryCode = '',
    String? avatar = '',
    String? phone = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "firstname": "${firstname}",
  "lastname": "${lastname}",
  "country_code": "${countryCode}",
  "avatar": "${avatar}",
  "phone": "${phone}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UsereditApi',
      apiUrl: '${baseUrl}/useredit',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ImageApiCall {
  Future<ApiCallResponse> call({
    FFUploadedFile? avatar,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'ImageApi',
      apiUrl: '${baseUrl}/image',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {
        'avatar': avatar,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SliderApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'SliderApi',
      apiUrl: '${baseUrl}/slider',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? sliderList(dynamic response) => getJsonField(
        response,
        r'''$.data.slider''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List<String>? sliderName(dynamic response) => (getJsonField(
        response,
        r'''$.data.slider[:].slider''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.slider[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseIdId(dynamic response) => (getJsonField(
        response,
        r'''$.data.slider[:].courseId._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseIdCourse(dynamic response) => (getJsonField(
        response,
        r'''$.data.slider[:].courseId.course''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? sliderId(dynamic response) => (getJsonField(
        response,
        r'''$.data.slider[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? courseIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.slider[:].courseId''',
        true,
      ) as List?;
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CategoryApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CategoryApi',
      apiUrl: '${baseUrl}/category',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? categoryList(dynamic response) => getJsonField(
        response,
        r'''$.data.category''',
        true,
      ) as List?;
  List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$.data.category[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data.category[:].category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryAvatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.category[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class InstructorApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'InstructorApi',
      apiUrl: '${baseUrl}/instructor',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CurrencyApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'CurrencyApi',
      apiUrl: '${baseUrl}/currency',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? currency(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.currencydetails.currency''',
      ));
}

class GetuserApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'GetuserApi',
      apiUrl: '${baseUrl}/getuser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user._id''',
      ));
  String? firstName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.firstname''',
      ));
  String? lastName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.lastname''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.email''',
      ));
  bool? active(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.user.active''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.phone''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.avatar''',
      ));
  String? countryCode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.user.country_code''',
      ));
  dynamic userDetail(dynamic response) => getJsonField(
        response,
        r'''$.data.user''',
      );
}

class EnrollApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? userId = '',
    String? date = '',
    String? payment = '',
    String? paymentMode = '',
    String? transactionId = '',
    double? price,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{ 
 "userId": "${userId}",
  "courseId": "${courseId}",
  "date": "${date}", 
  "paymentMode": "${paymentMode}",
  "transactionId": "${transactionId}",
  "price": ${price},
 "payment": "${payment}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EnrollApi',
      apiUrl: '${baseUrl}/enroll',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

class MycourselistApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MycourselistApi',
      apiUrl: '${baseUrl}/mycourselist',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? mycourseList(dynamic response) => getJsonField(
        response,
        r'''$.data.mycourse''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? courseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.mycourse[:].course._id''',
      ));
}

class CourseFilterApiCall {
  Future<ApiCallResponse> call({
    List<String>? categoryIdList,
    double? minPrice,
    double? maxPrice,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );
    final categoryId = _serializeList(categoryIdList);

    final ffApiRequestBody = '''
{
  "categoryId": ${categoryId},
  "min_price": ${minPrice},
  "max_price": ${maxPrice}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CourseFilterApi',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? categorydList(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryNameList(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].categoryId.category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? coursedetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class LessonApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'LessonApi',
      apiUrl: '${baseUrl}/lesson',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? lessonsList(dynamic response) => getJsonField(
        response,
        r'''$.data.lessons''',
        true,
      ) as List?;
  List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseId(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].courseId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? lesson(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].lesson''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? completed(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].completed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List? topicsList(dynamic response) => getJsonField(
        response,
        r'''$.data.lessons[:].topics''',
        true,
      ) as List?;
  List<String>? topicsId(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicsLessonId(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].lessonId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicsTopic(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].topic''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicsLink(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].link''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicsDescription(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? topicsAllFile(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].allfile''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? topicsCompleted(dynamic response) => (getJsonField(
        response,
        r'''$.data.lessons[:].topics[:].completed''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

class ReviewApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? userId = '',
    String? review = '',
    int? rating,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "userId": "${userId}",
  "review": "${review}",
  "rating": ${rating}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ReviewApi',
      apiUrl: '${baseUrl}/review',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ReadlessonApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? lessonId = '',
    String? topicId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "lessonId": "${lessonId}",
  "topicId": "${topicId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ReadlessonApi',
      apiUrl: '${baseUrl}/readlesson',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? done(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.course.done''',
      ));
}

class TrendingcourseApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TrendingcourseApi',
      apiUrl: '${baseUrl}/trendingcourse',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? trendingCoursesList(dynamic response) => getJsonField(
        response,
        r'''$.data.trendingCourses''',
        true,
      ) as List?;
  List<String>? trendingCoursesId(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? categoryIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.trendingCourses[:].categoryId''',
        true,
      ) as List?;
  List<String>? categoryId(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].categoryId._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryName(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].categoryId.category''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? categoryImage(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].categoryId.avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? instructorIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId''',
        true,
      ) as List?;
  List<String>? instructorIdId(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? instructorIdInstructor(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:].instructor''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? instructorIdAvatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? instructorIdDegree(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:].degree''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? instructorIdSpeciality(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:].speciality''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? instructorIdAbout(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].instructorId[:].about''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? course(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].course''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? videourl(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].videourl''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? language(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].language''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? about(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].about''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? skill(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].skill''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isCertified(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].is_Certified''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<bool>? isSecure(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].is_Secure''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
  List<String>? level(dynamic response) => (getJsonField(
        response,
        r'''$.data.trendingCourses[:].level''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CompletedcourseApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CompletedcourseApi',
      apiUrl: '${baseUrl}/completedcourse',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? mycourseList(dynamic response) => getJsonField(
        response,
        r'''$.data.mycourse''',
        true,
      ) as List?;
  String? courseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.mycourse[:].courseId._id''',
      ));
}

class GetcertificateApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetcertificateApi',
      apiUrl: '${baseUrl}/getcertificate',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? getcertificateList(dynamic response) => getJsonField(
        response,
        r'''$.data.getcertificate''',
        true,
      ) as List?;
  String? certificateTitle(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.getcertificate[:].certificateTitle''',
      ));
  String? imagePath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.getcertificate[:].imagePath''',
      ));
  String? courseName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.getcertificate[:].courseId.course''',
      ));
}

class FavouriteApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "courseId": "${courseId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'FavouriteApi',
      apiUrl: '${baseUrl}/favourite',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetfavouriteApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetfavouriteApi',
      apiUrl: '${baseUrl}/getfavourite',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? favoriteList(dynamic response) => getJsonField(
        response,
        r'''$.data.favorite''',
        true,
      ) as List?;
}

class UnfavouriteApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UnfavouriteApi',
      apiUrl: '${baseUrl}/unfavourite',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class LogoutApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'LogoutApi',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeleteaccountApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteaccountApi',
      apiUrl: '${baseUrl}/deleteaccount',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class UserchatApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? message = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserchatApi',
      apiUrl: '${baseUrl}/userchat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetUserallchatApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? page,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "page": ${page}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetUserallchatApi',
      apiUrl: '${baseUrl}/getallchat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? chatsList(dynamic response) => getJsonField(
        response,
        r'''$.data.chats''',
        true,
      ) as List?;
  List<String>? message(dynamic response) => (getJsonField(
        response,
        r'''$.data.chats[:].message''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<bool>? isadmin(dynamic response) => (getJsonField(
        response,
        r'''$.data.chats[:].is_admin''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<bool>(x))
          .withoutNulls
          .toList();
}

class SearchCourseApiCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "search": "${search}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchCourseApi',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? coursedetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class CourseDetailApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? userId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "userId": "${userId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CourseDetailApi',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? coursedetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? level(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].level''',
      ));
  String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].language''',
      ));
  String? about(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].about''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].duration''',
      ));
  String? skill(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].skill''',
      ));
  bool? isCertified(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.coursedetails[:].is_Certified''',
      ));
  bool? isSecure(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.data.coursedetails[:].is_Secure''',
      ));
  String? videourl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].videourl''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].avatar''',
      ));
  String? course(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].course''',
      ));
  String? instructorIdSpeciality(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:].speciality''',
      ));
  String? instructorIdAbout(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:].about''',
      ));
  String? instructorIdDegree(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:].degree''',
      ));
  String? instructorIdAvatar(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:].avatar''',
      ));
  String? instructorIdInstructor(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:].instructor''',
      ));
  String? instructorIdId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId[:]._id''',
      ));
  List? instructorIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails[:].instructorId''',
        true,
      ) as List?;
  dynamic categoryIdList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails[:].categoryId''',
      );
  String? categoryIdId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].categoryId._id''',
      ));
  String? categoryIdCategory(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].categoryId.category''',
      ));
  String? categoryIdAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].categoryId.avatar''',
      ));
  List? reviewList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails[:].reviews''',
        true,
      ) as List?;
  int? totalLessons(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].totalLessons''',
      ));
  int? isBuy(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].is_buy''',
      ));
  int? totalRating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].totalRating''',
      ));
  int? averageRating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].averageRating''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].status''',
      ));
  double? price(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.coursedetails[:].price''',
      ));
  dynamic ratingCounts(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails[:].ratingCounts''',
      );
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class RecentlyAddCourseApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'RecentlyAddCourseApi',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? coursedetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  List<String>? courseId(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseName(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].course''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseAvatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? coursePrice(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? courseDuration(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetAssignmentApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetAssignmentApi',
      apiUrl: '${baseUrl}/getassignment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? assignmentsId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.assignments[:]._id''',
      ));
  String? assignmentName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.assignments[:].assignment''',
      ));
  String? courseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.assignments[:].courseId''',
      ));
  List? assignmentsList(dynamic response) => getJsonField(
        response,
        r'''$.data.assignments''',
        true,
      ) as List?;
}

class GetQuestionsApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? assignmentId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "assignmentId": "${assignmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetQuestionsApi',
      apiUrl: '${baseUrl}/getquestions',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? questionsList(dynamic response) => getJsonField(
        response,
        r'''$.data.Questions''',
        true,
      ) as List?;
  List<String>? questionsId(dynamic response) => (getJsonField(
        response,
        r'''$.data.Questions[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? assignmentId(dynamic response) => (getJsonField(
        response,
        r'''$.data.Questions[:].assignmentId''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? assignmentText(dynamic response) => (getJsonField(
        response,
        r'''$.data.Questions[:].text''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? options(dynamic response) => getJsonField(
        response,
        r'''$.data.Questions[:].options''',
        true,
      ) as List?;
  List<String>? correctOption(dynamic response) => (getJsonField(
        response,
        r'''$.data.Questions[:].correctOption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class AssignmentApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? assignmentId = '',
    dynamic quizJson,
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final quiz = _serializeJson(quizJson, true);
    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "assignmentId": "${assignmentId}",
  "quiz": ${quiz}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AssignmentApi',
      apiUrl: '${baseUrl}/assignment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetResultApiCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? assignmentId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}",
  "assignmentId": "${assignmentId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetResultApi',
      apiUrl: '${baseUrl}/getresult',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? percentage(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.percentage''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  dynamic result(dynamic response) => getJsonField(
        response,
        r'''$.data.result''',
      );
  String? resultid(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.result._id''',
      ));
  String? userId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.result.userId''',
      ));
  String? courseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.result.courseId''',
      ));
  List? quizList(dynamic response) => getJsonField(
        response,
        r'''$.data.result.quiz''',
        true,
      ) as List?;
  List<String>? questionId(dynamic response) => (getJsonField(
        response,
        r'''$.data.result.quiz[:].questionId._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? correctOption(dynamic response) => (getJsonField(
        response,
        r'''$.data.result.quiz[:].questionId.correctOption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? done(dynamic response) => (getJsonField(
        response,
        r'''$.data.result.quiz[:].done''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? seletedOption(dynamic response) => (getJsonField(
        response,
        r'''$.data.result.quiz[:].seletedOption''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetCertificateListApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetCertificateListApi',
      apiUrl: '${baseUrl}/getcertificate_list',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? certificateList(dynamic response) => getJsonField(
        response,
        r'''$.data.certificateList''',
        true,
      ) as List?;
  String? imagePath(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.certificateList[:].imagePath''',
      ));
}

class IntroApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'IntroApi',
      apiUrl: '${baseUrl}/intro',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  List? introList(dynamic response) => getJsonField(
        response,
        r'''$.data.intro''',
        true,
      ) as List?;
  List<String>? title(dynamic response) => (getJsonField(
        response,
        r'''$.data.intro[:].intro''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? description(dynamic response) => (getJsonField(
        response,
        r'''$.data.intro[:].description''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.intro[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CourseNameFilterApiCall {
  Future<ApiCallResponse> call({
    String? categoryId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "categoryId": [
    "${categoryId}"
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CourseNameFilterApi',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? coursedetails(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  List<String>? courseName(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].course''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? avatar(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].avatar''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<int>? price(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? duration(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:].duration''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? courseId(dynamic response) => (getJsonField(
        response,
        r'''$.data.coursedetails[:]._id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class PaymentMethodApiCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'PaymentMethodApi',
      apiUrl: '${baseUrl}/payment_method',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? paypalIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].paypal.paypal_is_enable''',
      ));
  String? paypalPublicKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].paypal.paypal_public_key''',
      ));
  String? paypalPrivateKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].paypal.paypal_private_key''',
      ));
  int? stripeIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].stripe.stripe_is_enable''',
      ));
  String? stripePublishableKey(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].stripe.stripe_publishable_key''',
      ));
  String? stripeSecretKey(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].stripe.stripe_secret_key''',
      ));
  int? razorpayIsEnable(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].razorpay.razorpay_is_enable''',
      ));
  String? razorpayKeyId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].razorpay.razorpay_key_Id''',
      ));
  String? razorpayKeySecret(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].razorpay.razorpay_key_secret''',
      ));
  String? paypalMode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].paypal.paypal_mode''',
      ));
  String? stripeMode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].stripe.stripe_test_mode''',
      ));
  String? razorPayMode(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.paymentMethodDetails[:].razorpay.razorpay_mode''',
      ));
}

class IsVerifyAccountCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'isVerifyAccount',
      apiUrl: '${baseUrl}/isVerifyAccount',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResendOtpCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resendOtp',
      apiUrl: '${baseUrl}/resendOtp',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class ResetPasswordCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? newPassword = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "new_password": "${newPassword}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'resetPassword',
      apiUrl: '${baseUrl}/resetPassword',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetPageCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'getPage',
      apiUrl: '${baseUrl}/getPage',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? privatepolicy(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.page.private_policy''',
      ));
  String? termsandcondition(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data.page.terms_and_condition''',
      ));
  String? aboutus(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.page.about_us''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class InstructorCourseCall {
  Future<ApiCallResponse> call({
    String? instructorId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "instructorId": "${instructorId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'instructorCourse',
      apiUrl: '${baseUrl}/course',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  List? coursedetailsList(dynamic response) => getJsonField(
        response,
        r'''$.data.coursedetails''',
        true,
      ) as List?;
  String? couseId(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:]._id''',
      ));
  String? coursename(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].course''',
      ));
  String? courseAvatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].avatar''',
      ));
  String? videourl(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].videourl''',
      ));
  double? price(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.data.coursedetails[:].price''',
      ));
  String? language(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].language''',
      ));
  String? duration(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.coursedetails[:].duration''',
      ));
  int? totalRating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].totalRating''',
      ));
  int? averageRating(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.coursedetails[:].averageRating''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
}

class GetAssignmentScoreCall {
  Future<ApiCallResponse> call({
    String? courseId = '',
    String? token = '',
  }) async {
    final baseUrl = EducationAPIsGroup.getBaseUrl(
      token: token,
    );

    final ffApiRequestBody = '''
{
  "courseId": "${courseId}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getAssignmentScore',
      apiUrl: '${baseUrl}/getAssignmentScore',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? score(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.score''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
}

/// End EducationAPIs Group Code

/// Start EducationApiAdmin Group Code

class EducationApiAdminGroup {
  static String getBaseUrl({
    String? admintoken = '',
  }) =>
      'https://education.templatevictory.com/admin/api';
  static Map<String, String> headers = {
    'Authorization': 'Bearer [admintoken]',
  };
  static AdminLoginApiCall adminLoginApiCall = AdminLoginApiCall();
  static AdminLogoutApiCall adminLogoutApiCall = AdminLogoutApiCall();
  static AdminchatApiCall adminchatApiCall = AdminchatApiCall();
  static GetallchatApiCall getallchatApiCall = GetallchatApiCall();
  static SearchchatApiCall searchchatApiCall = SearchchatApiCall();
  static AllUserApiCall allUserApiCall = AllUserApiCall();
}

class AdminLoginApiCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdminLoginApi',
      apiUrl: '${baseUrl}/login',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? success(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.data.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.message''',
      ));
  String? adminToken(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.token''',
      ));
}

class AdminLogoutApiCall {
  Future<ApiCallResponse> call({
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AdminLogoutApi',
      apiUrl: '${baseUrl}/logout',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AdminchatApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    String? message = '',
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "message": "${message}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AdminchatApi',
      apiUrl: '${baseUrl}/adminchat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetallchatApiCall {
  Future<ApiCallResponse> call({
    String? userId = '',
    int? page,
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    final ffApiRequestBody = '''
{
  "userId": "${userId}",
  "page": ${page}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GetallchatApi',
      apiUrl: '${baseUrl}/getallchat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchchatApiCall {
  Future<ApiCallResponse> call({
    String? search = '',
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    final ffApiRequestBody = '''
{
  "search": "${search}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SearchchatApi',
      apiUrl: '${baseUrl}/searchchat',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AllUserApiCall {
  Future<ApiCallResponse> call({
    String? admintoken = '',
  }) async {
    final baseUrl = EducationApiAdminGroup.getBaseUrl(
      admintoken: admintoken,
    );

    return ApiManager.instance.makeApiCall(
      callName: 'AllUserApi',
      apiUrl: '${baseUrl}/alluser',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${admintoken}',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? firstname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.users[:].firstname''',
      ));
  String? lastname(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.users[:].lastname''',
      ));
  String? avatar(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.users[:].avatar''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.users[:].email''',
      ));
  String? phone(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data.users[:].phone''',
      ));
}

/// End EducationApiAdmin Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
