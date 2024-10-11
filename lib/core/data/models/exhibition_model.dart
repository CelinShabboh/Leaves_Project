class ImageModel {
  final String? description;
  final String imageUrl;
  final int doctorId;
  final int imageId;

  ImageModel({
    this.description,
    required this.imageUrl,
    required this.doctorId,
    required this.imageId,
  });

  // Factory method to create an ImageModel from JSON
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      description: json['description'],
      imageUrl: json['image_url'],
      doctorId: json['doctorId'],
      imageId: json['image_id'],
    );
  }

  // Method to convert an ImageModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'image_url': imageUrl,
      'doctorId': doctorId,
      'image_id': imageId,
    };
  }
}
