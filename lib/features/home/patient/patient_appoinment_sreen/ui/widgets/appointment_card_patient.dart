import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';

class AppointmentCardPatient extends StatelessWidget {
  final String status; // "upcoming", "completed", "cancelled"
  final VoidCallback? onCancel;
  final VoidCallback? onReschedule;
  final VoidCallback? onAddReview;
  final VoidCallback? onReBook;

  const AppointmentCardPatient({
    Key? key,
    required this.status,
    this.onCancel,
    this.onReschedule,
    this.onAddReview,
    this.onReBook,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.h),
        width: 370.w,
        height: 320.h,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: ColorsManager.lighterBLUE.withOpacity(0.7),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(20),
            Text("Jan 10, 2025 - 10:00 AM", style: TextStyles.font14BlackRegular),
            verticalSpace(20),
            const Divider(color: ColorsManager.Grey),
            verticalSpace(20),
            Row(
              children: [
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
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Dr Ahmed Mahmoud", style: TextStyles.font20BlackRegular),
                    verticalSpace(8),
                    Row(
                      children: [
                        Image.asset("assets/png/location_patient.png", width: 24.w, height: 24.h),
                        const SizedBox(width: 4),
                        Text("Gehan Street, Mansoura", style: TextStyles.font12GreyRegular),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("assets/png/Book_patient.png", width: 24.w, height: 24.h),
                        const SizedBox(width: 4),
                        Text("Booking ID:", style: TextStyles.font12GreyRegular),
                        Text("#573DK98M", style: TextStyles.font12BlueRegular),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            verticalSpace(20),
            const Divider(color: ColorsManager.Grey),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildButtonsBasedOnStatus(),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildButtonsBasedOnStatus() {
    switch (status) {
      case "upcoming":
        return [
          _buildButton("Cancel", onCancel ?? () {}, ColorsManager.lighterBLUE),
          horizontalSpace(15),
          _buildButton("Reschedule", onReschedule ?? () {}, ColorsManager.Blue),
        ];
      case "completed":
        return [
          _buildButton("Re-Book", onReBook ?? () {}, ColorsManager.lighterBLUE,),
          horizontalSpace(15),
          _buildButton("Add Review", onAddReview ?? () {}, ColorsManager.Blue),
        ];
      case "cancelled":
        return [
          Container(
            width: 330.w, // ✅ تحديد العرض الجديد
            height: 44.h, // ✅ تحديد الارتفاع
            child: _buildButton(
              "Re-Book",
              onReBook ?? () {},
              ColorsManager.Blue,

            ),
          ),
        ];

      default:
        return [];
    }
  }

  Widget _buildButton(String text, VoidCallback onPressed, Color color) {
    return SizedBox(
      width: 160.w,
      height: 44.h,
      child: AppTextButton(
        buttonText: text,
        borderRadius: 20,
        verticalPadding: 4.h,
        backgroundColor: color,
        textStyle: color == ColorsManager.lighterBLUE
            ? TextStyles.font20BlueRegular
            : TextStyles.font20whiteRegular,
        onPressed: onPressed,
      ),
    );
  }
}