import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String iamgepath;
  final double imagewidth, imageheight;
  final String imagetype;
  final double borderRadius; // أضف هذا المتغير لجعل الحواف دائرية

  CustomImage({
    required this.iamgepath,
    required this.imageheight,
    required this.imagewidth,
    required this.imagetype,
    this.borderRadius = 50.0, // قيمة افتراضية لحواف دائرية بالكامل
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          alignment: Alignment.center,
          width: imagewidth,
          height: imageheight,
          child: imagetype == "network"
              ? Image.network(
                  iamgepath,
                  alignment: Alignment.center,
                  width: imagewidth,
                  height: imageheight,
                  fit: BoxFit.fill,
                )
              : Image.asset(
                  iamgepath,
                  alignment: Alignment.center,
                  width: imagewidth,
                  height: imageheight,
                  fit: BoxFit.fill,
                ),
        ),
      ),
    );
  }
}
