import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/treatment_plan_screen.dart';

class DeleteTreatmentPlan extends StatelessWidget {
  final int planId;
  final String planName;

  const DeleteTreatmentPlan({
    super.key,
    required this.planId,
    required this.planName,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TreatmentPlanScreen(),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
          child: AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            title: Row(
              children: [
                const Icon(Icons.delete_forever_outlined, size: 28),
                horizontalSpace(10),
                const Text(
                  "Delete",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            content: SizedBox(
              width: 300.w,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Are you sure you want to delete '$planName'?",
                    style: const TextStyle(fontSize: 20),
                  ),
                  verticalSpace(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 110.w,
                        height: 45.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                          ),
                          onPressed: () {
                            context
                                .read<DoctorPatientTreatmentPlanCubit>()
                                .deleteTreatmentPlan(planId);
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Delete",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
