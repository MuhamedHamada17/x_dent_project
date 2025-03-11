import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/app_router.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/signUp/ui/screens/widgets/upload_cv_field.dart';

class SignUpDoctorScreen2 extends StatelessWidget {
  const SignUpDoctorScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(50),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.onBoardingScreen);
                      },
                      child: Icon(Icons.arrow_back, size: 32),
                    ),
                    SizedBox(width: 19.w),
                    Text("Sign Up", style: TextStyles.font28BlackSemiBoldOpen),
                  ],
                ),
              ),
              verticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  Degree", style: TextStyles.font14BlackSemiBold),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  University", style: TextStyles.font14BlackSemiBold),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Year Graduated",
                    style: TextStyles.font14BlackSemiBold,
                  ),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "  Specialization",
                    style: TextStyles.font14BlackSemiBold,
                  ),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              verticalSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  Location", style: TextStyles.font14BlackSemiBold),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorsManager.Grey.withOpacity(.8),
                      width: 1.3,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.3),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              verticalSpace(12),

              UploadCVField(),
              verticalSpace(32),
              Center(
                child: SizedBox(
                  width: 200.w,
                  height: 45.h,
                  child: AppTextButton(
                    buttonText: "Continue",
                    borderRadius: 20,
                    verticalPadding: 4.h,
                    backgroundColor: ColorsManager.Blue,
                    textStyle: TextStyles.font20whiteRegular,
                    onPressed: () {},
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(70),
                  Text(
                    "Already have an account? ",
                    style: TextStyles.font12BlackRegular,
                  ),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginDoctorScreen();
                            },
                          ),
                        ),
                    child: Text("Log In", style: TextStyles.font14BlueRegular),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
