import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_state.dart';

class EditProfilePatientScreen extends StatelessWidget {
  const EditProfilePatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<EditProfilePatientCubit>(),
      child: const EditProfilePatientView(),
    );
  }
}

class EditProfilePatientView extends StatelessWidget {
  const EditProfilePatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<EditProfilePatientCubit, EditProfilePatientState>(
            listener: (context, state) {
              state.when(
                initial: () {},
                loading: () {},
                success: (response) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(response.message ?? 'تم تحديث الملف الشخصي بنجاح'),
                      backgroundColor: Colors.green,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                  // العودة للشاشة السابقة بعد النجاح
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                  });
                },
                error: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(error.message ?? 'Profile update failed'),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              );
            },
            builder: (context, state) {
              final cubit = context.read<EditProfilePatientCubit>();
              return Form(
                key: cubit.formKey,
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                          Text("Edit Profile", style: TextStyles.font20BlackRegular),
                          horizontalSpace(50),
                        ],
                      ),
                      verticalSpace(32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("  First Name", style: TextStyles.font20BlackRegular),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.firstNameController,
                          hintText: 'Enter first name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter first name';
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
                          Text("  Last Name", style: TextStyles.font20BlackRegular),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.lastNameController,
                          hintText: 'Enter last name',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter last name';
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
                          Text("  Email", style: TextStyles.font20BlackRegular),
                        ],
                      ),
                      verticalSpace(8),
                      SizedBox(
                        width: 330.w,
                        height: 40.h,
                        child: AppTextFormField(
                          controller: cubit.emailController,
                          hintText: 'Enter email',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Please enter your email';
                            }
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email successfully';
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
                        loading: () =>  CircularProgressIndicator(
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
                              cubit.editProfile();
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