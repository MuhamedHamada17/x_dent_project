import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theiming/styles.dart';

class AppBarLogin extends StatelessWidget {
  const AppBarLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            context.pushNamed(Routes.onBoardingScreen);
          },
          child: const Icon(Icons.arrow_back, size: 32),
        ),
        SizedBox(width: 19.w),
        Text("Login", style: TextStyles.font28BlackSemiBoldOpen),
      ],
    );
  }
}
