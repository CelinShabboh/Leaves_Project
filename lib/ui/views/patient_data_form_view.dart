import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PatientDataForm extends StatefulWidget {
  @override
  _PatientDataFormState createState() => _PatientDataFormState();
}

class _PatientDataFormState extends State<PatientDataForm> {
  final TextEditingController patientIdController = TextEditingController();
  final TextEditingController medicalNotesController = TextEditingController();
  DateTime? appointmentDate;
  XFile? fundusLeftImage;
  XFile? fundusRightImage;

  final ImagePicker _picker = ImagePicker();

  // Function to pick image
  Future<void> _pickImage(bool isLeft) async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (isLeft) {
        fundusLeftImage = pickedFile;
      } else {
        fundusRightImage = pickedFile;
      }
    });
  }

  // Function to pick date
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

  // Function to send data to the server
  void _submitForm() {
    if (patientIdController.text.isNotEmpty && appointmentDate != null) {
      // Here you would send the data to the server
      // For example: using HTTP package or Dio package in Flutter

      // Example: print data
      print('Patient ID: ${patientIdController.text}');
      print(
          'Appointment Date: ${DateFormat('MM/dd/yyyy').format(appointmentDate!)}');
      print('Medical Notes: ${medicalNotesController.text}');
      print('Fundus Left Image: ${fundusLeftImage?.path}');
      print('Fundus Right Image: ${fundusRightImage?.path}');
    } else {
      // Show error if fields are incomplete
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all required fields')),
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
            // Patient ID Input
            TextField(
              controller: patientIdController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Patient ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Appointment Date Picker
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
            SizedBox(height: 16),

            // Fundus Left Image Picker
            GestureDetector(
              onTap: () => _pickImage(true),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fundusLeftImage == null
                          ? 'Upload Left Fundus Image'
                          : 'Image Selected',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.image, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Fundus Right Image Picker
            GestureDetector(
              onTap: () => _pickImage(false),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      fundusRightImage == null
                          ? 'Upload Right Fundus Image'
                          : 'Image Selected',
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.image, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),

            // Medical Notes Input
            TextField(
              controller: medicalNotesController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Medical Notes',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),

            // Submit Button
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
