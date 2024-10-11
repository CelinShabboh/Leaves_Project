import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../shared_widgets/colors.dart';
import '../utils.dart';

class CustomCounter extends StatefulWidget {
  CustomCounter({super.key});

  @override
  State<CustomCounter> createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  int count = 0;
  // Variable to store the current count
  void incrementCounter() {
    setState(() {
      count++; // Increment the count by 1
    });
  }

  void decrementCounter() {
    setState(() {
      count--; // Decrement the count by 1
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: screenWidth(7),
        height: screenHeight(35),
        margin: EdgeInsetsDirectional.only(start: screenWidth(70)),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          // gradient: LinearGradient(
          //   colors: [Colors.blue, Colors.green],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: incrementCounter,
              child: Icon(
                Icons.add,
                color: Colors.blue,
                size: screenWidth(25),
              ),
            ),
            SizedBox(width: screenWidth(140)),
            Text(
              '$count',
              style: TextStyle(fontSize: screenWidth(30), color: Colors.black),
            ),
            SizedBox(width: screenWidth(140)),
            GestureDetector(
              onTap: decrementCounter,
              child: Icon(
                Icons.remove,
                color: Colors.red,
                size: screenWidth(30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
