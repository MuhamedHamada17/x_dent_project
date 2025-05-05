import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';

class UpcomingAppointmentWidget extends StatefulWidget {
  final VoidCallback onCancel;
  final VoidCallback onReschedule;
  final ValueChanged<bool>? onRemindMeChanged; // معلم جديد للتحكم في الـ Switch

  const UpcomingAppointmentWidget({
    super.key,
    required this.onCancel,
    required this.onReschedule,
    this.onRemindMeChanged,
  });

  @override
  State<UpcomingAppointmentWidget> createState() => _UpcomingAppointmentWidgetState();
}

class _UpcomingAppointmentWidgetState extends State<UpcomingAppointmentWidget> {
  bool _isRemindMeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.w,
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
              Text(
                "Jan 10, 2025 - 10:00 AM",
                style: TextStyles.font14BlackRegular,
              ),
              Spacer(),
              Text(
                "Remind me",
                style: TextStyles.font12GreyRegular,
              ),
              Switch(
                value: _isRemindMeEnabled,
                onChanged: widget.onRemindMeChanged != null
                    ? (value) {
                  setState(() {
                    _isRemindMeEnabled = value;
                  });
                  widget.onRemindMeChanged!(value);
                }
                    : null,
                activeColor: Colors.orange,
              ),
            ],
          ),
          verticalSpace(15),
          Divider(height: 20),
          verticalSpace(10),
          Row(
            children: [
              Container(
                width: 96.w,
                height: 96.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorsManager.Grey, // لون الحدود الأسود
                    width: 0.7, // سمك الحدود (يمكن تعديله إلى 0.5 ليكون أخف)
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
          Divider(height: 20),
          verticalSpace(15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 150.w,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: widget.onCancel,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.lighterBLUE,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyles.font20BlueRegular,
                      ),
                    ),
                  ),
                  horizontalSpace(10),
                  SizedBox(
                    width: 150.w,
                    height: 44.h,
                    child: ElevatedButton(
                      onPressed: widget.onReschedule,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.Blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      ),
                      child: Text(
                        "Reschedule",
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