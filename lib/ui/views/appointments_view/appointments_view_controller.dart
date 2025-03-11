import 'package:dental_project/core/data/models/patient_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentController extends GetxController {
  final TextEditingController patientIdController = TextEditingController();
  var appointmentDate = Rx<DateTime?>(null);
  var patients = <Patient>[].obs; // قائمة المرضى التي سيتم جلبها

  @override
  void onInit() {
    super.onInit();
    fetchPatients(); // جلب المرضى عند بدء التطبيق
  }

  // دالة لجلب بيانات المرضى من السيرفر
  Future<void> fetchPatients() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.1.3:8000/diagnose/patients/'),
      );

      if (response.statusCode == 200) {
        List<dynamic> patientList = json.decode(response.body);
        patients.value = patientList.map((json) => Patient.fromJson(json)).toList();
      } else {
        Get.snackbar('Error', 'Failed to fetch patients');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while fetching patients: $e');
    }
  }

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != appointmentDate.value) {
      appointmentDate.value = picked; // تعيين التاريخ الذي تم اختياره
    }
  }

  Future<void> submitForm() async {
    if (patientIdController.text.isNotEmpty && appointmentDate.value != null) {
      final data = {
        "patient": patientIdController.text, // ارسال ID المريض
        "appointment_datetime": DateFormat('yyyy-MM-dd HH:mm')
            .format(appointmentDate.value!), // تنسيق التاريخ
      };

      try {
        final response = await http.post(
          Uri.parse('http://192.168.1.3:8000/diagnose/appointments/'),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(data),
        );

        if (response.statusCode == 200 || response.statusCode == 201) {
          Get.snackbar('Success', 'Appointment booked successfully');
        } else {
          Get.snackbar(
              'Error', 'Failed to book appointment: ${response.statusCode}');
        }
      } catch (e) {
        Get.snackbar('Error', 'An error occurred: $e');
      }
    } else {
      Get.snackbar('Warning', 'Please fill in all required fields');
    }
  }
}