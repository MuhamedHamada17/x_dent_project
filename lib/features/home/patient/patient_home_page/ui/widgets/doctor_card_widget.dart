import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

import '../../../../../../core/widgets/app_text_button.dart';

class DoctorCardWidget extends StatelessWidget {
  final String? doctorName;
  final String? specialty;
  final String? imagePath;
  final double? rating;

  const DoctorCardWidget({
    Key? key,
    this.doctorName,
    this.specialty,
    this.imagePath,
    this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 390.w,
      height: 135.h,
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.Blue, width: 1),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.lighterBLUE.withOpacity(0.3),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ✅ الصورة ستظل بحجم ثابت
          Container(
            width: 96.w,
            height: 96.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.Grey, width: 1),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: ColorsManager.OfWhite,
              child: Text(
                "AZ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      doctorName ?? "Dr Amr Yousef",
                      maxLines: 2,
                      style: TextStyles.font20BlackRegular,
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("From",style: TextStyles.font12BlackRegular,),
                        Text("200L.E",style: TextStyles.font12BlueSemi,)

                      ],
                    ),
                  ],
                ),
                verticalSpace(4),
                Text(
                  specialty ?? "El Geish Street, Mansoura",
                  style: TextStyles.font12BlackRegular,
                ),
                verticalSpace(8),
                Row(
                  children: [
                   Image.asset("assets/png/Star.png",height: 20.h,width: 20.w,),
                    horizontalSpace(4),
                    Text(
                      rating != null ? rating.toString() : "4.5 (379)",
                      style: TextStyles.font12BlackRegular,
                    ),
                    Spacer(),
                    Container(
                      width: 90.w,
                      height: 35.h,
                      child: AppTextButton(
                                    buttonText: "Book Now",
                                    borderRadius: 20,
                                    verticalPadding: 4.h,
                                    backgroundColor: ColorsManager.Blue,
                                    textStyle: TextStyles.font12WhiteRegular,
                                    onPressed: () {}
                                  ),
                    )

                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
