import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/views/appointments_view/appointment_view.dart';
import 'package:dental_project/ui/views/patient_details_view/patient_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/pngs/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'لوحة التحكم',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.whiteColor,
                  ),
                  textDirection: TextDirection.rtl,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: ListView(
                    children: [
                      DashboardItem(
                        title: 'تسجيل مريض',
                        icon: Icons.login,
                        onTap: () {
                          Get.to(() => PatientDetailsView());
                        },
                      ),
                      SizedBox(height: 16),
                      DashboardItem(
                        title: 'تحديد موعد',
                        icon: Icons.date_range,
                        onTap: () {
                          Get.to(() => AppointmentView());
                        },
                      ),
                      SizedBox(height: 16),
                      DashboardItem(
                        title: 'الواجهة الثالثة',
                        icon: Icons.info,
                        onTap: () {
                          Get.to(() => ThirdView());
                        },
                      ),
                      // أضف المزيد من الخانات هنا حسب الحاجة
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  DashboardItem({required this.title, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          textDirection:
              TextDirection.rtl, // توجيه العناصر من اليمين إلى اليسار
          children: [
            Icon(
              icon,
              size: 28,
              color: AppColors.blueAccentColor,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black87Color,
                ),
                textDirection:
                    TextDirection.rtl, // توجيه النص من اليمين إلى اليسار
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThirdView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('الواجهة الثالثة')),
      body: Center(child: Text('محتوى الواجهة الثالثة')),
    );
  }
}
