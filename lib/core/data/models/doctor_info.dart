import 'dart:convert';

class DoctorInfo {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? governorate;
  String? university;
  String? collegeyear;

  DoctorInfo({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.governorate,
    this.university,
    this.collegeyear,
  });

  factory DoctorInfo.fromJson(Map<String, dynamic> json) {
    return DoctorInfo(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      governorate: json['governorate'] as String,
      university: json['university'] as String,
      collegeyear: json['collegeyear'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'governorate': governorate,
      'university': university,
      'collegeyear': collegeyear,
    };
  }
}
