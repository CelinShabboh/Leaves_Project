
import 'package:dental_project/core/data/models/token_info.dart';
import 'package:dental_project/core/data/models/user_info.dart';

class UserLoginInfo {
  UserInfo? userInfo;
  Tokens? tokens;

  UserLoginInfo({
    this.userInfo,
    this.tokens,
  });

  factory UserLoginInfo.fromJson(Map<String, dynamic> json) => UserLoginInfo(
    userInfo: UserInfo.fromJson(json['user_info']),
    tokens: Tokens.fromJson(json['tokens']),
  );

  Map<String, dynamic> toJson() => {
    'user_info': userInfo?.toJson(),
    'tokens': tokens?.toJson(),
  };
}
