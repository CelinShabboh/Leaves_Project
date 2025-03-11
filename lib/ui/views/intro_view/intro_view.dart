import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';

class IntroView extends StatefulWidget {
  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pngs/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight(5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'تعرف على تطبيق تشخيص أمراض العين',
                  style: TextStyle(
                    fontSize: screenWidth(16),
                  ),
                ),
                Center(
                  child: Text(
                    '  الذي يسهّل عمل الطبيب في تشخيص\n  أمراض العين باستخدام تقنيات الذكاء\n                .الصنعي المتطورة',
                    style: TextStyle(
                      fontSize: screenWidth(16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: screenHeight(20),
            right: screenHeight(50), // تم تعديلها لتوضيح الموقع
            child: Row(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(color: AppColors.blueColor),
                  ),
                ),
                SizedBox(width: screenWidth(90)),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.blueGrey[200],
                  ),
                  onPressed: () {},
                  child: Text(
                    'إنشاء حساب جديد',
                    style: TextStyle(color: AppColors.blueColor),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(bottom: screenHeight(10)),
              width: screenWidth(20),
              height: screenWidth(1.5),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white54,
                    spreadRadius: 10,
                    blurRadius: 200,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: ClipOval(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(screenWidth(20) / 2),
                  ),
                  child: Image.asset(
                    'assets/images/pngs/eye_intr.png',
                    fit: BoxFit.cover,
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
