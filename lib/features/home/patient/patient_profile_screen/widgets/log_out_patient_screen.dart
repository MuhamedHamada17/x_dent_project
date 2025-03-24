import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import '../../../../../core/theiming/colors.dart';
import '../../../../../core/theiming/styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class LogOutPatientScreen extends StatelessWidget {
  const LogOutPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Image.asset(
            'assets/png/delete.png',
            width: 24.w,
            height: 24.h,
          ),
          horizontalSpace(10),
          Text("Log Out", style: TextStyles.font28BlackMedium),
        ],
      ),
      content: Text(
        "Are you sure you want to log out?",
        style: TextStyles.font20BlackRegular,
      ),
      actions: [
        Row(
          children: [
            // زر Cancel على اليسار
            TextButton(
              onPressed: () {
                Navigator.pop(context); // إغلاق النافذة فقط
              },
              child: Text(
                "Cancel",
                style: TextStyles.font22BlackMedium,
              ),
            ),
            const Spacer(), // يضع Yes, log out على اليمين

            // زر Yes, log out على اليمين
            SizedBox(
              width: 153.w,
              height: 50.h,
              child: AppTextButton(
                buttonText: "Log Out",
                borderRadius: 25,
                verticalPadding: 4.h,
                backgroundColor: ColorsManager.Blue,
                textStyle: TextStyles.font22WhiteMedium,
                onPressed: () {
                  Navigator.pop(context); // إغلاق النافذة
                  Navigator.pop(context); // الرجوع للشاشة السابقة بعد تسجيل الخروج
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
