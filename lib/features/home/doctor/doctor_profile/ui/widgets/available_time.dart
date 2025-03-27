import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class AvailableTime extends StatelessWidget {
  const AvailableTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorsManager.lighterBLUE),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("From", style: TextStyles.font12BlackRegular),
                  verticalSpace(10),
                  Container(
                    height: 35.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: ColorsManager.Blue,

                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorsManager.lighterBLUE),
                    ),
                    child: Center(
                      child: Text(
                        "8:00 AM",
                        style: TextStyles.font12WhiteRegular,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("To", style: TextStyles.font12BlackRegular),
                  verticalSpace(10),
                  Container(
                    height: 35.h,
                    width: 70.w,
                    decoration: BoxDecoration(
                      color: ColorsManager.Blue,

                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: ColorsManager.lighterBLUE),
                    ),
                    child: Center(
                      child: Text(
                        "5:00 PM",
                        style: TextStyles.font12WhiteRegular,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
