class Tokens {
  String? accessToken;
  String? refreshToken;

  Tokens({
    this.accessToken,
    this.refreshToken,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    accessToken: json['access_token'] as String?,
    refreshToken: json['refresh_token'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'refresh_token': refreshToken,
  };
}