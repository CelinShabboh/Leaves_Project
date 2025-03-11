import 'package:dental_project/core/data/models/diagnoses_model.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dental_project/ui/views/diagnoses_view/diagnoses_display_controller.dart';
import 'package:dental_project/ui/views/diagnoses_view/diagnosis_form.dart'; // استيراد الصفحة الثانية

class DiagnosesView extends StatelessWidget {
  final DiagnosesController controller = Get.put(DiagnosesController());

  @override
  Widget build(BuildContext context) {
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
            child: Obx(
              () {
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "التشخيصات",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                              color: AppColors.blueColor),
                        ),
                        SizedBox(height: 16),
                        Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'ابحث عن تشخيص...',
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onChanged: (query) {
                              controller.searchDiagnoses(query);
                            },
                          ),
                        ),
                        SizedBox(height: 16),

                        // قائمة التشخيصات
                        Expanded(
                          child: ListView.builder(
                            itemCount: controller.filteredDiagnoses.length,
                            itemBuilder: (context, index) {
                              DiagnosisModel diagnosis =
                                  controller.filteredDiagnoses[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DiagnosisForm(
                                        diagnoseId: diagnosis.diagnoseId,
                                      ),
                                    ),
                                  );
                                },
                                child: Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(vertical: 8),
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: AppColors.blueBackgroundColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "التشخيص الكامل: ${diagnosis.completeDiagnosis}"),
                                        Text(
                                            "درجة الثقة: ${diagnosis.confidenceScore}"),
                                        Text(
                                            "ملاحظات التشخيص: ${diagnosis.diagnosisNotes.isNotEmpty ? diagnosis.diagnosisNotes : 'لا توجد ملاحظات'}"),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
