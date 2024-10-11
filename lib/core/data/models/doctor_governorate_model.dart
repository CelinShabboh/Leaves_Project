class DoctorsGovernorateModel {
  int? id;
  String? name;
  String? phone;
  String? governorate;
  String? university;
  String? photo;
  String? collegeyear;
  List<Conditions>? conditions;

  DoctorsGovernorateModel(
      {this.id,
      this.name,
      this.phone,
      this.governorate,
      this.photo,
      this.university,
      this.collegeyear,
      this.conditions});

  DoctorsGovernorateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    governorate = json['governorate'];
    university = json['university'];
    photo = json['photo'] == null ? "" : json['photo'];
    collegeyear = json['collegeyear'];
    // if (json['conditions'] != null) {
    //   conditions = <Conditions>[];
    //   json['conditions'].forEach((v) {
    //     conditions!.add(new Conditions.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['governorate'] = this.governorate;
    data['university'] = this.university;
    data['collegeyear'] = this.collegeyear;
    // if (this.conditions != null) {
    //   data['conditions'] = this.conditions!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class Conditions {
  int? id;
  String? name;
  String? levelDescription;

  Conditions({this.id, this.name, this.levelDescription});

  Conditions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    levelDescription = json['levelDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['levelDescription'] = this.levelDescription;
    return data;
  }
}
