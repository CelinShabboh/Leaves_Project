class ImageClassificationModel {
  final ImageClassificationData? data;

  ImageClassificationModel({this.data});

  factory ImageClassificationModel.fromJson(Map<String, dynamic> json) {
    return ImageClassificationModel(
      data: ImageClassificationData.fromJson(json['data']),
    );
  }
}

class ImageClassificationData {
  final String? label;
  final List<Confidence>? confidences;

  ImageClassificationData({this.label, this.confidences});

  factory ImageClassificationData.fromJson(Map<String, dynamic> json) {
    return ImageClassificationData(
      label: json['lable'],
      confidences: (json['confidences'] as List)
          .map((confidence) => Confidence.fromJson(confidence))
          .toList(),
    );
  }
}

class Confidence {
  final String label;
  final double confidence;

  Confidence({required this.label, required this.confidence});

  factory Confidence.fromJson(Map<String, dynamic> json) {
    return Confidence(
      label: json['lable'],
      confidence: json['confidences'],
    );
  }
}



// class ImageClassificationModel {
//   List<Data>? data;
//   bool? isGenerating;
//   double? duration;
//   double? averageDuration;

//   ImageClassificationModel(
//       {this.data, this.isGenerating, this.duration, this.averageDuration});

//   ImageClassificationModel.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//     isGenerating = json['is_generating'];
//     duration = json['duration'];
//     averageDuration = json['average_duration'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     data['is_generating'] = this.isGenerating;
//     data['duration'] = this.duration;
//     data['average_duration'] = this.averageDuration;
//     return data;
//   }
// }

// class Data {
//   String? label;
//   List<Confidences>? confidences;

//   Data({this.label, this.confidences});

//   Data.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//     if (json['confidences'] != null) {
//       confidences = <Confidences>[];
//       json['confidences'].forEach((v) {
//         confidences!.add(new Confidences.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     if (this.confidences != null) {
//       data['confidences'] = this.confidences!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Confidences {
//   String? label;
//   double? confidence;

//   Confidences({this.label, this.confidence});

//   Confidences.fromJson(Map<String, dynamic> json) {
//     label = json['label'];
//     confidence = json['confidence'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['label'] = this.label;
//     data['confidence'] = this.confidence;
//     return data;
//   }
// }
