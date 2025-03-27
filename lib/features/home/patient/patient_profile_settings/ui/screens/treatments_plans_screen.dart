import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/treatment_plan_row_patient.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/routing/routes.dart';
import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';
import '../../../../../../core/widgets/app_text_button.dart';

class TreatmentsPlansScreenPatient extends StatelessWidget {
  const TreatmentsPlansScreenPatient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Treatment Plan", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(32),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              color: ColorsManager.lighterBLUE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    " Status   Session",
                    style: TextStyles.font12BlackRegular,
                  ),
                  Text("Date  ", style: TextStyles.font12BlackRegular),
                ],
              ),
            ),
            verticalSpace(8),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: ListView(
                  children: const [
                    TreatmentPlanRowPatient(true, "Oral Evaluation", "18/7/2024"),
                    TreatmentPlanRowPatient(true, "Relieve Crowding", "4/8/2024"),
                    TreatmentPlanRowPatient(
                      true,
                      "Correct Buccal Occlusions",
                      "24/9/2024",
                    ),
                    TreatmentPlanRowPatient(true, "Reduce Overbite", "12/10/2024"),
                    TreatmentPlanRowPatient(false, "Align Teeth", "7/1/2025"),
                    TreatmentPlanRowPatient(false, "Check Up", "15/2/2025"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 120,
                vertical: 40,
              ),
              child: Center(
                child: AppTextButton(
                  borderRadius: 25,
                  verticalPadding: 4,
                  backgroundColor: ColorsManager.Blue,
                  buttonText: "Edit Plan",
                  textStyle: TextStyles.font22WhiteMedium,
                  onPressed: () {
                    context.pushNamed(Routes.EditTreatmentPlanScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
