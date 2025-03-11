import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dental_project/core/data/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PatientDataController extends GetxController {
  final TextEditingController medicalNotesController = TextEditingController();
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController leftDiagnosticController =
      TextEditingController();
  final TextEditingController rightDiagnosticController =
      TextEditingController();
  final ImagePicker _picker = ImagePicker();

  RxList<Patient> patients = RxList<Patient>();
  Rx<Patient?> selectedPatient = Rx<Patient?>(null);
  Rx<XFile?> fundusLeftImage = Rx<XFile?>(null);
  Rx<XFile?> fundusRightImage = Rx<XFile?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchPatients();
  }

  Future<void> fetchPatients() async {
    final response = await http
        .get(Uri.parse('http://192.168.94.243:8000/diagnose/patients/'));
    if (response.statusCode == 200 || response.statusCode == 201) {
      List data = json.decode(response.body);
      patients.value = data.map((json) => Patient.fromJson(json)).toList();
    } else {
      Get.snackbar('Error', 'Failed to load patients');
    }
  }

  Future<void> pickImage(bool isLeft) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (isLeft) {
      fundusLeftImage.value = pickedFile;
    } else {
      fundusRightImage.value = pickedFile;
    }
  }

  Future<void> submitForm() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.94.243:8000/diagnose/medical-data/'),
    );

    request.fields['patient'] = selectedPatient.value!.patientId.toString();
    request.fields['medical_notes'] = medicalNotesController.text;

    // Sending diagnostic results (left and right)
    request.fields['left_diagnostic'] = leftDiagnosticController.text;
    request.fields['right_diagnostic'] = rightDiagnosticController.text;

    if (fundusLeftImage.value != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'left_fundus', fundusLeftImage.value!.path));
    }
    if (fundusRightImage.value != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'right_fundus', fundusRightImage.value!.path));
    }

    // Sending the request
    var response = await request.send();
    if (response.statusCode == 200 || response.statusCode == 201) {
      Get.snackbar('Success', 'Data submitted successfully');
    } else {
      Get.snackbar('Error', 'Failed to submit data');
    }
  }
}
