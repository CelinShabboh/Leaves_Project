import 'package:dental_project/ui/shared/custom_widgets/custom_text.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final String? title;
  final Color? backColor;
  final Color? foreColor;
  final Function? onPress;
  final double? fontSize;
  final bool? isDotted;
  final bool? enabled;
  final Widget? widget;
  final double? height;
  const CustomButton({
    super.key,
    this.title,
    this.backColor,
    this.foreColor,
    this.onPress,
    this.widget,
    this.isDotted = false,
    this.height,
    this.enabled = true,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? screenWidth(7),
      width: screenWidth(1),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      child: ElevatedButton(
          onPressed: enabled!
              ? () async {
                  await onPress!();
                }
              : null,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              animationDuration: Duration(milliseconds: 50),
              shadowColor: Colors.transparent,
              backgroundColor: backColor ?? AppColors.blueColorTwo,
              foregroundColor: foreColor ?? AppColors.blackColor,
              elevation: 0,
              side: isDotted!
                  ? null
                  : BorderSide(
                      width: screenWidth(screenWidth(1)),
                      color: Colors.black,
                    )),
          child: widget ??
              CustomText(
                text: title ?? "",
                fontWeight: FontWeight.normal,
                fontSize: fontSize,
                styleType: TextStyleType.SUBTITLE,
              )),
    );
  }
}
