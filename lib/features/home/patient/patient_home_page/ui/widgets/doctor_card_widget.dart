import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class DoctorCardWidget extends StatelessWidget {
  final String? doctorName;
  final String? specialty;
  final String? imagePath;
  final double? rating;
  final int? reviewsCount;
  final String? price;
  final int doctorId; // إضافة doctorId
  final String specialization; // إضافة specialization

  const DoctorCardWidget({
    Key? key,
    this.doctorName,
    this.specialty,
    this.imagePath,
    this.rating,
    this.reviewsCount,
    this.price,
    required this.doctorId, // إجباري
    required this.specialization, // إجباري
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 150.h,
      padding: EdgeInsets.all(4.w),
      margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(16.r),
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
          Container(
            width: 96.w,
            height: 96.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: ColorsManager.Grey, width: 1),
            ),
            child: CircleAvatar(
              radius: 24.r,
              backgroundColor: ColorsManager.OfWhite,
              child: Text(
                doctorName != null && doctorName!.isNotEmpty
                    ? doctorName!.substring(0, 2).toUpperCase()
                    : "AZ",
                style: TextStyle(
                  fontSize: 18.sp, // Corrected from 'ificazione'
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        doctorName ?? "Dr Amr Yousef",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyles.font20BlackRegular,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          "From",
                          style: TextStyles.font12BlackRegular,
                        ),
                        Text(
                          price != null ? "$price EGP" : "200 EGP",
                          style: TextStyles.font12BlueSemi,
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpace(3),
                Text(
                  specialty ?? "Cavity",
                  style: TextStyles.font12BlackRegular,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(8),
                Row(
                  children: [
                    Image.asset(
                      "assets/png/Star.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                    horizontalSpace(8),
                    Text(
                      rating != null && reviewsCount != null
                          ? "$rating ($reviewsCount)"
                          : "4.5 (379)", // Corrected from 'hedron'
                      style: TextStyles.font12BlackRegular,
                    ),
                    const Spacer(),
                    Container(
                      width: 90.w,
                      height: 35.h,
                      child: AppTextButton(
                        buttonText: "Book Now",
                        borderRadius: 20,
                        verticalPadding: 4.h,
                        backgroundColor: ColorsManager.Blue,
                        textStyle: TextStyles.font12WhiteRegular,
                        onPressed: () {
                          if (specialization.isEmpty) {
                            debugPrint('DoctorCardWidget: خطأ - التخصص فارغ');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('خطأ: لم يتم تحديد التخصص')),
                            );
                            return;
                          }
                          if (doctorId == 0) {
                            debugPrint(
                                'DoctorCardWidget: خطأ - معرف الدكتور غير صالح: $doctorId');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('خطأ: معرف الدكتور غير صالح')),
                            );
                            return;
                          }
                          debugPrint(
                              'DoctorCardWidget: الانتقال إلى DoctorDetailsScreen مع التخصص: $specialization, معرف الدكتور: $doctorId');
                          context.pushNamed(
                            Routes.doctorDetailsScreen,
                            arguments: {
                              'specialization': specialization,
                              'doctorId': doctorId,
                            },
                          );
                        },
                      ),
                    ),
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