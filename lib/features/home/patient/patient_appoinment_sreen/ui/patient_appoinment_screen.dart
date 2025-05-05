import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/cancelled_appointment_list.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/completed_appointment_list.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/custom_container_row.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/upcoming_appointment_list.dart';

class PatientAppoinmentScreen extends StatefulWidget {
  const PatientAppoinmentScreen({super.key});

  @override
  State<PatientAppoinmentScreen> createState() => _PatientAppoinmentScreenState();
}

class _PatientAppoinmentScreenState extends State<PatientAppoinmentScreen> {
  String selectedStatus = "upcoming";

  void _handleStatusChange(int index) {
    setState(() {
      selectedStatus = index == 0 ? "upcoming" : index == 1 ? "completed" : "cancelled";
    });
  }

  Widget _buildAppointmentWidget() {
    switch (selectedStatus) {
      case "upcoming":
        return const UpcomingAppointmentList(); // عرض القائمة بدل الويدجت
      case "completed":
        return const CompletedAppointmentList(); // عرض القائمة بدل الويدجت
      case "cancelled":
        return const CancelledAppointmentList(); // عرض القائمة بدل الويدجت
      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            color: ColorsManager.lighterBLUE,
            width: double.infinity,
            height: 185.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Appointments", style: TextStyles.font28BlackMedium),
                    Image.asset(
                      "assets/png/search_appointment.png",
                      width: 44.w,
                      height: 44.h,
                    ),
                  ],
                ),
                verticalSpace(20),
                CustomContainerRow(onStatusChanged: _handleStatusChange),
              ],
            ),
          ),
          Expanded( // إضافة Expanded عشان القائمة تاخد المساحة المتاحة
            child: Column(
              children: [
                verticalSpace(10),
                Expanded(child: _buildAppointmentWidget()), // جعل الويدجت يتمدد
              ],
            ),
          ),
        ],
      ),
    );
  }
}