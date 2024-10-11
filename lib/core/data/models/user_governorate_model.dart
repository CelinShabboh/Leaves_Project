class UsersGovernorateModel {
  int? id;
  String? name;
  String? phone;
  String? governorate;
  String? photo;
  List<Conditions>? conditions;

  UsersGovernorateModel(
      {this.id,
      this.name,
      this.phone,
      this.governorate,
      this.photo,
      this.conditions});

  UsersGovernorateModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    governorate = json['governorate'];
    photo = json['photo'] == null ? "" : json['photo'];
    if (json['conditions'] != null) {
      conditions = <Conditions>[];
      json['conditions'].forEach((v) {
        conditions!.add(new Conditions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['governorate'] = this.governorate;
    if (this.conditions != null) {
      data['conditions'] = this.conditions!.map((v) => v.toJson()).toList();
    }
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
