import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/edit_treatment_plan.dart';

class AddPlans extends StatelessWidget {
  const AddPlans({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          EditTreatmentPlanScreen(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: ColorsManager.OfWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: Row(
                children: [
                  const Icon(Icons.edit, size: 24),
                  horizontalSpace(10),
                  Text("Add", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rewrite your new plan and select a new date.",
                    style: TextStyles.font18BlackRegular,
                  ),
                  verticalSpace(15),
                  Text("  Plan:", style: TextStyles.font12BlueRegular),
                  verticalSpace(16),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                    ),
                  ),
                  verticalSpace(15),
                  Text("  Datepicker", style: TextStyles.font14GreyRegular),
                  verticalSpace(5),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Wednesday, 11th January",
                          style: TextStyles.font16BlueRegular,
                        ),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
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
                        width: 120.w,
                        height: 45.h,
                        child: AppTextButton(
                          buttonText: "Confirm",
                          borderRadius: 25,
                          verticalPadding: 4,
                          backgroundColor: ColorsManager.Blue,
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
        ],
      ),
    );
  }
}
