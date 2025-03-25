import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/treatment_plan_screen.dart';

class DeleteTreatmentPlan extends StatelessWidget {
  const DeleteTreatmentPlan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TreatmentPlanScreen(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: ColorsManager.OfWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: Row(
                children: [
                  const Icon(Icons.delete_forever_outlined, size: 28),
                  horizontalSpace(10),
                  Text("Delete", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: Container(
                width: 300.w,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to delete this plan",
                      style: TextStyles.font20BlackRegular,
                    ),
                    verticalSpace(20),
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
