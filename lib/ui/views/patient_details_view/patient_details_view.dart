import 'dart:io';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dental_project/ui/views/patient_details_view/patient_details_controller.dart';

class PatientDetailsView extends StatefulWidget {
  @override
  _PatientDetailsViewState createState() => _PatientDetailsViewState();
}

class _PatientDetailsViewState extends State<PatientDetailsView> {
  final PatientDetailsViewController _controller =
      PatientDetailsViewController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _controller.birthdayController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  Future<void> _pickImage() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text("Camera"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedImage =
                      await ImagePicker().pickImage(source: ImageSource.camera);
                  if (pickedImage != null) {
                    setState(() {
                      _controller.selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text("Gallery"),
                onTap: () async {
                  Navigator.of(context).pop();
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    setState(() {
                      _controller.selectedImage = File(pickedImage.path);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue[50],
        child: Column(
          children: [
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                color: AppColors.blueColor,
                padding:
                    EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  title: Padding(
                    padding: EdgeInsets.only(bottom: screenHeight(20)),
                    child: Text(
                      'Patient Registration Form',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: _pickImage,
                              child: Container(
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: AppColors.grayColor, width: 2),
                                  image: _controller.selectedImage != null
                                      ? DecorationImage(
                                          image: FileImage(
                                              _controller.selectedImage!),
                                          fit: BoxFit.cover,
                                        )
                                      : null,
                                ),
                                child: _controller.selectedImage == null
                                    ? Icon(Icons.person,
                                        size: 80, color: AppColors.grayColor)
                                    : null,
                              ),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton.icon(
                              onPressed: _pickImage,
                              icon: Icon(Icons.photo_library),
                              label: Text('Select Personal Photo'),
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 16),
                                textStyle: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32),
                      _buildTextField(
                          'First Name', _controller.firstNameController),
                      _buildTextField(
                          'Last Name', _controller.lastNameController),
                      _buildDateField(
                          context, 'Birthday', _controller.birthdayController),
                      _buildTextField('Gender', _controller.genderController),
                      _buildTextField('Address', _controller.addressController),
                      _buildTextField('Phone', _controller.phoneController),
                      _buildTextField('Insurance Info',
                          _controller.insuranceInfoController),
                      _buildTextField(
                          'Contact Info', _controller.contactInfoController),
                      SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _controller.submitForm(context);
                          },
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter $label...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: AppColors.fillColor,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateField(
      BuildContext context, String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          readOnly: true,
          onTap: () => _selectDate(context),
          decoration: InputDecoration(
            hintText: 'Select $label...',
            suffixIcon: Icon(Icons.calendar_today, color: AppColors.grayColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            filled: true,
            fillColor: AppColors.fillColor,
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
