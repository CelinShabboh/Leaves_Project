import 'package:dental_project/core/data/models/patient_model.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/appointments_view/appointments_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentView extends StatelessWidget {
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
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.blueColor,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
              child: AppBar(
                title: Text('Appointments'),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
          Center(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              margin: EdgeInsets.only(
                top: 12,
                left: 20,
                right: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      'assets/images/pngs/eye.png',
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(() {
                    return DropdownButtonFormField<int>(
                      value: controller.patients.isEmpty
                          ? null
                          : controller.patients[0].patientId,
                      onChanged: (value) {
                        controller.patientIdController.text = value.toString();
                      },
                      items: controller.patients.map((patient) {
                        return DropdownMenuItem<int>(
                          value: patient.patientId,
                          child:
                              Text('${patient.firstName} ${patient.lastName}'),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: 'Select Patient',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: AppColors.fillColor,
                      ),
                    );
                  }),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: controller.pickDate,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.grayColor),
                        color: AppColors.fillColor,
                      ),
                      child: Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.appointmentDate.value == null
                                      ? 'Select Appointment Date'
                                      : DateFormat('MM/dd/yyyy').format(
                                          controller.appointmentDate.value!),
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Icon(Icons.calendar_today, color: AppColors.grayColor),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.submitForm,
                      child:
                          Text('Submit', style: TextStyle(color: AppColors.whiteColor)),
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
        ],
      ),
    );
  }
}
