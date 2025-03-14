import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/login/login_patient/ui/widgets/app_bar_login.dart';
import 'package:x_dent_project/features/login/login_patient/ui/widgets/log_with.dart';

import 'package:x_dent_project/features/signUp/ui/screens/signup_doctor/sign_up_doctor_screen1.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_router.dart';
import '../logic/login_cubit.dart';
import '../logic/login_state.dart';

class LoginDoctorScreen extends StatelessWidget {
  const LoginDoctorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const _LoginDoctorScreenContent(),
    );
  }
}

class _LoginDoctorScreenContent extends StatelessWidget {
  const _LoginDoctorScreenContent();

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Form(
                key: loginCubit.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(50),
                    AppBarLogin(),
                    verticalSpace(50),
                    Text("Email", style: TextStyles.font14BlackSemiBold),
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
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.3,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        hintStyle: TextStyles.font14GreyRegular,
                        prefixIcon: Icon(Icons.email_outlined),
                        controller: loginCubit.emailController,
                        hintText: "you@email.com",
                      ),
                    ),
                    verticalSpace(30),
                    Text("Password", style: TextStyles.font14BlackSemiBold),
                    verticalSpace(10),
                    SizedBox(
                      width: 320.w,
                      height: 46.h,
                      child: AppTextFormField(
                        hintStyle: TextStyles.font14GreyRegular,
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
                        controller: loginCubit.passwordController,
                        hintText: "********",
                        isObscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a valid password';
                          }
                          return null;
                        },
                      ),
                    ),
                    verticalSpace(12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.forgetScreen);
                        },
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
                        child: BlocBuilder<LoginCubit, LoginState>(
                          builder: (context, state) {
                            return AppTextButton(
                              buttonText: "Login",
                              borderRadius: 20,
                              verticalPadding: 4.h,
                              backgroundColor: ColorsManager.Blue,
                              textStyle: TextStyles.font20whiteRegular,
                              onPressed: () {
                                if (loginCubit.formKey.currentState!
                                    .validate()) {
                                  loginCubit.login();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    verticalSpace(90),
                    LogWith(),
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
                                  builder: (context) => SignUpDoctorScreen1(),
                                ),
                              ),
                          child: Text(
                            "Register Now",
                            style: TextStyles.font14BlueRegular,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.Blue,
                          ),
                        ),
                  );
                },
                success: (loginResponse) {
                  context.pop();
                  context.pushNamed(Routes.homeScreen);
                },
                error: (error) {
                  _setupErrorState(context, error.message);
                },
              );
            },
            child: const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  void _setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            icon: const Icon(Icons.error, color: Colors.red, size: 32),
            content: Text(error, style: TextStyles.font28BlackSemiBoldOpen),
            actions: [
              TextButton(
                onPressed: () => context.pop(),
                child: Text(
                  'Got it',
                  style: TextStyles.font28BlackSemiBoldOpen,
                ),
              ),
            ],
          ),
    );
  }
}
