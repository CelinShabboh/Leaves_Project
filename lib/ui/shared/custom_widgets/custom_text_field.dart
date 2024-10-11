import 'package:dental_project/core/enums/textfield_type.dart';
import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:dental_project/ui/shared/utils.dart';
import 'package:flutter/material.dart';


class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool? isPassword;
  final int? maxLines;
  final TextInputType? textInputType;
  final int? maxLength;
  final Icon? prefixIcon;
  final Color? fillColor;
  final TypeOfTextField typeOfTextField;
  final bool obscureStatus;
  final Function? onPressVisibleIcon;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextField(
      {super.key,
      required this.hintText,
      this.isPassword,
      required this.typeOfTextField,
      required this.obscureStatus,
      this.onPressVisibleIcon,
      this.maxLines = 1,
      this.maxLength,
      this.textInputType,
      this.controller,
      this.validator,
      this.fillColor,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
      width: screenWidth(1),
      // height: screenWidth(7),
      child: TextFormField(
        validator: validator,
        controller: controller,
        maxLength: maxLength,
        keyboardType: textInputType,
        maxLines: maxLines,
        obscureText: obscureStatus,
        cursorColor: AppColors.whiteColor,
        cursorWidth: screenWidth(screenWidth(1)),
        style:
            TextStyle(color: AppColors.blackColor, fontSize: screenWidth(25)),
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            contentPadding: EdgeInsets.all(screenWidth(40)),
            suffixIcon: typeOfTextField == TypeOfTextField.NORMAL
                ? null
                : IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      obscureStatus
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      size: screenWidth(15),
                      color: AppColors.grayColorOne,
                    ),
                    onPressed: () {
                      onPressVisibleIcon!();
                    }),
            hintText: hintText,
            hintStyle: TextStyle(
                color: AppColors.grayColorOne, fontSize: screenWidth(25)),
            fillColor: fillColor ?? AppColors.blueColorOne,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.blackColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                color: AppColors.grayColorOne,
              ),
            )),
      ),
    );
  }
}

TextStyle textStyle =
    TextStyle(color: AppColors.grayColorOne, fontSize: screenWidth(25));
OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: BorderSide(
    color: AppColors.grayColorOne,
  ),
);
