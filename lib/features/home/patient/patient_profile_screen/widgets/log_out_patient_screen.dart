import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/logout_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/logout_patient_state.dart';

class LogOutPatientScreen extends StatelessWidget {
  const LogOutPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutPatientCubit, LogoutPatientState>(
      listener: (context, state) {
        debugPrint('Logout State Changed: $state');
        state.whenOrNull(
          success: (response) {
            debugPrint('Logout Success: Navigating to loginPatientScreen');
            context.pushNamed(Routes.loginPatientScreen);
          },
          error: (error) {
            debugPrint('Logout Error: $error');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(error)),
            );
          },
        );
      },
      builder: (context, state) {
        debugPrint('Building LogOutPatientScreen with state: $state');
        return Scaffold(
          backgroundColor: Colors.transparent, // خلفية شفافة للـ dialog
          body: Center(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
              child: AlertDialog(
                backgroundColor: ColorsManager.OfWhite,
                title: Row(
                  children: [
                    Image.asset(
                      'assets/png/delete.png',
                      width: 24.w,
                      height: 24.h,
                    ),
                    horizontalSpace(10),
                    Text("Log Out", style: TextStyles.font28BlackMedium),
                  ],
                ),
                content: Text(
                  "Are you sure you want to log out?",
                  style: TextStyles.font20BlackRegular,
                ),
                actions: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          debugPrint('Cancel button pressed');
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyles.font22BlackMedium,
                        ),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 153.w,
                        height: 50.h,
                        child: state is Loading
                            ? const Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorsManager.Blue,
                            ),
                            strokeWidth: 2,
                          ),
                        )
                            : AppTextButton(
                          child: Text(
                            "Log Out",
                            style: TextStyles.font22WhiteMedium,
                          ),
                          borderRadius: 25,
                          verticalPadding: 4.h,
                          backgroundColor: ColorsManager.Blue,
                          onPressed: () {
                            debugPrint('Logout button pressed');
                            Future.microtask(() {
                              debugPrint('Calling logout function');
                              context.read<LogoutPatientCubit>().logout();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}