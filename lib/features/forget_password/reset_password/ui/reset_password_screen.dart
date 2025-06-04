import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theiming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../forget/ui/widgets/app_bar_forget.dart';
import '../logic/reset_password_cubit.dart';
import '../logic/reset_password_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _isConfirmPasswordObscured = true;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ResetPasswordCubit>(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: ColorsManager.lighterBLUE,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              verticalSpace(50),
              AppBarForget(text: "Reset Password"), // Updated text to be more accurate
              verticalSpace(50),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Password", style: TextStyles.font14BlackSemiBold),
                  ],
                ),
              ),
              verticalSpace(10),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  controller: passwordController,
                  hintText: "At Least 8 digits",
                  hintStyle: TextStyles.font14MRegularMon,
                  isObscureText: _isPasswordObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordObscured ? Icons.visibility_off : Icons.visibility,
                      color: ColorsManager.Grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordObscured = !_isPasswordObscured;
                      });
                    },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Confirm Password",
                      style: TextStyles.font14BlackSemiBold,
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
              SizedBox(
                width: 320.w,
                height: 46.h,
                child: AppTextFormField(
                  controller: confirmPasswordController,
                  hintText: "********",
                  hintStyle: TextStyles.font14MRegularMon,
                  isObscureText: _isConfirmPasswordObscured,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isConfirmPasswordObscured ? Icons.visibility_off : Icons.visibility,
                      color: ColorsManager.Grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isConfirmPasswordObscured = !_isConfirmPasswordObscured;
                      });
                    },
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
              ),
              verticalSpace(15),
              Center(
                child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.green,
                            content: Text(response.message),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                        context.pushNamed(Routes.loginPatientScreen);
                      },
                      error: (error) {
                        String errorMessage = error;
                        if (error.contains('Validation Error')) {
                          errorMessage = 'Invalid input. Please check your password.';
                        } else if (error.contains('No email found')) {
                          errorMessage = 'No email found. Please start the process again.';
                        } else if (error.contains('required')) {
                          errorMessage = 'Password or confirmation is required.';
                        } else {
                          errorMessage = 'An error occurred. Please try again.';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.red,
                            content: Text(errorMessage),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const CircularProgressIndicator(
                        color: ColorsManager.Blue,
                      ),
                      orElse: () => SizedBox(
                        width: 200.w,
                        height: 45.h,
                        child: AppTextButton(
                          buttonText: "Send",
                          borderRadius: 20,
                          verticalPadding: 4.h,
                          backgroundColor: ColorsManager.Blue,
                          textStyle: TextStyles.font20whiteRegular,
                          onPressed: () {
                            if (passwordController.text.isEmpty ||
                                confirmPasswordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Please enter both password and confirmation'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else if (passwordController.text != confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Passwords do not match'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else if (passwordController.text.length < 8) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red,
                                  content: Text('Password must be at least 8 characters'),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            } else {
                              context.read<ResetPasswordCubit>().resetPassword(
                                passwordController.text.trim(),
                                confirmPasswordController.text.trim(),
                              );
                            }
                          },
                        ),
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