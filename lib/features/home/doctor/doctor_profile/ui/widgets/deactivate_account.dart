import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/profile_setting/profile_settings.dart';

class DeactivateAccount extends StatelessWidget {
  const DeactivateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfileSettings(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: ColorsManager.OfWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: Row(
                children: [
                  const Icon(Icons.remove_circle_outline, size: 28),
                  horizontalSpace(10),
                  Text("Deactivate", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: SizedBox(
                width: 310.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to Deactivate your account",
                      style: TextStyles.font20BlackRegular,
                    ),
                    verticalSpace(16),
                    Text(
                      "You can only deactivate for 30 days. Account will be deleted if not reactivated within that time frame. You can reactivate by logging in.",
                      style: TextStyles.font14RedRegular,
                    ),
                    verticalSpace(32),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Cancel",
                            style: TextStyles.font22BlackMedium,
                          ),
                        ),
                        SizedBox(
                          width: 110.w,
                          height: 45.h,
                          child: AppTextButton(
                            buttonText: "Delete",
                            borderRadius: 25,
                            verticalPadding: 4,
                            backgroundColor: ColorsManager.Red,
                            textStyle: TextStyles.font22WhiteMedium,
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
