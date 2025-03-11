import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/appointments_view/appointments_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'patient_details_view.dart';

class DisplayPatientView extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(screenHeight(35)),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      '  تسجيل الخروج',
                      style: TextStyle(
                        color: AppColors.blueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.blueColor,
                      ),
                      onPressed: () {
                        Get.snackbar('Logout', 'You have been logged out!');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              left: screenWidth(20),
              right: screenWidth(20),
              top: screenHeight(10),
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'سجلات المرضى',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColors.blueColor,
                    thickness: 2,
                    indent: screenWidth(3),
                  ),
                  Obx(() {
                    if (controller.patients.isEmpty) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return Expanded(
                      child: ListView.builder(
                        itemCount: controller.patients.length,
                        itemBuilder: (context, index) {
                          var patient = controller.patients[index];

                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.blueBackgroundColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                ClipOval(
                                  child: Container(
                                    padding:
                                        EdgeInsets.all(3), // لتحديد عرض الحافة
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color:
                                            AppColors.blueColor, // لون الحافة
                                        width: 2, // عرض الحافة
                                      ),
                                    ),
                                    child: patient.personalPhoto != null
                                        ? Image.network(
                                            'http://192.168.1.3:8000/patient_photos/${patient.personalPhoto!}',
                                            height: 80,
                                            width: 80,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Icon(Icons.person,
                                                  size: 80,
                                                  color: AppColors.blueColor);
                                            },
                                          )
                                        : Icon(Icons.person,
                                            size: 80,
                                            color: AppColors.blueColor),
                                  ),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${patient.firstName} ${patient.lastName}',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Age: ${patient.age} years',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Gender: ${patient.gender}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Phone: ${patient.phone}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Address: ${patient.address}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Birthday: ${DateFormat('MM/dd/yyyy').format(DateTime.parse(patient.birthday))}',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }),

                  // زر إضافة مريض
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.to(PatientDetailsView());
                      },
                      label: Text(
                        'إضافة مريض',
                        style: TextStyle(
                            fontSize: 16, color: AppColors.whiteColor),
                      ),
                      icon: Icon(
                        Icons.add, // علامة الجمع
                        size: 24,
                        color: AppColors.whiteColor,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blueColor,
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                        textStyle: TextStyle(fontSize: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
