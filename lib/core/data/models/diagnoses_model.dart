class DiagnosisModel {
  final int diagnoseId;
  final String completeDiagnosis;
  final double confidenceScore;
  final String diagnosisNotes;

  DiagnosisModel({
    required this.diagnoseId,
    required this.completeDiagnosis,
    required this.confidenceScore,
    required this.diagnosisNotes,
  });

  factory DiagnosisModel.fromJson(Map<String, dynamic> json) {
    return DiagnosisModel(
      diagnoseId: json['diagnose_id'] as int,
      completeDiagnosis: json['complete_diagnosis'] as String,
      confidenceScore: double.parse(json['confidence_score']),
      diagnosisNotes: json['diagnosis_notes'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'diagnose_id': diagnoseId,
      'complete_diagnosis': completeDiagnosis,
      'confidence_score': confidenceScore.toString(),
      'diagnosis_notes': diagnosisNotes,
    };
  }
}
