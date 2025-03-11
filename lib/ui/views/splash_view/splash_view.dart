import 'dart:async';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dental_project/ui/views/appointments_view/appointment_view.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat(
        reverse: true); // Make the animation repeat for a pulsating effect
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Set a timer to navigate to the Explanation View after 4 seconds
    Timer(Duration(seconds: 4), () {
      Get.off(() => AppointmentView());
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller when not in use
    super.dispose();
  }

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
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Text(
              'Welcome to Eye Diagnosis App',
              style: GoogleFonts.pacifico(
                textStyle: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.whiteColor,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
