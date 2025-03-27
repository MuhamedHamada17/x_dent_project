import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theiming/colors.dart';
import '../../../../../../core/theiming/styles.dart';

class PerscriptionsPattientScreen extends StatelessWidget {
  const PerscriptionsPattientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 26,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  horizontalSpace(70),
                  Text("Prescriptions", style: TextStyles.font20BlackRegular),
                ],
              ),
            ),
            verticalSpace(20),
            Container(
              height: 47.h,
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("   ",style: TextStyles.font22BlackMedium,),
                ],
              ),
            ),
            verticalSpace(20),
            Text(" You have no current ",style: TextStyles.font20BlueRegular,),
            Text("prescriptions.",style: TextStyles.font20BlueRegular,)

          ],
        ),
      ),
    );
  }
}
