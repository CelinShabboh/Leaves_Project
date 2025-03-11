import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'diagnoses_form_controller.dart';

class DiagnosisForm extends StatelessWidget {
  final int diagnoseId;
  DiagnosisForm({required this.diagnoseId});

  @override
  Widget build(BuildContext context) {
    // استخدام الـ Controller
    final DiagnosisFormController controller =
        Get.put(DiagnosisFormController());

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pngs/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Stack(
                      children: [
                        Text(
                          'ملاحظات التشخيص',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                        Positioned(
                          top: 23,
                          child: Container(
                            height: 2.5,
                            width: 100,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),

                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        child: TextField(
                          controller: controller
                              .diagnosisNotesController, // ربط TextEditingController
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'الملاحظات الطبية للتشخيص',
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                          ),
                          style: TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 16,
                          ),
                          onChanged: (value) {
                            controller.diagnosisNotes.value = value;
                          },
                        ),
                      ),
                    ),

                    SizedBox(height: 32),

                    // زر الإرسال
                    Obx(() {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: controller.isLoading.value
                              ? null
                              : () {
                                  controller.submitDiagnosisNotes(diagnoseId);
                                },
                          child: controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: AppColors.fillColor,
                                )
                              : Text(
                                  'إرسال',
                                  style: TextStyle(color: AppColors.whiteColor),
                                ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            backgroundColor: AppColors.blueColor,
                          ),
                        ),
                      );
                    }),
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
