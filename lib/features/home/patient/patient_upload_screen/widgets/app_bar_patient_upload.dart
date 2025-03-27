import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theiming/colors.dart';
import '../../../../../core/theiming/styles.dart';

class AppBarPatientUpload extends StatelessWidget {
  const AppBarPatientUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 185.h,
      color: ColorsManager.lighterBLUE,
      child: Column(
        children: [
          verticalSpace(60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19),
            child: Row(
              children: [
                horizontalSpace(10.w),
                IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,size: 30,)),
                horizontalSpace(40),
                Text("Upload Xrays",style: TextStyles.font28BlackMedium,)
              ],
            ),
          ),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Upload your Xrays to get a recommended dentist.",style: TextStyles.font12BlackRegular,
                  maxLines: 2,
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
