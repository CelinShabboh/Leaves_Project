class Patient {
  final int patientId;
  final String firstName;
  final String lastName;
  final String birthday;
  final String gender;
  final String address;
  final String phone;
  final String insuranceInfo;
  final String? personalPhoto; // يمكن أن تكون null
  final String contactInfo;
  final String createdAt;
  final int doctor;
  final int age;

  Patient({
    required this.patientId,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.address,
    required this.phone,
    required this.insuranceInfo,
    this.personalPhoto,
    required this.contactInfo,
    required this.createdAt,
    required this.doctor,
    required this.age,
  });

  // تحويل JSON إلى كائن Patient
  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patient_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      birthday: json['birthday'],
      gender: json['gender'],
      address: json['address'],
      phone: json['phone'],
      insuranceInfo: json['insurance_info'],
      personalPhoto: json['personal_photo'],
      contactInfo: json['contact_info'],
      createdAt: json['created_at'],
      doctor: json['doctor'],
      age: json['age'],
    );
  }

  // تحويل كائن Patient إلى JSON
  Map<String, dynamic> toJson() {
    return {
      'patient_id': patientId,
      'first_name': firstName,
      'last_name': lastName,
      'birthday': birthday,
      'gender': gender,
      'address': address,
      'phone': phone,
      'insurance_info': insuranceInfo,
      'personal_photo': personalPhoto,
      'contact_info': contactInfo,
      'created_at': createdAt,
      'doctor': doctor,
      'age': age,
    };
  }
}
