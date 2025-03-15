import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class AppBarSpecialty extends StatelessWidget {
  const AppBarSpecialty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 140.h,
      color: ColorsManager.lighterBLUE,
      padding: EdgeInsets.symmetric(horizontal: 16.w), // إضافة هوامش على الجانبين
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back, size: 40),
          ),
          Expanded( // ✅ توسيع المساحة لوضع النص في المنتصف
            child: Center(
              child: Text(
                "Specialty",
                style: TextStyles.font28BlackMedium,
              ),
            ),
          ),
        ],
      ),
    );

  }
}
