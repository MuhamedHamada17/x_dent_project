import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theiming/styles.dart';

class AppBarForget extends StatelessWidget {
  const AppBarForget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.pop();
            },
            child: Icon(Icons.arrow_back, size: 32),
          ),
          SizedBox(width: 19.w),
          Text(text, style: TextStyles.font28BlackSemiBoldOpen),
        ],
      ),
    );
  }
}
