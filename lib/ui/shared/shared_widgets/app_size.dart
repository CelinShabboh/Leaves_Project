import 'package:flutter/material.dart';

class AppSize {
  static late double screenWidth;
  static late double screenHeight;
  static late double defualtSize;
  static late Orientation orientation;
  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defualtSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;

    // ignore: avoid_print
    print(defualtSize);
  }
}
