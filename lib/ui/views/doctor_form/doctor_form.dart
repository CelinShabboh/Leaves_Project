import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'doctor_form_controller.dart';

class DoctorForm extends StatefulWidget {
  @override
  State<DoctorForm> createState() => _DoctorFormState();
}

class _DoctorFormState extends State<DoctorForm> {
  final DoctorFormController controller = Get.put(DoctorFormController());

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
                      'Doctor Registration Form',
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
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildTextField(
                            label: 'First Name',
                            controller: controller.firstNameController),
                        buildTextField(
                            label: 'Last Name',
                            controller: controller.lastNameController),
                        buildTextField(
                            label: 'Specialization',
                            controller: controller.specializationController),
                        buildTextField(
                            label: 'Email',
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress),
                        buildTextField(
                            label: 'Password',
                            controller: controller.passwordController,
                            obscureText: true),
                        buildTextField(
                            label: 'Phone',
                            controller: controller.phoneController,
                            keyboardType: TextInputType.phone),
                        SizedBox(height: 32),
                        Obx(
                          () => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: controller.isLoading.value
                                  ? null
                                  : () {
                                      controller.submitForm();
                                    },
                              child: controller.isLoading.value
                                  ? CircularProgressIndicator(
                                      color: AppColors.whiteColor)
                                  : Text('Submit'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build text fields
  Widget buildTextField(
      {required String label,
      required TextEditingController controller,
      TextInputType keyboardType = TextInputType.text,
      bool obscureText = false}) {
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
          keyboardType: keyboardType,
          obscureText: obscureText,
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
}

// Custom Clipper to make the AppBar's bottom corners rounded
class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
      size.width / 2, size.height, // Control point for the curve
      size.width, size.height - 30, // End point of the curve
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
