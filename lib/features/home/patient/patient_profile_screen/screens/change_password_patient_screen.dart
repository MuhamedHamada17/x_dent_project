import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/change_password_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/change_password_patient_state.dart';

class ChangePasswordPatientScreen extends StatelessWidget {
  const ChangePasswordPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ChangePasswordPatientCubit>(),
      child: const ChangePasswordPatientView(),
    );
  }
}

class ChangePasswordPatientView extends StatelessWidget {
  const ChangePasswordPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<ChangePasswordPatientCubit, ChangePasswordPatientState>(
            listener: (context, state) {
              state.whenOrNull(
                success: (response) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response.message ?? 'The password has been changed successfully'),
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                error: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              final cubit = context.read<ChangePasswordPatientCubit>();
              return Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      verticalSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 26,
                              color: Colors.black,
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          Text("Change Password", style: TextStyles.font20BlackRegular),
                          horizontalSpace(50),
                        ],
                      ),
                      verticalSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("  Old Password", style: TextStyles.font20BlackRegular),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.currentPasswordController,
                          isObscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your current password';
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
                      verticalSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("  New Password", style: TextStyles.font20BlackRegular),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.newPasswordController,
                          isObscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your new password';
                            }
                            if (value.trim().length < 8) {
                              return 'Password must be at least 8 characters';
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
                      verticalSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "  Confirm New Password",
                            style: TextStyles.font20BlackRegular,
                          ),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.confirmPasswordController,
                          isObscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please confirm your new password';
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
                      verticalSpace(200),
                      state.maybeWhen(
                        loading: () => CircularProgressIndicator(
                          color: ColorsManager.Blue,
                        ),
                        orElse: () => SizedBox(
                          width: 198.w,
                          height: 47.h,
                          child: AppTextButton(
                            buttonText: "Save Changes",
                            borderRadius: 20,
                            verticalPadding: 4.h,
                            backgroundColor: ColorsManager.Blue,
                            textStyle: TextStyles.font22WhiteMedium,
                            onPressed: () {
                              cubit.changePassword();
                            },
                          ),
                        ),
                      ),
                      verticalSpace(8),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel", style: TextStyles.font22BlackMedium),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}