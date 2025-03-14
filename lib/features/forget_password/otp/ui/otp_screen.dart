import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/app_router.dart';
import '../../../../core/theiming/colors.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../forget/ui/widgets/app_bar_forget.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.lighterBLUE,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            verticalSpace(50),
            AppBarForget(text: "Verification"),
            verticalSpace(60),
            Text("Enter Verification Code", style: TextStyles.font16MonemiBold),
            verticalSpace(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), // **إضافة بادينج أفقي**
              child: _buildOtpInput(context),
            ),
            verticalSpace(10),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text("if you didn't receive a code, ",style: TextStyles.font14MediumMon,),
               GestureDetector(
                 onTap: (){},
                   child: Text("Resend",style: TextStyles.font14BlueMediumMon,))
             ],
           ),
            verticalSpace(30),
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
                    context.pushNamed(Routes.resetPassword);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpInput(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 4, // عدد الحقول
      animationType: AnimationType.fade,
      textStyle: TextStyles.font24semiBoldMon.copyWith(color: Colors.black),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        fieldHeight: 50,
        fieldWidth: 50,
        activeFillColor: Colors.white,
        activeColor: ColorsManager.Blue,
        inactiveColor: ColorsManager.Blue.withOpacity(0.5),
        selectedColor: ColorsManager.Blue,
        borderWidth: 2,
      ),
      cursorColor: ColorsManager.Blue,
      keyboardType: TextInputType.number,
      animationDuration: Duration(milliseconds: 300),
      onChanged: (value) {},
    );
  }
}
