import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientForm extends StatefulWidget {
  @override
  _PatientFormState createState() => _PatientFormState();
}

class _PatientFormState extends State<PatientForm> {
  final TextEditingController patientIdController = TextEditingController();
  DateTime? appointmentDate;

  // دالة لاختيار التاريخ
  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    setState(() {
      if (pickedDate != null) {
        appointmentDate = pickedDate;
      }
    });
  }

  // دالة لإرسال البيانات إلى السيرفر
  void _submitForm() {
    if (patientIdController.text.isNotEmpty && appointmentDate != null) {
      // هنا يمكن إضافة كود إرسال البيانات إلى السيرفر

      // عرض البيانات في وحدة التحكم كاختبار
      print('Patient ID: ${patientIdController.text}');
      print(
          'Appointment Date: ${DateFormat('MM/dd/yyyy').format(appointmentDate!)}');
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
        title: Text('Patient Data Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

            // اختيار تاريخ الموعد
            GestureDetector(
              onTap: _pickDate,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Text(
                  appointmentDate == null
                      ? 'Select Appointment Date'
                      : DateFormat('MM/dd/yyyy').format(appointmentDate!),
                  style: TextStyle(fontSize: 16),
                ),
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
    );
  }
}
