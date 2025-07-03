import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class XrayFileScreen extends StatelessWidget {
  final String imageUrl;
  final String uploadedAt;
  final int imageId;

  const XrayFileScreen({
    super.key,
    required this.imageUrl,
    required this.uploadedAt,
    required this.imageId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
              child: Text(uploadedAt, style: TextStyles.font22BlackMedium),
            ),
            verticalSpace(16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 229.h,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return SizedBox(
                        width: double.infinity,
                        height: 229.h,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                            color: ColorsManager.Blue,
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) => Image.asset(
                      'assets/png/Xray_diagnoses.png',
                      width: double.infinity,
                      height: 229.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Uploaded $uploadedAt",
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
              onPressed: () async {
                await SharedPrefHelper.setData('xray_image_id', imageId);
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
