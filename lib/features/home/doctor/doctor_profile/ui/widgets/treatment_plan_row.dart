import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class TreatmentPlanRow extends StatelessWidget {
  final bool isCompleted;
  final String session;
  final String date;

  const TreatmentPlanRow(this.isCompleted, this.session, this.date);

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
              Text(
                date,
                style:
                    date == "Delete "
                        ? TextStyles.font20RedRegular
                        : TextStyles.font20BlueRegular,
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