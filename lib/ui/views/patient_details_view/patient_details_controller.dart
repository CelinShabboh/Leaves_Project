import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PatientDetailsViewController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final birthdayController = TextEditingController();
  final genderController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final insuranceInfoController = TextEditingController();
  final contactInfoController = TextEditingController();
  
  File? selectedImage;

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
    }
  }

  Future<bool> submitForm(BuildContext context) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://192.168.94.243:8000/diagnose/patients/'),
    );

    request.fields['first_name'] = firstNameController.text;
    request.fields['last_name'] = lastNameController.text;
    request.fields['birthday'] = birthdayController.text;
    request.fields['gender'] = genderController.text;
    request.fields['address'] = addressController.text;
    request.fields['phone'] = phoneController.text;
    request.fields['insurance_info'] = insuranceInfoController.text;
    request.fields['contact_info'] = contactInfoController.text;

    if (selectedImage != null) {
      try {
        request.files.add(await http.MultipartFile.fromPath(
          'personal_photo',  
          selectedImage!.path, 
          contentType: MediaType('image', 'jpeg'), 
        ));
      } catch (e) {
        print('Error uploading image: $e');
        return false;
      }
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Form submitted successfully');
        return true;
      } else {
        print('Failed to submit form. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error during form submission: $e');
      return false;
    }
  }
}
