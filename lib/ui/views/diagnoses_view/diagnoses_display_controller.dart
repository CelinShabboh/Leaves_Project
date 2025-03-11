import 'package:dental_project/core/data/models/diagnoses_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DiagnosesController extends GetxController {
  var diagnosesList = <DiagnosisModel>[].obs;
  var filteredDiagnoses = <DiagnosisModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDiagnoses();
  }

  Future<void> fetchDiagnoses() async {
    try {
      isLoading(true);
      final response = await http
          .get(Uri.parse('http://192.168.1.3:8000/diagnose/diagnoses/'));

      if (response.statusCode == 200 || response.statusCode == 201) {
        List jsonResponse = json.decode(response.body);
        diagnosesList.value =
            jsonResponse.map((data) => DiagnosisModel.fromJson(data)).toList();
        filteredDiagnoses.value =
            diagnosesList; // عرض كافة التشخيصات في البداية
      } else {
        throw Exception('Failed to load diagnoses');
      }
    } catch (error) {
      print("Error fetching diagnoses: $error");
    } finally {
      isLoading(false);
    }
  }

  // دالة البحث
  void searchDiagnoses(String query) {
    if (query.isEmpty) {
      filteredDiagnoses.value = diagnosesList;
    } else {
      filteredDiagnoses.value = diagnosesList
          .where((diagnosis) =>
              diagnosis.completeDiagnosis.contains(query) ||
              diagnosis.diagnosisNotes.contains(query))
          .toList();
    }
  }
}
