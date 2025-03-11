class MedicalData {
  final int recordId;
  final int patientId;
  final String leftFundus;
  final String rightFundus;
  final String leftDiagnostic;
  final String rightDiagnostic;
  final int? doctorId;
  final String medicalNotes;
  final int diagnoseId;
  final String displayName;

  MedicalData({
    required this.recordId,
    required this.patientId,
    required this.leftFundus,
    required this.rightFundus,
    required this.leftDiagnostic,
    required this.rightDiagnostic,
    this.doctorId,
    required this.medicalNotes,
    required this.diagnoseId,
    required this.displayName,
  });

  factory MedicalData.fromJson(Map<String, dynamic> json) {
    return MedicalData(
      recordId: json['record_id'],
      patientId: json['patient'],
      leftFundus: json['left_fundus'],
      rightFundus: json['right_fundus'],
      leftDiagnostic: json['left_diagnostic'] ?? '',
      rightDiagnostic: json['right_diagnostic'] ?? '',
      doctorId: json['doctor'],
      medicalNotes: json['medical_notes'] ?? '',
      diagnoseId: json['diagnose'],
      displayName: json['display_name'],
    );
  }

  // دالة لتحويل النموذج إلى JSON عند الحاجة
  Map<String, dynamic> toJson() {
    return {
      'record_id': recordId,
      'patient': patientId,
      'left_fundus': leftFundus,
      'right_fundus': rightFundus,
      'left_diagnostic': leftDiagnostic,
      'right_diagnostic': rightDiagnostic,
      'doctor': doctorId,
      'medical_notes': medicalNotes,
      'diagnose': diagnoseId,
      'display_name': displayName,
    };
  }
}
