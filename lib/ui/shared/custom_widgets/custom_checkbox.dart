import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/colors.dart';
import '../utils.dart';
import 'custom_counter.dart';
import 'custom_divider.dart';
import 'custom_radio.dart';
import 'custom_text.dart';

class CustomCheckbox extends StatelessWidget {
  final bool? radio1;
  final bool? radio2;
  final bool? radio3;
  final bool? radio4;
  final bool? class1;
  final bool? class2;
  final double? start;
  const CustomCheckbox(
      {super.key,
      this.radio1,
      this.radio2,
      this.radio3,
      this.class1,
      this.class2,
      this.radio4,
      this.start});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: start ?? 0),
      child: Row(
        children: [
          class1 == true
              ? CustomText(
                  text: '(فصل أول فقط)',
                  textColor: AppColors.redColor,
                  fontSize: screenWidth(30),
                  styleType: TextStyleType.CUSTOM,
                )
              : Row(),
          class2 == true
              ? CustomText(
                  text: '(فصل تاني فقط)',
                  textColor: AppColors.redColor,
                  fontSize: screenWidth(28),
                  styleType: TextStyleType.CUSTOM,
                )
              : Row(),
          radio1 == true
              ? Row(
                  children: [
                    CustomRadio(
                      width: 20,
                      value: '1',
                      text: '1',
                    ),
                    CustomRadio(
                      width: 20,
                      value: '2',
                      text: '2',
                    ),
                    CustomRadio(
                      width: 20,
                      value: '3',
                      text: '3',
                    ),
                    CustomRadio(
                      width: 20,
                      value: '4',
                      text: '4',
                    ),
                    CustomRadio(
                      width: 20,
                      value: '5',
                      text: '5',
                    ),
                    CustomRadio(
                      width: 20,
                      value: '6',
                      text: '6',
                    ),
                  ],
                )
              : Row(),
          radio2 == true
              ? Row(
                  children: [
                    CustomRadio(
                      width: 10,
                      value: 'خفيفة',
                      text: 'خفيفة',
                    ),
                    CustomRadio(
                      width: 10,
                      value: 'متوسطة',
                      text: 'متوسطة',
                    ),
                    CustomRadio(
                      width: 10,
                      value: 'شديدة',
                      text: 'شديدة',
                    )
                  ],
                )
              : Row(),
          radio3 == true
              ? Row(
                  children: [
                    CustomRadio(
                      width: 15,
                      value: 'أمامية',
                      text: 'أمامية',
                    ),
                    CustomRadio(
                      width: 15,
                      value: 'خلفية',
                      text: 'خلفية',
                    ),
                    CustomRadio(
                      width: 15,
                      value: 'أطفال',
                      text: 'أطفال',
                    ),
                  ],
                )
              : Row(),
          radio4 == true
              ? Row(
                  children: [
                    CustomRadio(
                      width: 15,
                      value: 'خلفية',
                      text: 'خلفية',
                    ),
                    CustomRadio(
                      width: 15,
                      value: 'ضرس العقل',
                      text: 'ضرس العقل',
                    ),
                  ],
                )
              : Row(),
        ],
      ),
    );
  }
}
