import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class PrescriptionScreen extends StatelessWidget {
  const PrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Prescriptions", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(32),
            Container(
              height: 50.h,
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            ),
            verticalSpace(12),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "You have no current\n      prescriptions.",
                    style: TextStyles.font20BlueRegular,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 40,
                    ),
                    child: AppTextButton(
                      borderRadius: 25,
                      verticalPadding: 4,
                      backgroundColor: ColorsManager.Blue,
                      buttonText: "Add Prescriptions",
                      textStyle: TextStyles.font22WhiteMedium,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
