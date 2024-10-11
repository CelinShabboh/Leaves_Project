import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dental_project/core/data/repository/shared_prefrence_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

bool isPhoneValid(String phone) {
  return RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(phone);
}

bool isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isComplexPassword(String password) {
  RegExp regex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$&*~]).{8,}$',
  );
  return regex.hasMatch(password);
}

double screenWidth(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.width / percent;
  else
    return Get.size.height / percent;
}

double screenHeight(double percent) {
  BuildContext context = Get.context!;
  if (context.isPortrait)
    return Get.size.height / percent;
  else
    return Get.size.width / percent;
}

SharedPrefrenceRepository get storage => Get.find<SharedPrefrenceRepository>();
//ConnectivitySerivce get connectivitySerivce => Get.find<ConnectivitySerivce>();
bool isOnline = false;
bool checkConnect() {
  return isOnline;
}
