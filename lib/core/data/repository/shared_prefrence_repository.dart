import 'dart:convert';
import 'dart:io';

import 'package:dental_project/core/data/models/doctor_info.dart';
import 'package:dental_project/core/data/models/token_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/condition_model.dart';
import '../models/exhibition_model.dart';
import '../models/user_info.dart';
import '../models/user_login_info.dart';

enum DataType {
  INT,
  STRING,
  BOOL,
  DOUBLE,
  LISTSTRING,
}

class SharedPrefrenceRepository {
  SharedPreferences pref = Get.find<SharedPreferences>();

  //!---- Keys  ------
  static const String PREF_FIRST_LUNCH = 'first_lunch';
  //static const String LOGIN = 'login';
  static const String PREF_USER_LOGIN_INFO = 'user_login_info';
  static const String REMEMBER = 'remeber';
  static const String PREF_APP_LANG = 'app_language';
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String PREF_USER_INFO = 'user_info';
  static const String accessTokenExpiryKey = 'access_token_expiry';
  static const String refreshTokenExpiryKey = 'refresh_token_expiry';
  static const String nameis = "name";
  static const String passis = "pass";
  static const String PREF_IMAGE_FILE = "FILE_PATH";
  static const String PREF_NAME = "name";
  static const String PREF_PHONE = "phone";
  static const String PREF_USERTYPE = "user";
  static const String _imageModelKey = 'image_model_key';

  // حفظ كائن ImageModel في SharedPreferences
  static Future<bool> saveImageModel(ImageModel imageModel) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(_imageModelKey, json.encode(imageModel.toJson()));
  }

  // استرجاع كائن ImageModel من SharedPreferences
  static Future<ImageModel?> getImageModel() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_imageModelKey);

    if (jsonString != null) {
      return ImageModel.fromJson(json.decode(jsonString));
    } else {
      return null;
    }
  }


  void setTokens(Tokens tokens) {
    final jsonTokens = jsonEncode(tokens.toJson());
    pref.setString(accessTokenKey, jsonTokens);
  }

  void setUserType(String userType) {
    pref.setString(PREF_USERTYPE, userType);
  }

  String getUserType() {
    return pref.getString(PREF_USERTYPE) ?? "";
  }

  Tokens getTokens() {
    final jsonTokens = pref.getString(accessTokenKey);

    if (jsonTokens != null) {
      final Map<String, dynamic> tokensMap = jsonDecode(jsonTokens);
      return Tokens.fromJson(tokensMap);
    } else {
      return Tokens();
    }
  }

  // void setUserInfo(UserInfo userInfo) {
  //   setPrefrenc(
  //       type: DataType.STRING,
  //       key: PREF_USER_INFO,
  //       value: jsonEncode(userInfo.toJson()));
  // }

  //  UserInfo getUserInfo() {
  //   String? userInfoJson = getPrefrence(PREF_USER_INFO);
  //   if (userInfoJson != null) {
  //     return UserInfo.fromJson(jsonDecode(userInfoJson));
  //   } else {
  //     return UserInfo(); // يمكنك تعيين القيم الافتراضية هنا إذا لم يتم العثور على البيانات في SharedPreferences
  //   }
  // }

  void setUserInfo(UserInfo userInfo) {
    final jsonUserInfo = jsonEncode(userInfo.toJson());
    pref.setString(PREF_USER_INFO, jsonUserInfo);
  }

  void setDoctorInfo(DoctorInfo userInfo) {
    final jsonUserInfo = jsonEncode(userInfo.toJson());
    pref.setString(PREF_USER_INFO, jsonUserInfo);
  }

  DoctorInfo getDoctorInfo() {
    final jsonUserInfo = pref.getString(PREF_USER_INFO);

    if (jsonUserInfo != null) {
      final Map<String, dynamic> userInfoMap = jsonDecode(jsonUserInfo);
      return DoctorInfo.fromJson(userInfoMap);
    } else {
      return DoctorInfo();
    }
  }

  UserInfo getUserInfo() {
    final jsonUserInfo = pref.getString(PREF_USER_INFO);

    if (jsonUserInfo != null) {
      final Map<String, dynamic> userInfoMap = jsonDecode(jsonUserInfo);
      return UserInfo.fromJson(userInfoMap);
    } else {
      return UserInfo();
    }
  }

  void setAccessTokenExpiry(int expiryTimeMillis) {
    setPrefrenc(
        type: DataType.INT, key: accessTokenExpiryKey, value: expiryTimeMillis);
  }

  int? getAccessTokenExpiry() {
    return getPrefrence(accessTokenExpiryKey);
  }

  void setRefreshTokenExpiry(int expiryTimeMillis) {
    setPrefrenc(
        type: DataType.INT,
        key: refreshTokenExpiryKey,
        value: expiryTimeMillis);
  }

  int? getRefreshTokenExpiry() {
    return getPrefrence(refreshTokenExpiryKey);
  }

  // في الداخل SharedPrefrenceRepository

  void setRememberMe(bool value) {
    setPrefrenc(type: DataType.BOOL, key: REMEMBER, value: value);
  }

  bool? getRememberMe() {
    return getPrefrence(REMEMBER);
  }

  void setSavedPhone(String phone) {
    setPrefrenc(type: DataType.STRING, key: PREF_PHONE, value: phone);
  }

  String? getSavedPhone() {
    return getPrefrence(PREF_PHONE);
  }

  void setSavedPassword(String password) {
    setPrefrenc(type: DataType.STRING, key: passis, value: password);
  }

  String? getSavedPassword() {
    return getPrefrence(passis);
  }

  void setFilePath(File file) {
    setPrefrenc(type: DataType.STRING, key: PREF_IMAGE_FILE, value: file.path);
  }

  File? getFilePath() {
    if (pref.containsKey(PREF_IMAGE_FILE)) {
      return File(getPrefrence(PREF_IMAGE_FILE));
    } else
      return null;
  }

  void setAppLanguage(String code) {
    setPrefrenc(type: DataType.STRING, key: PREF_APP_LANG, value: code);
  }

  String getAppLanguage() {
    if (pref.containsKey(PREF_APP_LANG)) {
      return getPrefrence(PREF_APP_LANG);
    } else {
      return 'en';
    }
  }

  void setname(String name) {
    setPrefrenc(type: DataType.STRING, key: nameis, value: name);
  }

  String getname() {
    if (pref.containsKey(nameis)) {
      return getPrefrence(nameis);
    } else {
      return "";
    }
  }

  void setpass(String pass) {
    setPrefrenc(type: DataType.STRING, key: passis, value: pass);
  }

  String getpass() {
    if (pref.containsKey(passis)) {
      return getPrefrence(passis);
    } else {
      return "";
    }
  }

  // void setlogin(bool value) {
  //   setPrefrenc(type: DataType.BOOL, key: LOGIN, value: value);
  // }

  // bool getlogin() {
  //   if (pref.containsKey(LOGIN))
  //     return getPrefrence(LOGIN);
  //   else
  //     return false;
  // }
  bool isAuth() {
    if (!pref.containsKey(accessTokenKey) ||
        pref.getString(accessTokenKey) == "") {
      return false;
    } else {
      return true;
    }
  }

  void setFirstLunch(bool value) {
    setPrefrenc(type: DataType.BOOL, key: PREF_FIRST_LUNCH, value: value);
  }

  bool getFirstLunch() {
    if (pref.containsKey(PREF_FIRST_LUNCH))
      return getPrefrence(PREF_FIRST_LUNCH);
    else
      return true;
  }

  void setPrefrenc({
    required DataType type,
    required String key,
    required dynamic value,
  }) async {
    switch (type) {
      case DataType.INT:
        await pref.setInt(key, value);
        break;
      case DataType.STRING:
        await pref.setString(key, value);
        break;
      case DataType.BOOL:
        await pref.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await pref.setDouble(key, value);
        break;
      case DataType.LISTSTRING:
        await pref.setStringList(key, value);
        break;
    }
  }

  dynamic getPrefrence(String key) {
    return pref.get(key);
  }

  Future<void> saveConditionsList(List<ConditionsModel> conditions) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> jsonStringList =
        conditions.map((person) => jsonEncode(person.toJson())).toList();
    await prefs.setStringList('conditions_list', jsonStringList);
  }

  Future<List<ConditionsModel>> getConditionsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? jsonStringList = prefs.getStringList('conditions_list');

    if (jsonStringList != null) {
      return jsonStringList
          .map((jsonString) => ConditionsModel.fromJson(jsonDecode(jsonString)))
          .toList();
    }

    return [];
  }

  Future<void> deleteConditionsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("conditions_list");
  }
}
