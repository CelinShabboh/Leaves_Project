import 'package:bot_toast/bot_toast.dart';
import 'package:dental_project/core/enums/message_type.dart';
import 'package:dental_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomToast {
  static showMeassge({
    required String message,
    MessageType messageType = MessageType.INFO,
  }) {
    String imageName = 'info';
    Color shadowColor = AppColors.backGroundColor;

    switch (messageType) {
      case MessageType.INFO:
        imageName = 'info';
        //    shadowColor = AppColors.blueColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        //  shadowColor = AppColors.redColor;
        break;
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        //shadowColor = AppColors.redColor;
        break;
      case MessageType.SUCCSESS:
        imageName = 'approved1-01';
        //shadowColor = AppColors.grayColor;
        break;
    }

    BotToast.showCustomText(
        duration: Duration(seconds: 3),
        toastBuilder: (value) {
          return Container(
            padding: EdgeInsets.all(screenWidth(40)),
            width: screenWidth(3),
            height: screenWidth(5),
            decoration: BoxDecoration(
                //      color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: CustomText(
              text: message,
              styleType: TextStyleType.SUBTITLE,
              max_lines: 2,
            ),
          );
        });
  }
}
