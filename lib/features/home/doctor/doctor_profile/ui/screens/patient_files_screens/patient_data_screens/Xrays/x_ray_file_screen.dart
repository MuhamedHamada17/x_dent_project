import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class XrayFileScreen extends StatelessWidget {
  const XrayFileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(20),
            Container(
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Text("28/2/2025", style: TextStyles.font22BlackMedium),
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/png/Xray_diagnoses.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Uploaded 28/2/2025 - 8:00PM",
                        style: TextStyles.font12BlackRegular,
                      ),
                      horizontalSpace(10),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            AppTextButton(
              buttonWidth: 130.w,
              verticalPadding: 4.h,
              buttonHeight: 50,

              borderRadius: 25,
              backgroundColor: ColorsManager.Blue,
              buttonText: "Analyze",
              textStyle: TextStyles.font22WhiteMedium,
              onPressed: () {
                context.pushNamed(Routes.AnalysisScreen);
              },
            ),
            verticalSpace(32),
          ],
        ),
      ),
    );
  }
}
