import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/add_plans.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/treatment_plan_row.dart';

class EditTreatmentPlanScreen extends StatelessWidget {
  const EditTreatmentPlanScreen({super.key});

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
                  children: [
                    TreatmentPlanRow(true, "Oral Evaluation", "Delete "),
                    TreatmentPlanRow(true, "Relieve Crowding", "Delete "),
                    TreatmentPlanRow(
                      true,
                      "Correct Buccal Occlusions",
                      "Delete ",
                    ),
                    TreatmentPlanRow(true, "Reduce Overbite", "Delete "),
                    TreatmentPlanRow(false, "Align Teeth", "Edit "),
                    TreatmentPlanRow(false, "Check Up", "Edit "),
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
                  buttonText: "Add Plans",
                  textStyle: TextStyles.font22WhiteMedium,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddPlans();
                      },
                    );
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
