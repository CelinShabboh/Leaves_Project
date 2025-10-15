import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:dental_project/ui/views/LoginView/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -211,
              left: -153,
              child: Image.asset(
                'assets/images/pngs/1.png',
                width: 744,
                height: 800,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: screenHeight(10),
              left: screenWidth(-10),
              child: Image.asset(
                'assets/images/pngs/2.png',
                width: 624,
                height: 230,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: screenHeight(4),
              left: screenWidth(15),
              child: Container(
                child: Image.asset(
                  'assets/images/pngs/3.png',
                  width: 345,
                  height: 195,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Positioned(
              top: screenHeight(10),
              left: screenWidth(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME TO",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  Text(
                    "Punch App",
                    style: GoogleFonts.poppins(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: screenHeight(6),
              left: screenWidth(10),
              right: screenWidth(10),
              child: GestureDetector(
                onTap: () {
                  Get.to(LoginView());
                },
                child: SizedBox(
                  width: 338,
                  height: 56,
                  child: Image.asset(
                    'assets/images/pngs/btnLogin.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
