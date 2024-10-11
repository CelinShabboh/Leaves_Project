// class ConditionModel {
//   List<Conditions>? conditions;
//   List<Levels>? levels;

//   ConditionModel({this.conditions, this.levels});

//   ConditionModel.fromJson(Map<String, dynamic> json) {
//     if (json['conditions'] != null) {
//       conditions = <Conditions>[];
//       json['conditions'].forEach((v) {
//         conditions!.add(new Conditions.fromJson(v));
//       });
//     }
//     if (json['levels'] != null) {
//       levels = <Levels>[];
//       json['levels'].forEach((v) {
//         levels!.add(new Levels.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.conditions != null) {
//       data['conditions'] = this.conditions!.map((v) => v.toJson()).toList();
//     }
//     if (this.levels != null) {
//       data['levels'] = this.levels!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Conditions {
//   String? condition;

//   Conditions({this.condition});

//   Conditions.fromJson(Map<String, dynamic> json) {
//     condition = json['condition'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['condition'] = this.condition;
//     return data;
//   }
// }

// class Levels {
//   String? level;

//   Levels({this.level});

//   Levels.fromJson(Map<String, dynamic> json) {
//     level = json['level'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['level'] = this.level;
//     return data;
//   }
// }

class ConditionsModel {
  String? condition;
  String? level;

  ConditionsModel({this.condition, this.level});

  ConditionsModel.fromJson(Map<String, dynamic> json) {
    condition = json['condition'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['condition'] = this.condition;
    data['level'] = this.level;
    return data;
  }
}
