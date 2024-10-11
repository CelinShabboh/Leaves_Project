import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class DiagnosisForm extends StatefulWidget {
  @override
  _DiagnosisFormState createState() => _DiagnosisFormState();
}

class _DiagnosisFormState extends State<DiagnosisForm> {
  final TextEditingController diagnosisNotesController =
      TextEditingController();
  List<String> selectedDiagnoses = [];

  // قائمة التشخيصات الممكنة (يمكن أن يتم جلبها من API)
  List<String> diagnoses = [
    "Diabetes",
    "Hypertension",
    "Glaucoma",
    "Cataracts",
    "Macular Degeneration",
    "Retinal Detachment",
  ];

  // دالة للإرسال
  void _submitForm() {
    print('Selected Diagnoses: $selectedDiagnoses');
    print('Diagnosis Notes: ${diagnosisNotesController.text}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diagnosis Form'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // حقل التشخيصات (اختياري)
              Text(
                'Diagnoses (Optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 9,
                children: diagnoses.map((diagnosis) {
                  return ChoiceChip(
                    label: Text(diagnosis),
                    selected: selectedDiagnoses.contains(diagnosis),
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          selectedDiagnoses.add(diagnosis);
                        } else {
                          selectedDiagnoses.remove(diagnosis);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 32),

              // حقل ملاحظات التشخيص (اختياري)
              Text(
                'Diagnosis Notes (Optional)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              TextField(
                controller: diagnosisNotesController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Enter diagnosis notes...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
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
