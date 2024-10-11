import 'package:flutter/cupertino.dart';

import '../shared_widgets/colors.dart';
import '../utils.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
          start: screenWidth(200), end: screenWidth(200)),
      height: screenHeight(30),
      width: 1,
      color: AppColors.grayColorOne,
    );
  }
}
