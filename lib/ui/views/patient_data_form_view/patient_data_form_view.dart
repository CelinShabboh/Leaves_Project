import 'package:dental_project/core/data/models/patient_model.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/patient_data_form_view/patient_data_form_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';

class PatientDataForm extends StatelessWidget {
  final PatientDataController controller = Get.put(PatientDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pngs/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Center container with form content
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.only(
                    top: screenHeight(20),
                    left: screenHeight(30),
                    right: screenHeight(30)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Patient dropdown
                    Text(
                      'اختر المريض',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    SizedBox(height: screenHeight(50)),
                    Obx(() => Directionality(
                          textDirection: TextDirection.rtl,
                          child: DropdownButtonFormField<int>(
                            value: controller.selectedPatient.value?.patientId,
                            onChanged: (value) {
                              controller.selectedPatient.value =
                                  controller.patients.firstWhere(
                                      (patient) => patient.patientId == value);
                            },
                            items: controller.patients.map((patient) {
                              return DropdownMenuItem<int>(
                                value: patient.patientId,
                                child: Text(
                                    '${patient.firstName} ${patient.lastName}'),
                              );
                            }).toList(),
                            decoration: InputDecoration(
                              labelText: 'حدد المريض',
                              border: OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.grey[200],
                            ),
                          ),
                        )),
                    SizedBox(height: screenHeight(50)),

                    // Left Fundus image upload
                    Text(
                      'تحميل صورة قاع العين اليسرى',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () => controller.pickImage(true),
                          child: Container(
                            margin: EdgeInsets.only(top: screenHeight(50)),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.image, color: Colors.grey),
                                Text(
                                  controller.fundusLeftImage.value == null
                                      ? 'اختر صورة قاع العين اليسرى'
                                      : 'تم اختيار الصورة',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                        )),
                    if (controller.fundusLeftImage.value != null) ...[
                      SizedBox(height: 10),
                      Obx(() => Image.file(
                            File(controller.fundusLeftImage.value!.path),
                            height: 100,
                            width: 100,
                          )),
                    ],
                    SizedBox(height: 16),

                    // Right Fundus image upload
                    Text(
                      'تحميل صورة قاع العين اليمنى',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Obx(() => GestureDetector(
                          onTap: () => controller.pickImage(false),
                          child: Container(
                            margin: EdgeInsets.only(top: screenHeight(50)),
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grayColor),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.image, color: AppColors.grayColor),
                                Text(
                                  controller.fundusRightImage.value == null
                                      ? 'اختر صورة قاع العين اليمنى'
                                      : 'تم اختيار الصورة',
                                  style: TextStyle(
                                      fontSize: 16, color: AppColors.grayColor),
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                          ),
                        )),
                    if (controller.fundusRightImage.value != null) ...[
                      SizedBox(height: 10),
                      Obx(() => Image.file(
                            File(controller.fundusRightImage.value!.path),
                            height: 100,
                            width: 100,
                          )),
                    ],
                    SizedBox(height: 16),

                    // Medical notes input
                    Text(
                      'ملاحظات طبية',
                      style: TextStyle(fontSize: 16),
                      textDirection: TextDirection.rtl,
                    ),
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: screenHeight(50)),
                        child: TextField(
                          controller: controller.medicalNotesController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'الملاحظات الطبية',
                            labelStyle: TextStyle(color: AppColors.grayColor),
                            border: OutlineInputBorder(),
                          ),
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),

                    // Submit button
                    SizedBox(
                      width: double.infinity,
                      height: screenHeight(14),
                      child: ElevatedButton(
                        onPressed: controller.submitForm,
                        child: Text(
                          'إرسال',
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: screenWidth(20)),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppColors.blueColor,
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
    );
  }
}
