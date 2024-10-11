import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../shared_widgets/colors.dart';
import '../utils.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
                        onPressed: () {
                          //Get.to(() => HomeView());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.whiteColor,
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(5.0),
                          foregroundColor: AppColors.blackColor,
                          side: BorderSide(
                            color: AppColors.grayColorOne,
                            width: 2.0,
                          ),
                        ),
                        child: Icon(
                          Icons.home,
                          color: AppColors.greenColor,
                          size: screenWidth(7),
                        ),
                      );
  }
}