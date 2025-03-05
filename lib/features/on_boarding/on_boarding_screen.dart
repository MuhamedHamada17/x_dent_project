import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/on_boarding/switch_button.dart';

import '../../core/helpers/spacing.dart';
import '../../core/theiming/colors.dart';
import '../../core/theiming/styles.dart';
import '../../core/widgets/app_text_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isPatient = false;

  void _handleSwitchChange(bool value) {
    setState(() {
      isPatient = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              verticalSpace(45),
              SwitchButtonScreen(onSwitchChanged: _handleSwitchChange),
              verticalSpace(40),
              SvgPicture.asset(
                "assets/svg/onBoarding.svg",
                height: 390.h,
                width: 292.w,
              ),
              verticalSpace(40),
              SizedBox(
                width: 330.w,
                height: 44.h,
                child: AppTextButton(
                  buttonText: "Continue",
                  buttonHeight: 44.h,
                  verticalPadding: 4.h,
                  backgroundColor: ColorsManager.Blue,
                  textStyle: TextStyles.font20whiteRegular,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        isPatient ? LoginPatientScreen() : LoginDoctorScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
