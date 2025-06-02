import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/forget_password/forget/logic/forget_password_cubit.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/widgets/app_bar_forget.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theiming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../data/models/forget_password_request_body.dart';
import '../logic/forget_password_state.dart';

class ForgetScreen extends StatelessWidget {
  ForgetScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgetPasswordCubit>(
      create: (context) => getIt<ForgetPasswordCubit>(),
      child: Scaffold(
        backgroundColor: ColorsManager.lighterBLUE,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                verticalSpace(50),
                AppBarForget(text: "Forget Password"),
                verticalSpace(50),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Email", style: TextStyles.font14BlackSemiBold),
                    ],
                  ),
                ),
                verticalSpace(10),
                SizedBox(
                  width: 320.w,
                  height: 46.h,
                  child: AppTextFormField(
                    controller: emailController,
                    hintText: "you@email.com",
                    hintStyle: TextStyles.font14GreyRegular,
                    prefixIcon: const Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsManager.Grey.withOpacity(.8),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
                verticalSpace(60),
                Center(
                  child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
                    listener: (context, state) {
                      state.whenOrNull(
                        success: (response) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.green,
                                content: Text(response.message)),
                          );
                          context.pushNamed(Routes.otpScreen);
                        },
                        error: (error) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                backgroundColor: Colors.red, // Red for error
                                content: Text(error.message)),
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
                              if (formKey.currentState!.validate()) {
                                context.read<ForgetPasswordCubit>().sendCode(
                                  ForgetPasswordRequestBody(
                                    email: emailController.text.trim(),
                                  ),
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
      ),
    );
  }
}