import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/widgets/bloc_login_listner.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_router.dart';
import '../../../signUp/signup_doctor/sign_up_doctor_screen1.dart';

class LoginDoctorScreen extends StatelessWidget {
  const LoginDoctorScreen({super.key});

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
                    Text("Login", style: TextStyles.font28BlackSemiBoldOpen),
                  ],
                ),
              ),
              verticalSpace(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyles.font14BlackSemiBold),
                ],
              ),
              verticalSpace(10),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  hintText: "you@email.com",
                  hintStyle: TextStyles.font14GreyRegular,
                  prefixIcon: Icon(Icons.email_outlined),
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
              verticalSpace(30),
              Text("Password", style: TextStyles.font14BlackSemiBold),
              verticalSpace(10),
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
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Forget Password?",
                    style: TextStyles.font12BlackRegular,
                  ),
                ),
              ),
              verticalSpace(50),
              Center(
                child: SizedBox(
                  width: 200.w,
                  height: 45.h,
                  child: AppTextButton(
                    buttonText: "Login",
                    borderRadius: 20,
                    verticalPadding: 4.h,
                    backgroundColor: ColorsManager.Blue,
                    textStyle: TextStyles.font20whiteRegular,
                    onPressed: () {},
                  ),
                ),
              ),
              verticalSpace(90),
              SizedBox(
                width: 320.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.white,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: ColorsManager.Blue.withOpacity(0.7),
                        width: 1.5,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/png/Apple.png",
                        width: 18.w,
                        height: 23.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Login with Apple",
                        style: TextStyles.font14BlackSemiBold,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(25),
              SizedBox(
                width: 320.w,
                height: 50.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.white,
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: ColorsManager.Blue.withOpacity(0.7),
                        width: 1.5,
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/png/google.png",
                        width: 18.w,
                        height: 23.h,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        "Login with Google",
                        style: TextStyles.font14BlackSemiBold,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(90),
                  Text(
                    "Don't have an account? ",
                    style: TextStyles.font12BlackRegular,
                  ),
                  GestureDetector(
                    onTap:
                        () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return SignUpDoctorScreen1();
                        },
                      ),
                    ),
                    child: Text(
                      "Register Now",
                      style: TextStyles.font14BlueRegular,
                    ),

                  ),
                ],
              ),
              LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}