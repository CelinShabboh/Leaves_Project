import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dental_project/core/data/models/appointment_model.dart';

class BillsController extends GetxController {
  RxList<Appointment> appointments = <Appointment>[].obs;
  RxString selectedAppointmentId = ''.obs;
  TextEditingController amountController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  Future<void> fetchAppointments() async {
    try {
      final response = await http
          .get(Uri.parse('http://192.168.1.3:8000/diagnose/appointments/'));

      if (response.statusCode == 200 || response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty) {
          appointments.value = data
              .map((appointment) => Appointment.fromJson(appointment))
              .toList();
        }
      } else {
        print('Failed to load appointments');
      }
    } catch (e) {
      print('Error fetching appointments: $e');
    }
  }

  Future<void> submitForm() async {
    if (selectedAppointmentId.value.isEmpty || amountController.text.isEmpty) {
      print('Please select an appointment and enter the amount');
      return;
    }

    final String apiUrl = 'http://192.168.1.3:8000/diagnose/bills/';
    final Map<String, dynamic> requestData = {
      'appointment': int.parse(selectedAppointmentId.value),
      'amount': double.tryParse(amountController.text) ?? 0.0,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {"Content-Type": "application/json"},
        body: json.encode(requestData),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        print('Bill submitted successfully');
      } else {
        print('Failed to submit bill: ${response.body}');
      }
    } catch (e) {
      print('Error submitting bill: $e');
    }
  }
}
