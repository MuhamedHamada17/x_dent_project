import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theiming/colors.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../forget/ui/widgets/app_bar_forget.dart';
import '../logic/otp_cubit.dart';
import '../logic/otp_state.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController codeController = TextEditingController();

    return BlocProvider<OtpCubit>(
      create: (context) => getIt<OtpCubit>(),
      child: Scaffold(
        backgroundColor: ColorsManager.lighterBLUE,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            children: [
              verticalSpace(50),
              AppBarForget(text: "Verification"),
              verticalSpace(60),
              Text("Enter Verification Code", style: TextStyles.font16MonemiBold),
              verticalSpace(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildOtpInput(context, codeController),
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "if you didn't receive a code, ",
                    style: TextStyles.font14MediumMon,
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: إضافة logic لإعادة إرسال الكود
                      debugPrint('Resend OTP clicked');
                    },
                    child: Text("Resend", style: TextStyles.font14BlueMediumMon),
                  ),
                ],
              ),
              verticalSpace(30),
              Center(
                child: BlocConsumer<OtpCubit, OtpState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.green, // Red for error
                              content: Text(response.message)),
                        );
                        context.pushNamed(Routes.resetPassword);
                      },
                      error: (error) {
                        String errorMessage = error;
                        if (error.contains('invalid')) {
                          errorMessage = 'Invalid OTP code. Please try again.';
                        } else if (error.contains('required')) {
                          errorMessage = 'Email or code is required. Please try again.';
                        } else if (error.contains('API logic error')) {
                          errorMessage = 'Invalid request. Please check your input.';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(errorMessage)),
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
                            if (codeController.text.length == 4) {
                              context.read<OtpCubit>().verifyCode(
                                codeController.text.trim(),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.red, // Red for error
                                  content: Text('Please enter a 4-digit code'),
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
    );
  }

  Widget _buildOtpInput(BuildContext context, TextEditingController controller) {
    return PinCodeTextField(
      appContext: context,
      length: 4, // عدد الحقول
      animationType: AnimationType.fade,
      textStyle: TextStyles.font24semiBoldMon.copyWith(color: Colors.black),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        activeColor: ColorsManager.Blue,
        inactiveColor: ColorsManager.Blue.withOpacity(0.5),
        selectedColor: ColorsManager.Blue,
        borderWidth: 2,
      ),
      cursorColor: ColorsManager.Blue,
      keyboardType: TextInputType.number,
      animationDuration: const Duration(milliseconds: 300),
      controller: controller,
      onChanged: (value) {
        debugPrint('OTP code: $value');
      },
    );
  }
}