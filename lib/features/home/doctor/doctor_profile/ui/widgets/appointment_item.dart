import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class AppointmentItem extends StatelessWidget {
  final String plan;
  final String date;
  final bool isSwitched;
  final int index;
  final List<bool> switchStates;
  final VoidCallback onStateChanged;

  const AppointmentItem({
    super.key,
    required this.plan,
    required this.date,
    required this.isSwitched,
    required this.index,
    required this.switchStates,
    required this.onStateChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ColorsManager.lighterBLUE, width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(plan, style: TextStyles.font20BlackRegular),
              Text(date, style: TextStyles.font20BlackRegular),
            ],
          ),
          verticalSpace(16),
          Row(
            children: [
              Text("Remind", style: TextStyles.font22BlackMedium),
              const SizedBox(width: 8),
              Switch(
                value: isSwitched,
                onChanged: (_) => onStateChanged(),
                activeColor: ColorsManager.Blue,
              ),
              const Spacer(),
              SizedBox(
                width: 160.w,
                child: AppTextButton(
                  borderRadius: 25,
                  verticalPadding: 2,
                  backgroundColor: ColorsManager.Blue,
                  buttonText: "Reschedule",
                  textStyle: TextStyles.font22WhiteMedium,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
