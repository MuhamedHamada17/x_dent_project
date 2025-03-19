import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/appointment_card_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/custom_container_row.dart';

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

  void _navigateToScreen(String screenName) {
    Navigator.pushNamed(context, '/$screenName');
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
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("  My Appointments", style: TextStyles.font28BlackMedium),
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
          Column(
            children: [
              verticalSpace(10),
              AppointmentCardPatient(
                status: selectedStatus,
                onCancel: () => _navigateToScreen("CancelScreen"),
                onReschedule: () => _navigateToScreen("RescheduleScreen"),
                onAddReview: () => _navigateToScreen("AddReviewScreen"),
                onReBook: () => _navigateToScreen("ReBookScreen"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}