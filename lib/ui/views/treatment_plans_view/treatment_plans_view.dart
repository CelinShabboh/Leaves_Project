import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/treatment_plans_view/treatment_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TreatmentPlansView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TreatmentPlansController controller =
        Get.put(TreatmentPlansController());

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
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                margin: EdgeInsets.only(
                    top: screenHeight(20), bottom: screenHeight(20)),
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black26Color,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('معرف المريض',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          Obx(() {
                            return DropdownButtonFormField<String>(
                              value:
                                  controller.selectedDisplayName.value.isEmpty
                                      ? null
                                      : controller.selectedDisplayName.value,
                              items: controller.medicalData.map((item) {
                                return DropdownMenuItem<String>(
                                  value: item['display_name'],
                                  child: Text(item['display_name']),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.setSelectedDisplayName(value!);
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('معرف السجل',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          Obx(() {
                            return TextField(
                              onChanged: (value) =>
                                  controller.selectedRecordId.value = value,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: controller.selectedRecordId.value,
                              ),
                            );
                          }),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الأدوية المستخدمة',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          TextField(
                            onChanged: (value) =>
                                controller.medication.value = value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الجرعة',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          TextField(
                            onChanged: (value) => controller.dose.value = value,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('الأنشطة اليومية',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          TextField(
                            onChanged: (value) =>
                                controller.dailyActivities.value = value,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('التدخل الجراحي',
                              style:
                                  TextStyle(fontSize: 16, color: AppColors.blackColor)),
                          TextField(
                            onChanged: (value) =>
                                controller.surgicalIntervention.value = value,
                            maxLines: 3,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      Obx(() {
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.submitTreatmentPlan,
                            child: controller.isLoading.value
                                ? CircularProgressIndicator(color: AppColors.whiteColor)
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
          ),
        ],
      ),
    );
  }
}
