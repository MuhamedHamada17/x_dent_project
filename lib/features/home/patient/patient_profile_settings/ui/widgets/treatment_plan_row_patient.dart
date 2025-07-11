import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/delete_treatment_plan_widget.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/edit_treatment_plan_widget.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/delete_treatment_plan_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/edit_treatment_plan_patient.dart';

class TreatmentPlanRowPatient extends StatelessWidget {
  final bool isCompleted;
  final String session;
  final String date;

  const TreatmentPlanRowPatient(this.isCompleted, this.session, this.date,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: isCompleted ? Colors.green : ColorsManager.Grey,
                  ),
                ),
                child: Icon(
                  isCompleted ? Icons.check : Icons.close,
                  color: isCompleted ? Colors.green : ColorsManager.Grey,
                ),
              ),
              horizontalSpace(8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(session, style: TextStyles.font20BlackRegular),
                ),
              ),
              GestureDetector(
                onTap: () {
                  date == "Delete "
                      ? showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return DeleteTreatmentPlanPatient();
                          },
                        )
                      : showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return EditTreatmentPlanPatient();
                          },
                        );
                },
                child: Text(
                  date,
                  style: date == "Delete "
                      ? TextStyles.font20RedRegular
                      : TextStyles.font20BlueRegular,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: Divider(height: 1, color: ColorsManager.Grey),
          ),
        ],
      ),
    );
  }
}
//TextStyles.font20BlueRegular
