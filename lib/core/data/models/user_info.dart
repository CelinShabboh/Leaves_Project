class UserInfo {
  int? id;
  String? name;
  String? phoneNumber;
  String? governorate;

  UserInfo({
    this.id,
    this.name,
    this.phoneNumber,
    this.governorate,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        id: json['id'] as int?,
        name: json['name'] as String?,
        phoneNumber: json['phone'] as String?,
        governorate: json['governorate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'phone': phoneNumber,
        'governorate': governorate,
      };
}
