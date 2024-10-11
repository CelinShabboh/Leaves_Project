class RefreshToken {
  String? access_token;

  RefreshToken.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'] as String;
  }


  Map<String, dynamic> toJson() {
    return {
      'access_token': access_token,
    };
  }
}