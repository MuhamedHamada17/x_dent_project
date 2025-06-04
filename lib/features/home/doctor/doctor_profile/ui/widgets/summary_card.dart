import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  final bool isBlue;

  const SummaryCard({
    super.key,
    required this.title,
    required this.value,
    required this.isBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.h),
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          color: isBlue ? ColorsManager.Blue : ColorsManager.lighterBLUE,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.Blue),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyles.font14WhiteRegular.copyWith(
                color: isBlue ? Colors.white : Colors.black,
              ),
            ),
            verticalSpace(16),
            Text(
              value,
              style: TextStyles.font22WhiteMedium.copyWith(
                color: isBlue ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
