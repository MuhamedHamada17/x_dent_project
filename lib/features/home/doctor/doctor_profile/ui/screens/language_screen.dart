import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/doctor_profile_main_screen.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DoctorProfileMainScreen(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: ColorsManager.OfWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: Row(
                children: [
                  const Icon(Icons.language, size: 24),
                  horizontalSpace(10),
                  Text("Language", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: SizedBox(
                width: 300.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      decoration: BoxDecoration(
                        color: ColorsManager.lighterBLUE,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Select Language",
                            style: TextStyles.font20BlackRegular,
                          ),
                          const Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyles.font22BlackMedium,
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 45.h,
                          child: AppTextButton(
                            buttonText: "Confirm",
                            borderRadius: 25,
                            verticalPadding: 4,
                            backgroundColor: ColorsManager.Blue,
                            textStyle: TextStyles.font22WhiteMedium,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
