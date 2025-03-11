import 'package:dental_project/ui/shared/shared_widgets/colors.dart';
import 'package:flutter/material.dart';

class EyeDiseaseDiagnosisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackColor),
          onPressed: () {},
        ),
        title: Text(
          'Eye Disease Diagnosis',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.blackColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What symptoms are you experiencing?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 16),
            _buildCheckboxTile('Pain in the eye'),
            _buildCheckboxTile('Redness or swelling'),
            _buildCheckboxTile('Blurry vision'),
            SizedBox(height: 32),
            Text(
              'Upload an image of your eye',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
              ),
            ),
            SizedBox(height: 16),
            _buildImageUploadField(),
            Spacer(),
            _buildSkipButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxTile(String title) {
    return CheckboxListTile(
      value:
          false, // This can be updated with the real value in stateful widget
      onChanged: (bool? value) {},
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: AppColors.blackColor,
        ),
      ),
      activeColor: AppColors.blueColor,
      checkColor: AppColors.whiteColor,
      controlAffinity: ListTileControlAffinity.trailing,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Widget _buildImageUploadField() {
    return GestureDetector(
      onTap: () {
        // Handle image upload
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFFDCE0E5)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Add photo',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF111418),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.add,
              color: AppColors.blackColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkipButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.blackColor,
          backgroundColor: Color(0xFFF0F2F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          'Skip for now',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
