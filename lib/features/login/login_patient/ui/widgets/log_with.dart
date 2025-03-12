import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theiming/colors.dart';
import '../../../../../core/theiming/styles.dart';

class LogWith extends StatelessWidget {
  const LogWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 320.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.white,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: ColorsManager.Blue.withOpacity(0.7),
                  width: 1.5,
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/Apple.png",
                  width: 18.w,
                  height: 23.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Login with Apple",
                  style: TextStyles.font14BlackSemiBold,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(25),
        SizedBox(
          width: 320.w,
          height: 50.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.white,
              padding: EdgeInsets.symmetric(vertical: 4.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: ColorsManager.Blue.withOpacity(0.7),
                  width: 1.5,
                ),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/png/google.png",
                  width: 18.w,
                  height: 23.h,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Login with Google",
                  style: TextStyles.font14BlackSemiBold,
                ),
              ],
            ),
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
