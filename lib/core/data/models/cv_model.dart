class CvModel {
  String? imageUrl;
  String? description;

  CvModel({this.imageUrl, this.description});

  CvModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['image_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    return data;
  }
}
