import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/treatment_plan_row.dart';

class TreatmentPlanScreen extends StatelessWidget {
  const TreatmentPlanScreen({super.key});

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
                    TreatmentPlanRow(true, "Oral Evaluation", "18/7/2024"),
                    TreatmentPlanRow(true, "Relieve Crowding", "4/8/2024"),
                    TreatmentPlanRow(
                      true,
                      "Correct Buccal Occlusions",
                      "24/9/2024",
                    ),
                    TreatmentPlanRow(true, "Reduce Overbite", "12/10/2024"),
                    TreatmentPlanRow(false, "Align Teeth", "7/1/2025"),
                    TreatmentPlanRow(false, "Check Up", "15/2/2025"),
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
