import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TreatmentPlansController extends GetxController {
  var medicalData = <Map<String, dynamic>>[].obs;  
  var selectedDisplayName = ''.obs;
  var selectedRecordId = ''.obs;
  var medication = ''.obs;
  var dose = ''.obs;
  var dailyActivities = ''.obs;
  var surgicalIntervention = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchMedicalData();
  }

  // جلب البيانات من الخادم
  void fetchMedicalData() async {
    final response = await http.get(
        Uri.parse('http://192.168.94.243:8000/diagnose/medical-data/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      medicalData.value = List<Map<String, dynamic>>.from(data);
    } else {
      Get.snackbar('خطأ', 'فشل في تحميل البيانات');
    }
  }

  void setSelectedDisplayName(String displayName) {
    selectedDisplayName.value = displayName;
    final record = medicalData.firstWhere(
        (item) => item['display_name'] == displayName,
        orElse: () => {});  
    if (record.isNotEmpty) {
      selectedRecordId.value = record['record_id'].toString();  
    }
  }

  Future<void> submitTreatmentPlan() async {
    if (selectedRecordId.isNotEmpty &&
        medication.isNotEmpty &&
        dose.isNotEmpty &&
        dailyActivities.isNotEmpty &&
        surgicalIntervention.isNotEmpty) {
      isLoading.value = true;

      final url = 'http://192.168.94.243:8000/diagnose/treatment-plans/';
      final request = http.MultipartRequest('POST', Uri.parse(url))
        ..fields['record'] = selectedRecordId.value
        ..fields['medication'] = medication.value
        ..fields['dose'] = dose.value
        ..fields['daily_activities'] = dailyActivities.value
        ..fields['surgical_intervention'] = surgicalIntervention.value;

      final response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('نجاح', 'تم إرسال خطة العلاج بنجاح');
      } else {
        Get.snackbar('خطأ', 'فشل في إرسال خطة العلاج');
      }
      isLoading.value = false;
    } else {
      Get.snackbar('خطأ', 'يرجى ملء جميع الحقول');
    }
  }
}
