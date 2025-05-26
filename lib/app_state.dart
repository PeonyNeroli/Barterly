import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _isIntro = prefs.getBool('ff_isIntro') ?? _isIntro;
    });
    _safeInit(() {
      _isLogin = prefs.getBool('ff_isLogin') ?? _isLogin;
    });
    _safeInit(() {
      _searchList = prefs.getStringList('ff_searchList') ?? _searchList;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _favChange = prefs.getBool('ff_favChange') ?? _favChange;
    });
    _safeInit(() {
      _userId = prefs.getString('ff_userId') ?? _userId;
    });
    _safeInit(() {
      if (prefs.containsKey('ff_userDetail')) {
        try {
          _userDetail = jsonDecode(prefs.getString('ff_userDetail') ?? '');
        } catch (e) {
          print("Can't decode persisted json. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _favText = prefs.getString('ff_favText') ?? _favText;
    });
    _safeInit(() {
      _deviceId = prefs.getString('ff_deviceId') ?? _deviceId;
    });
    _safeInit(() {
      _messageList = prefs.getStringList('ff_messageList')?.map((x) {
            try {
              return jsonDecode(x);
            } catch (e) {
              print("Can't decode persisted json. Error: $e.");
              return {};
            }
          }).toList() ??
          _messageList;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _isIntro = false;
  bool get isIntro => _isIntro;
  set isIntro(bool value) {
    _isIntro = value;
    prefs.setBool('ff_isIntro', value);
  }

  bool _isLogin = false;
  bool get isLogin => _isLogin;
  set isLogin(bool value) {
    _isLogin = value;
    prefs.setBool('ff_isLogin', value);
  }

  int _introIndex = 0;
  int get introIndex => _introIndex;
  set introIndex(int value) {
    _introIndex = value;
  }

  double _lowerPrice = 0.0;
  double get lowerPrice => _lowerPrice;
  set lowerPrice(double value) {
    _lowerPrice = value;
  }

  double _highPrice = 200.0;
  double get highPrice => _highPrice;
  set highPrice(double value) {
    _highPrice = value;
  }

  List<String> _searchList = [];
  List<String> get searchList => _searchList;
  set searchList(List<String> value) {
    _searchList = value;
    prefs.setStringList('ff_searchList', value);
  }

  void addToSearchList(String value) {
    searchList.add(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeFromSearchList(String value) {
    searchList.remove(value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void removeAtIndexFromSearchList(int index) {
    searchList.removeAt(index);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void updateSearchListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    searchList[index] = updateFn(_searchList[index]);
    prefs.setStringList('ff_searchList', _searchList);
  }

  void insertAtIndexInSearchList(int index, String value) {
    searchList.insert(index, value);
    prefs.setStringList('ff_searchList', _searchList);
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  bool _favChange = false;
  bool get favChange => _favChange;
  set favChange(bool value) {
    _favChange = value;
    prefs.setBool('ff_favChange', value);
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
    prefs.setString('ff_userId', value);
  }

  dynamic _userDetail = jsonDecode('{}');
  dynamic get userDetail => _userDetail;
  set userDetail(dynamic value) {
    _userDetail = value;
    prefs.setString('ff_userDetail', jsonEncode(value));
  }

  String _currency = '';
  String get currency => _currency;
  set currency(String value) {
    _currency = value;
  }

  bool _connected = true;
  bool get connected => _connected;
  set connected(bool value) {
    _connected = value;
  }

  List<String> _categoryId = [];
  List<String> get categoryId => _categoryId;
  set categoryId(List<String> value) {
    _categoryId = value;
  }

  void addToCategoryId(String value) {
    categoryId.add(value);
  }

  void removeFromCategoryId(String value) {
    categoryId.remove(value);
  }

  void removeAtIndexFromCategoryId(int index) {
    categoryId.removeAt(index);
  }

  void updateCategoryIdAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryId[index] = updateFn(_categoryId[index]);
  }

  void insertAtIndexInCategoryId(int index, String value) {
    categoryId.insert(index, value);
  }

  bool _filterVariable = false;
  bool get filterVariable => _filterVariable;
  set filterVariable(bool value) {
    _filterVariable = value;
  }

  String _courseId = '';
  String get courseId => _courseId;
  set courseId(String value) {
    _courseId = value;
  }

  String _lessonId = '';
  String get lessonId => _lessonId;
  set lessonId(String value) {
    _lessonId = value;
  }

  String _topicId = '';
  String get topicId => _topicId;
  set topicId(String value) {
    _topicId = value;
  }

  int _selectedPageIndex = 0;
  int get selectedPageIndex => _selectedPageIndex;
  set selectedPageIndex(int value) {
    _selectedPageIndex = value;
  }

  bool _paymentSuccessCheck = false;
  bool get paymentSuccessCheck => _paymentSuccessCheck;
  set paymentSuccessCheck(bool value) {
    _paymentSuccessCheck = value;
  }

  String _paypalTransationId = '';
  String get paypalTransationId => _paypalTransationId;
  set paypalTransationId(String value) {
    _paypalTransationId = value;
  }

  List<dynamic> _ansList = [jsonDecode('{}')];
  List<dynamic> get ansList => _ansList;
  set ansList(List<dynamic> value) {
    _ansList = value;
  }

  void addToAnsList(dynamic value) {
    ansList.add(value);
  }

  void removeFromAnsList(dynamic value) {
    ansList.remove(value);
  }

  void removeAtIndexFromAnsList(int index) {
    ansList.removeAt(index);
  }

  void updateAnsListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    ansList[index] = updateFn(_ansList[index]);
  }

  void insertAtIndexInAnsList(int index, dynamic value) {
    ansList.insert(index, value);
  }

  String _phone = '';
  String get phone => _phone;
  set phone(String value) {
    _phone = value;
  }

  String _countryCode = '91';
  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
  }

  String _countryCodeEdit = '';
  String get countryCodeEdit => _countryCodeEdit;
  set countryCodeEdit(String value) {
    _countryCodeEdit = value;
  }

  String _countryName = 'IN';
  String get countryName => _countryName;
  set countryName(String value) {
    _countryName = value;
  }

  String _favText = '     Course added to favorite     ';
  String get favText => _favText;
  set favText(String value) {
    _favText = value;
    prefs.setString('ff_favText', value);
  }

  String _unfavText = '     Course removed from favorite     ';
  String get unfavText => _unfavText;
  set unfavText(String value) {
    _unfavText = value;
  }

  List<Color> _colorList = [Color(4280500367), Color(4294967295)];
  List<Color> get colorList => _colorList;
  set colorList(List<Color> value) {
    _colorList = value;
  }

  void addToColorList(Color value) {
    colorList.add(value);
  }

  void removeFromColorList(Color value) {
    colorList.remove(value);
  }

  void removeAtIndexFromColorList(int index) {
    colorList.removeAt(index);
  }

  void updateColorListAtIndex(
    int index,
    Color Function(Color) updateFn,
  ) {
    colorList[index] = updateFn(_colorList[index]);
  }

  void insertAtIndexInColorList(int index, Color value) {
    colorList.insert(index, value);
  }

  String _deviceId = 'TP1A.220624.018';
  String get deviceId => _deviceId;
  set deviceId(String value) {
    _deviceId = value;
    prefs.setString('ff_deviceId', value);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  List<dynamic> _messageList = [];
  List<dynamic> get messageList => _messageList;
  set messageList(List<dynamic> value) {
    _messageList = value;
    prefs.setStringList(
        'ff_messageList', value.map((x) => jsonEncode(x)).toList());
  }

  void addToMessageList(dynamic value) {
    messageList.add(value);
    prefs.setStringList(
        'ff_messageList', _messageList.map((x) => jsonEncode(x)).toList());
  }

  void removeFromMessageList(dynamic value) {
    messageList.remove(value);
    prefs.setStringList(
        'ff_messageList', _messageList.map((x) => jsonEncode(x)).toList());
  }

  void removeAtIndexFromMessageList(int index) {
    messageList.removeAt(index);
    prefs.setStringList(
        'ff_messageList', _messageList.map((x) => jsonEncode(x)).toList());
  }

  void updateMessageListAtIndex(
    int index,
    dynamic Function(dynamic) updateFn,
  ) {
    messageList[index] = updateFn(_messageList[index]);
    prefs.setStringList(
        'ff_messageList', _messageList.map((x) => jsonEncode(x)).toList());
  }

  void insertAtIndexInMessageList(int index, dynamic value) {
    messageList.insert(index, value);
    prefs.setStringList(
        'ff_messageList', _messageList.map((x) => jsonEncode(x)).toList());
  }

  final _getUserCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getUserCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getUserCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetUserCacheCache() => _getUserCacheManager.clear();
  void clearGetUserCacheCacheKey(String? uniqueKey) =>
      _getUserCacheManager.clearRequest(uniqueKey);

  final _sliderCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> sliderCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _sliderCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSliderCacheCache() => _sliderCacheManager.clear();
  void clearSliderCacheCacheKey(String? uniqueKey) =>
      _sliderCacheManager.clearRequest(uniqueKey);

  final _categoryCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> categoryCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoryCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryCacheCache() => _categoryCacheManager.clear();
  void clearCategoryCacheCacheKey(String? uniqueKey) =>
      _categoryCacheManager.clearRequest(uniqueKey);

  final _trendingCourseCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> trendingCourseCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _trendingCourseCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTrendingCourseCacheCache() => _trendingCourseCacheManager.clear();
  void clearTrendingCourseCacheCacheKey(String? uniqueKey) =>
      _trendingCourseCacheManager.clearRequest(uniqueKey);

  final _currencyCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> currencyCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _currencyCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCurrencyCacheCache() => _currencyCacheManager.clear();
  void clearCurrencyCacheCacheKey(String? uniqueKey) =>
      _currencyCacheManager.clearRequest(uniqueKey);

  final _categoryFilterCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> categoryFilterCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _categoryFilterCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoryFilterCacheCache() => _categoryFilterCacheManager.clear();
  void clearCategoryFilterCacheCacheKey(String? uniqueKey) =>
      _categoryFilterCacheManager.clearRequest(uniqueKey);

  final _completedCourseCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> completedCourseCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _completedCourseCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCompletedCourseCacheCache() => _completedCourseCacheManager.clear();
  void clearCompletedCourseCacheCacheKey(String? uniqueKey) =>
      _completedCourseCacheManager.clearRequest(uniqueKey);

  final _getFavouriteCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> getFavouriteCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _getFavouriteCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearGetFavouriteCacheCache() => _getFavouriteCacheManager.clear();
  void clearGetFavouriteCacheCacheKey(String? uniqueKey) =>
      _getFavouriteCacheManager.clearRequest(uniqueKey);

  final _recentlyAddCourseCacheManager =
      FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> recentlyAddCourseCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _recentlyAddCourseCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearRecentlyAddCourseCacheCache() =>
      _recentlyAddCourseCacheManager.clear();
  void clearRecentlyAddCourseCacheCacheKey(String? uniqueKey) =>
      _recentlyAddCourseCacheManager.clearRequest(uniqueKey);

  final _myCourseDetailCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> myCourseDetailCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _myCourseDetailCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyCourseDetailCacheCache() => _myCourseDetailCacheManager.clear();
  void clearMyCourseDetailCacheCacheKey(String? uniqueKey) =>
      _myCourseDetailCacheManager.clearRequest(uniqueKey);

  final _onGoingCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> onGoingCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _onGoingCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearOnGoingCacheCache() => _onGoingCacheManager.clear();
  void clearOnGoingCacheCacheKey(String? uniqueKey) =>
      _onGoingCacheManager.clearRequest(uniqueKey);

  final _privacyCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> privacyCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _privacyCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPrivacyCacheCache() => _privacyCacheManager.clear();
  void clearPrivacyCacheCacheKey(String? uniqueKey) =>
      _privacyCacheManager.clearRequest(uniqueKey);

  final _termCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> termCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _termCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearTermCacheCache() => _termCacheManager.clear();
  void clearTermCacheCacheKey(String? uniqueKey) =>
      _termCacheManager.clearRequest(uniqueKey);

  final _myCertificateShimmerManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> myCertificateShimmer({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _myCertificateShimmerManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMyCertificateShimmerCache() => _myCertificateShimmerManager.clear();
  void clearMyCertificateShimmerCacheKey(String? uniqueKey) =>
      _myCertificateShimmerManager.clearRequest(uniqueKey);

  final _aboutCacheManager = FutureRequestManager<ApiCallResponse>();
  Future<ApiCallResponse> aboutCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ApiCallResponse> Function() requestFn,
  }) =>
      _aboutCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearAboutCacheCache() => _aboutCacheManager.clear();
  void clearAboutCacheCacheKey(String? uniqueKey) =>
      _aboutCacheManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

Color? _colorFromIntValue(int? val) {
  if (val == null) {
    return null;
  }
  return Color(val);
}
