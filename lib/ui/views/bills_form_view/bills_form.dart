import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bills_controller_view.dart';
import 'package:intl/intl.dart';

class BillsForm extends StatelessWidget {
  final BillsController controller = Get.put(BillsController());

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
                title: Text('Bills Form'),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black26Color,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Appointment ID',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Obx(() {
                      if (controller.appointments.isEmpty) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return DropdownButtonFormField<String>(
                        value: controller.selectedAppointmentId.value.isEmpty
                            ? null
                            : controller.selectedAppointmentId.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedAppointmentId.value = newValue;
                          }
                        },
                        items: controller.appointments.map((appointment) {
                          String formattedDate =
                              DateFormat('yyyy-MM-dd – kk:mm')
                                  .format(appointment.appointmentDatetime);
                          return DropdownMenuItem<String>(
                            value: appointment.appointmentId.toString(),
                            child: Text(formattedDate),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          hintText: 'Select Appointment',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          filled: true,
                          fillColor: AppColors.fillColor,
                        ),
                      );
                    }),
                    SizedBox(height: 16),
                    Text(
                      'Amount',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextField(
                      controller: controller.amountController,
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      decoration: InputDecoration(
                        hintText: 'Enter invoice amount...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        filled: true,
                        fillColor: AppColors.fillColor,
                      ),
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: controller.submitForm,
                        child: Text(
                          'Submit',
                          style: TextStyle(color: AppColors.whiteColor),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blueColor,
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
    );
  }
}
