import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/doctor_profile_main_screen.dart';

class LogOutDoctorScreen extends StatelessWidget {
  const LogOutDoctorScreen({super.key});

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
              title: Row(
                children: [
                  Image.asset(
                    'assets/png/Apple.png',
                    width: 24.w,
                    height: 24.h,
                  ),
                  horizontalSpace(10),
                  Text("Log Out", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: Text(
                "Are you sure you want to log out?",
                style: TextStyles.font20BlackRegular,
              ),
              actions: [
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyles.font22BlackMedium,
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 153.w,
                      height: 50.h,
                      child: AppTextButton(
                        buttonText: "Log Out",
                        borderRadius: 25,
                        verticalPadding: 4.h,
                        backgroundColor: ColorsManager.Blue,
                        textStyle: TextStyles.font22WhiteMedium,
                        onPressed: () {
                          context.pushNamed(Routes.loginDoctorScreen);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
