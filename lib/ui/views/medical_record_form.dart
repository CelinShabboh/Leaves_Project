import 'package:flutter/material.dart';

class MedicalRecordForm extends StatefulWidget {
  @override
  _MedicalRecordFormState createState() => _MedicalRecordFormState();
}

class _MedicalRecordFormState extends State<MedicalRecordForm> {
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController recordIdController = TextEditingController();
  final TextEditingController medicationController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController dailyActivitiesController =
      TextEditingController();
  final TextEditingController surgicalInterventionController =
      TextEditingController();

  // دالة لإرسال البيانات إلى السيرفر
  void _submitForm() {
    if (patientIdController.text.isNotEmpty &&
        recordIdController.text.isNotEmpty &&
        medicationController.text.isNotEmpty &&
        doseController.text.isNotEmpty &&
        dailyActivitiesController.text.isNotEmpty &&
        surgicalInterventionController.text.isNotEmpty) {
      // هنا يمكن إضافة كود إرسال البيانات إلى السيرفر

      // عرض البيانات في وحدة التحكم كاختبار
      print('Patient ID: ${patientIdController.text}');
      print('Record ID: ${recordIdController.text}');
      print('Medication: ${medicationController.text}');
      print('Dose: ${doseController.text}');
      print('Daily Activities: ${dailyActivitiesController.text}');
      print('Surgical Intervention: ${surgicalInterventionController.text}');
    } else {
      // إظهار رسالة إذا لم يتم إدخال البيانات
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى ملء جميع الحقول المطلوبة')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Record Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // إدخال رقم المريض
              TextField(
                controller: patientIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Patient ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // إدخال رقم الاستمارة الطبية
              TextField(
                controller: recordIdController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Record ID',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // إدخال الأدوية المستخدمة
              TextField(
                controller: medicationController,
                decoration: InputDecoration(
                  labelText: 'Medication',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // إدخال الجرعة
              TextField(
                controller: doseController,
                decoration: InputDecoration(
                  labelText: 'Dose',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),

              // إدخال الأنشطة اليومية
              TextField(
                controller: dailyActivitiesController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Daily Activities',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              // إدخال العمليات الجراحية
              TextField(
                controller: surgicalInterventionController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Surgical Intervention',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),

              // زر الإرسال
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
