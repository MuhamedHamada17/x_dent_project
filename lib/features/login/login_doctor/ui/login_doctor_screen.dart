import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';

import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/app_regex.dart';
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
                key: loginCubit.formKey, // ✅ تم تمرير formKey هنا
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(50),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(Routes.onBoardingScreen);
                          },
                          child: const Icon(Icons.arrow_back, size: 32),
                        ),
                        SizedBox(width: 19.w),
                        Text("Login", style: TextStyles.font28BlackSemiBoldOpen),
                      ],
                    ),
                    verticalSpace(50),
                    Text("Email", style: TextStyles.font14BlackSemiBold),
                    verticalSpace(10),
                    AppTextFormField(
                      controller: loginCubit.emailController,
                      hintText: "you@email.com",
                    ),
                    verticalSpace(30),
                    Text("Password", style: TextStyles.font14BlackSemiBold),
                    verticalSpace(10),
                    AppTextFormField(
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
                    verticalSpace(12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text("Forget Password?", style: TextStyles.font12BlackRegular),
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
                                if (loginCubit.formKey.currentState!.validate()) {
                                  loginCubit.login();
                                }
                              },
                            );
                          },
                        ),
                      ),
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
                    builder: (context) => const Center(
                      child: CircularProgressIndicator(color: ColorsManager.Blue),
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
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font28BlackSemiBoldOpen),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Got it', style: TextStyles.font28BlackSemiBoldOpen),
          ),
        ],
      ),
    );
  }
}
