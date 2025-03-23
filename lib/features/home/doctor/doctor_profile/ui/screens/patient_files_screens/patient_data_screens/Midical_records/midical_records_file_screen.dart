import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class MidicalRecordsScreen extends StatelessWidget {
  const MidicalRecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Midical Records", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(32),
            Container(
              height: 50.h,
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            verticalSpace(12),
            Text(
              "Patient has no medical records.",
              style: TextStyles.font20BlueRegular,
            ),
          ],
        ),
      ),
    );
  }
}
