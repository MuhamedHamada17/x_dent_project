import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class CancelledAppointmentWidget extends StatelessWidget {
  final VoidCallback onReBook;

  const CancelledAppointmentWidget({
    super.key,
    required this.onReBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w, // نفس الأبعاد كـ Completed
      height: 320.h,
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              verticalSpace(15),
              Text(
                "Jan 10, 2025 - 10:00 AM",
                style: TextStyles.font14BlackRegular,
              ),
            ],
          ),
          verticalSpace(25),
          Divider(height: 20), // إضافة Divider كما في Completed
          verticalSpace(15),
          Row(
            children: [
              Container(
                width: 96.w,
                height: 96.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.Grey, // نفس الحدود كـ Completed
                    width: 0.7,
                  ),
                ),
                child: CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Colors.grey[200],
                  child: Text(
                    "AZ", // يمكن استبداله ببيانات ديناميكية
                    style: TextStyles.font16GreyRegular,
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr. Ahmed Mahmoud",
                      style: TextStyles.font20BlackRegular,
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
                        Image.asset("assets/png/location_patient.png", width: 24, height: 24),
                        horizontalSpace(4),
                        Text(
                          "Gehan Street, Mansoura",
                          style: TextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                    verticalSpace(4),
                    Row(
                      children: [
                        Image.asset("assets/png/Book_patient.png", width: 24, height: 24),
                        horizontalSpace(4),
                        Text(
                          "Booking ID: #573DK98M",
                          style: TextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(15),
          Divider(height: 20), // إضافة Divider ثاني
          verticalSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 310.w, // تعديل الحجم كما طلبت
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: onReBook, // الزر الوحيد
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.Blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      ),
                      child: Text(
                        "Re-Book",
                        style: TextStyles.font20whiteRegular,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}