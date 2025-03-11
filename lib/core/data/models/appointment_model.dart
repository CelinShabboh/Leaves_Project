class Appointment {
  final int appointmentId;
  final int patient;
  final DateTime appointmentDatetime;
  final int doctor;

  Appointment({
    required this.appointmentId,
    required this.patient,
    required this.appointmentDatetime,
    required this.doctor,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      appointmentId: json['appointment_id'],
      patient: json['patient'],
      appointmentDatetime: DateTime.parse(json['appointment_datetime']),
      doctor: json['doctor'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'appointment_id': appointmentId,
      'patient': patient,
      'appointment_datetime': appointmentDatetime.toIso8601String(),
      'doctor': doctor,
    };
  }
}
