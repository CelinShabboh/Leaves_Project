class DoctorProfile {
  int? id;
  String? photo;
  String? name;
  String? phone;
  String? governorate;
  String? email;
  String? collegeyear;

  DoctorProfile(
      {this.id,
      this.photo,
      this.name,
      this.phone,
      this.governorate,
      this.email,
      this.collegeyear});

  DoctorProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    photo = json['photo'];
    name = json['name'];
    phone = json['phone'];
    governorate = json['governorate'];
    email = json['email'];
    collegeyear = json['collegeyear'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['photo'] = this.photo;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['governorate'] = this.governorate;
    data['email'] = this.email;
    data['collegeyear'] = this.collegeyear;
    return data;
  }
}
