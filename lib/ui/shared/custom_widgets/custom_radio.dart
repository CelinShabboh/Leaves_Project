import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils.dart';

class CustomRadio extends StatefulWidget {
  final double width;
  final String value;
  final String text;
  CustomRadio(
      {super.key,
      required this.width,
      required this.value,
      required this.text});

  @override
  State<CustomRadio> createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  String groupValue = "Yes";

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: screenWidth(widget.width),
          child: Radio(
              value: widget.value,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  groupValue = value!;
                });
              }),
        ),
        Text(widget.text,),
      ],
    );
  }
}
