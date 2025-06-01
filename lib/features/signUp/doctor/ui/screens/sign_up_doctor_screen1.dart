import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/signUp/doctor/data/repos/sign_up_doctor_repo.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_cubit.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_state.dart';
import 'package:x_dent_project/features/signUp/doctor/ui/screens/sign_up_doctor_screen2.dart';

class SignUpDoctorScreen1 extends StatelessWidget {
  const SignUpDoctorScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SignUpDoctorCubit(SignUpDoctorRepo(ApiService(Dio()))),
      child: Builder(
        builder: (providerContext) {
          return Scaffold(
            backgroundColor: ColorsManager.lighterBLUE,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: BlocBuilder<SignUpDoctorCubit, SignUpDoctorState>(
                  builder: (context, state) {
                    final cubit = context.read<SignUpDoctorCubit>();

                    return Form(
                      key: cubit.formKeyScreen1,
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
                                Text(
                                  "Sign Up",
                                  style: TextStyles.font28BlackSemiBoldOpen,
                                ),
                              ],
                            ),
                          ),
                          verticalSpace(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  First name",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.firstNameController,
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  Last name",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.lastNameController,
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  Email",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.emailController,
                              hintText: "you@email.com",
                              hintStyle: TextStyles.font14GreyRegular,
                              prefixIcon: Icon(Icons.email_outlined),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!RegExp(
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                ).hasMatch(value)) {
                                  return 'Please enter a valid email';
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  Phone",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.phoneController,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  horizontalSpace(14),
                                  Text(
                                    "EG",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        112,
                                        112,
                                        112,
                                      ),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Icon(Icons.chevron_right),
                                  horizontalSpace(8),
                                ],
                              ),
                              hintText: "+1 (000) 000-0000",
                              hintStyle: TextStyles.font14GreyRegular,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  Password",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "  Confirm Password",
                                style: TextStyles.font14BlackSemiBold,
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          SizedBox(
                            width: 320.w,
                            height: 46.h,
                            child: AppTextFormField(
                              controller: cubit.confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != cubit.passwordController.text) {
                                  return 'Passwords do not match';
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
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.3,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          verticalSpace(32),
                          Center(
                            child: SizedBox(
                              width: 200.w,
                              height: 45.h,
                              child: AppTextButton(
                                buttonText: "Next",
                                borderRadius: 20,
                                verticalPadding: 4.h,
                                backgroundColor: ColorsManager.Blue,
                                textStyle: TextStyles.font20whiteRegular,
                                onPressed: () {
                                  if (cubit.formKeyScreen1.currentState!
                                      .validate()) {
                                    print('FormScreen1 Validated Successfully');
                                    print(
                                      'First Name: ${cubit.firstNameController.text}',
                                    );
                                    print(
                                      'Last Name: ${cubit.lastNameController.text}',
                                    );
                                    print(
                                      'Email: ${cubit.emailController.text}',
                                    );
                                    print(
                                      'Phone: ${cubit.phoneController.text}',
                                    );
                                    print(
                                      'Password: ${cubit.passwordController.text}',
                                    );
                                    print(
                                      'Confirm Password: ${cubit.confirmPasswordController.text}',
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => BlocProvider.value(
                                              value: cubit,
                                              child: SignUpDoctorScreen2(),
                                            ),
                                      ),
                                    );
                                  } else {
                                    print('FormScreen1 Validation Failed');
                                  }
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              verticalSpace(90),
                              Text(
                                "Already have an account? ",
                                style: TextStyles.font12BlackRegular,
                              ),
                              GestureDetector(
                                onTap:
                                    () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => LoginDoctorScreen(),
                                      ),
                                    ),
                                child: Text(
                                  "Log In",
                                  style: TextStyles.font14BlueRegular,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
