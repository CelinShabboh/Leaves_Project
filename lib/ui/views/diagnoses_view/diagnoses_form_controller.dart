import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart'; // لتأكد من وجود الاتصال

class DiagnosisFormController extends GetxController {
  var diagnosisNotes = ''.obs; 
  var isLoading = false.obs; 
  TextEditingController diagnosisNotesController = TextEditingController(); // لإنشاء TextEditingController

 
  Future<bool> _isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // دالة لإرسال البيانات عبر PUT
  Future<void> submitDiagnosisNotes(int diagnoseId) async {
    // التحقق من الاتصال بالإنترنت
    bool isConnected = await _isConnected();
    if (!isConnected) {
      Get.snackbar('خطأ', 'لا يوجد اتصال بالإنترنت');
      return;
    }

    // تحديد عنوان الـ URL
    final url = 'http://192.168.1.3:8000/diagnose/diagnoses/$diagnoseId/';
    
    // بدء التحميل
    isLoading.value = true;

    try {
      final response = await http.put(
        Uri.parse(url),
        body: json.encode({
          'diagnosis_notes': diagnosisNotes.value, // ملاحظات التشخيص
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // التحقق من الاستجابة
      if (response.statusCode == 200 || response.statusCode == 201) {
        Get.snackbar('نجاح', 'تم إرسال الملاحظات بنجاح');
      } else {
        Get.snackbar('خطأ', 'فشل إرسال الملاحظات');
      }
    } catch (e) {
      // في حال حدوث استثناء
      Get.snackbar('خطأ', 'حدث خطأ أثناء الاتصال بالخادم');
    } finally {
      // إنهاء حالة التحميل
      isLoading.value = false;
    }
  }
}
