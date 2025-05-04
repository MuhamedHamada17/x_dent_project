import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/di/dependency_injection.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/signUp/patient/logic/sign_up_patient_cubit.dart';
import 'package:x_dent_project/features/signUp/patient/logic/sign_up_patient_state.dart';

import '../../widgets/sign_patient_bloc_listner.dart';

class SignUpPatientScreen extends StatelessWidget {
  const SignUpPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignUpPatientCubit>(),
      child: const _SignUpPatientScreenContent(),
    );
  }
}

class _SignUpPatientScreenContent extends StatelessWidget {
  const _SignUpPatientScreenContent();

  @override
  Widget build(BuildContext context) {
    final signUpCubit = context.read<SignUpPatientCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Form(
                key: signUpCubit.formKey,
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
                    verticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("First Name", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
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
                        Text("Last Name", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
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
                        Text("Email", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.emailController,
                        validator: (value) {
                          if (value == null || !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
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
                    verticalSpace(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Phone", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.phoneController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        hintText: "+1 (000) 000-0000",
                        hintStyle: TextStyles.font14GreyRegular,
                        prefixIcon: Row(
                          mainAxisSize: MainAxisSize.min, // لتقليل مساحة الـ Row
                          children: [
                            horizontalSpace(10),
                            Text(
                              "EG",
                              style: TextStyle(
                                color: ColorsManager.Grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            horizontalSpace(5),
                            Icon(Icons.chevron_right, size: 20),
                          ],
                        ),
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
                    verticalSpace(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Password", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.passwordController,
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must be at least 8 characters long.';
                          }
                          return null;
                        },
                        isObscureText: true,
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
                        Text("Confirm Password", style: TextStyles.font14BlackSemiBold),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: signUpCubit.confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          if (value != signUpCubit.passwordController.text) {
                            return 'The two passwords do not match.';
                          }
                          return null;
                        },
                        isObscureText: true,
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
                    verticalSpace(32),
                    Center(
                      child: SizedBox(
                        width: 200.w,
                        height: 45.h,
                        child: BlocBuilder<SignUpPatientCubit, SignUpPatientState>(
                          builder: (context, state) {
                            return AppTextButton(
                              buttonText: "Sign Up", // تصحيح النص من "Login" إلى "Sign Up"
                              borderRadius: 20,
                              verticalPadding: 4.h,
                              backgroundColor: ColorsManager.Blue,
                              textStyle: TextStyles.font20whiteRegular,
                              onPressed: () {
                                if (signUpCubit.formKey.currentState!.validate()) {
                                  signUpCubit.signPatient();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        verticalSpace(90),
                        Text(
                          "Already have an account?",
                          style: TextStyles.font12BlackRegular,
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPatientScreen(),
                            ),
                          ),
                          child: Text(" Login", style: TextStyles.font14BlueRegular),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SignPatientBlocListener(),
        ],
      ),
    );
  }
}