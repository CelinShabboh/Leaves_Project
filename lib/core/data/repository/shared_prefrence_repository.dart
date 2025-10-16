import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void setRememberMe(bool value) {
    setPrefrenc(type: DataType.BOOL, key: REMEMBER, value: value);
  }

  bool? getRememberMe() {
    return getPrefrence(REMEMBER);
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

void setLoginData({
  required String accessToken,
  required String refreshToken,
  required int employeeId,
  required String employeeName,
  required int companyId,
  required int departmentId,
  required DateTime accessTokenExpiry,
}) {
  setPrefrenc(type: DataType.STRING, key: accessTokenKey, value: accessToken);
  setPrefrenc(type: DataType.STRING, key: refreshTokenKey, value: refreshToken);
  setPrefrenc(type: DataType.INT, key: 'employee_id', value: employeeId);
  setPrefrenc(type: DataType.STRING, key: 'employee_name', value: employeeName);
  setPrefrenc(type: DataType.INT, key: 'company_id', value: companyId);
  setPrefrenc(type: DataType.INT, key: 'department_id', value: departmentId);
  setPrefrenc(
      type: DataType.STRING,
      key: accessTokenExpiryKey,
      value: accessTokenExpiry.toIso8601String());
}

String? getAccessToken() => getPrefrence(accessTokenKey);
String? getRefreshToken() => getPrefrence(refreshTokenKey);
int? getEmployeeId() => getPrefrence('employee_id');
String? getEmployeeName() => getPrefrence('employee_name');
int? getCompanyId() => getPrefrence('company_id');
int? getDepartmentId() => getPrefrence('department_id');
DateTime? getAccessTokenExpiry() {
  final expiry = getPrefrence(accessTokenExpiryKey);
  if (expiry != null) return DateTime.parse(expiry);
  return null;
}

void clearLoginData() {
  pref.remove(accessTokenKey);
  pref.remove(refreshTokenKey);
  pref.remove('employee_id');
  pref.remove('employee_name');
  pref.remove('company_id');
  pref.remove('department_id');
  pref.remove(accessTokenExpiryKey);
}

bool isTokenValid() {
  final expiry = getAccessTokenExpiry();
  if (expiry == null) return false;
  return DateTime.now().isBefore(expiry);
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

  Future<void> deleteConditionsList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("conditions_list");
  }
}
