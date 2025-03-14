import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/colors.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/theiming/styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../forget/ui/widgets/app_bar_forget.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            verticalSpace(50),
            AppBarForget(text: "Forget Password"),
            verticalSpace(50),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Password", style: TextStyles.font14BlackSemiBold),

                ],
              ),
            ),
            verticalSpace(10),
            SizedBox(
              width: 320.w,
              height: 46.h,
              child: AppTextFormField(
                hintText: "At Least 8 digits",
                hintStyle: TextStyles.font14MRegularMon,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.Grey.withOpacity(.8), width: 1.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            verticalSpace(10),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Confirm Password", style: TextStyles.font14BlackSemiBold),

                ],
              ),
            ),
            verticalSpace(10),
            SizedBox(
              width: 320.w,
              height: 46.h,
              child: AppTextFormField(
                hintText: "********",
                hintStyle: TextStyles.font14MRegularMon,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorsManager.Grey.withOpacity(.8), width: 1.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.3),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            verticalSpace(15),
            Center(
              child: SizedBox(
                width: 200.w,
                height: 45.h,
                child: AppTextButton(
                  buttonText: "Send",
                  borderRadius: 20,
                  verticalPadding: 4.h,
                  backgroundColor: ColorsManager.Blue,
                  textStyle: TextStyles.font20whiteRegular,
                  onPressed: () {
                    context.pushNamed(Routes.otpScreen);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
