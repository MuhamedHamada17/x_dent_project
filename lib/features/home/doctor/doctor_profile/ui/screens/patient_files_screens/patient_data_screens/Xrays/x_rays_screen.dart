import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/nav_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';

class XraysScreen extends StatelessWidget {
  const XraysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Xrays", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(16),
              Section(
                textStyles: TextStyles.font22BlackMedium,
                text: "Uploaded Files",
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        verticalSpace(8),
                        NavRow(
                          text: "28/2/2025",
                          onTap: () {
                            context.pushNamed(Routes.XrayFileScreen);
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8.0,
                            vertical: 10,
                          ),
                          child: Divider(height: 1, color: ColorsManager.Grey),
                        ),
                        NavRow(text: "8/12/2024", onTap: () {}),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Divider(height: 1, color: ColorsManager.Grey),
                        ),

                        NavRow(text: "14/9/2024", onTap: () {}),
                      ],
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
