import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';

import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/layout/layout_doctor/lay_out_doctor.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_cubit.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_state.dart';

class SignUpDoctorScreen2 extends StatelessWidget {
  const SignUpDoctorScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: BlocConsumer<SignUpDoctorCubit, SignUpDoctorState>(
            listener: (context, state) {
              print('Current State: $state');
              if (state is Success) {
                print('Success State: ${state.data.toJson()}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.data.message ?? 'Registration Successful',
                    ),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 3),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AppLayoutDoctor()),
                );
              } else if (state is Error) {
                print('Error State: ${state.error.message}');
                print('Error Status Code: ${state.error.statusCode}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.error.message ?? 'An error occurred',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.red,
                    duration: Duration(seconds: 5),
                  ),
                );
              }
            },
            builder: (context, state) {
              final cubit = context.read<SignUpDoctorCubit>();

              return Form(
                key: cubit.formKeyScreen2,
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
                              Navigator.pop(
                                context,
                              ); // Back to SignUpDoctorScreen1
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
                        controller: cubit.degreeController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your degree';
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
                          "  University",
                          style: TextStyles.font14BlackSemiBold,
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: cubit.universityController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your university';
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
                        controller: cubit.yearGraduatedController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your graduation year';
                          }
                          if (!RegExp(r'^\d{4}$').hasMatch(value)) {
                            return 'Please enter a valid year';
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
                        controller: cubit.specializationController,
                        hintText: "e.g., Dentist, Cavity",
                        hintStyle: TextStyles.font14GreyRegular,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your specialization(s)';
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
                          "  Location",
                          style: TextStyles.font14BlackSemiBold,
                        ),
                      ],
                    ),
                    verticalSpace(8),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        controller: cubit.locationController,
                        validator: (value) {
                          // Location is optional
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
                          buttonText:
                              state is Loading ? "Loading..." : "Continue",
                          borderRadius: 20,
                          verticalPadding: 4.h,
                          backgroundColor: ColorsManager.Blue,
                          textStyle: TextStyles.font20whiteRegular,
                          onPressed:
                              state is Loading
                                  ? null
                                  : () {
                                    if (cubit.formKeyScreen2.currentState!
                                        .validate()) {
                                      print(
                                        'FormScreen2 Validated Successfully',
                                      );
                                      print(
                                        'Degree: ${cubit.degreeController.text}',
                                      );
                                      print(
                                        'University: ${cubit.universityController.text}',
                                      );
                                      print(
                                        'Year Graduated: ${cubit.yearGraduatedController.text}',
                                      );
                                      print(
                                        'Specialization: ${cubit.specializationController.text}',
                                      );
                                      print(
                                        'Location: ${cubit.locationController.text}',
                                      );
                                      cubit.signDoctor();
                                    } else {
                                      print('FormScreen2 Validation Failed');
                                    }
                                  },
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
                                  builder: (context) => LoginDoctorScreen(),
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
  }
}
