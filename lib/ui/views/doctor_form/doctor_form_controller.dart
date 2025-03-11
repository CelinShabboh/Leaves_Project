import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorFormController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  RxBool isLoading = false.obs; 

  Future<void> submitForm() async {
    final Map<String, dynamic> doctorData = {
      "first_name": firstNameController.text,
      "last_name": lastNameController.text,
      "specialty": specializationController.text,
      "phone": phoneController.text,
      "email": emailController.text,
      "password": passwordController.text,
    };

    final String url = 'http://192.168.94.243:8000/diagnose/doctors/';

    try {
      isLoading.value = true;
      final response = await http.post(
        Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(doctorData),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('Success', 'Data submitted successfully',
            snackPosition: SnackPosition.BOTTOM);
      } else {
        Get.snackbar('Error', 'Failed to submit data: ${response.statusCode}',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }
}
