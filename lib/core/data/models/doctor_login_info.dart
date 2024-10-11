

import 'package:dental_project/core/data/models/doctor_info.dart';
import 'package:dental_project/core/data/models/token_info.dart';

class DoctorLoginInfo {
  DoctorInfo? userInfo;
  Tokens? tokens;

  DoctorLoginInfo({
    this.userInfo,
    this.tokens,
  });

  factory DoctorLoginInfo.fromJson(Map<String, dynamic> json) => DoctorLoginInfo(
    userInfo: DoctorInfo.fromJson(json['user_info']),
    tokens: Tokens.fromJson(json['tokens']),
  );

  Map<String, dynamic> toJson() => {
    'user_info': userInfo?.toJson(),
    'tokens': tokens?.toJson(),
  };
}
