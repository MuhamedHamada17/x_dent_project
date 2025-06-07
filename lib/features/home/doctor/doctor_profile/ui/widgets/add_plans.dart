import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_cubit.dart';

class DoctorCreateTreatment extends StatefulWidget {
  const DoctorCreateTreatment({super.key});

  @override
  State<DoctorCreateTreatment> createState() => _DoctorCreateTreatmentState();
}

class _DoctorCreateTreatmentState extends State<DoctorCreateTreatment> {
  final TextEditingController _planNameController = TextEditingController();
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    _planNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
      child: AlertDialog(
        backgroundColor: ColorsManager.OfWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Row(
          children: [
            const Icon(Icons.edit, size: 24),
            horizontalSpace(10),
            Text("Add Plan", style: TextStyles.font28BlackMedium),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your new plan and select a date.",
              style: TextStyles.font18BlackRegular,
            ),
            verticalSpace(15),
            Text("Plan:", style: TextStyles.font12BlueRegular),
            verticalSpace(16),
            TextField(
              controller: _planNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
              ),
            ),
            verticalSpace(15),
            Text("Datepicker", style: TextStyles.font14GreyRegular),
            verticalSpace(5),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 10.h,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "Select a date"
                          : _dateFormat.format(_selectedDate!),
                      style: TextStyles.font16BlueRegular,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancel",
                    style: TextStyles.font22BlackMedium,
                  ),
                ),
                SizedBox(
                  width: 120.w,
                  height: 45.h,
                  child: AppTextButton(
                    buttonText: "Confirm",
                    borderRadius: 25,
                    verticalPadding: 4,
                    backgroundColor: ColorsManager.Blue,
                    textStyle: TextStyles.font22WhiteMedium,
                    onPressed: () async {
                      if (_planNameController.text.isNotEmpty &&
                          _selectedDate != null) {
                        final patientId = await SharedPrefHelper.getPatientId();
                        await context
                            .read<DoctorPatientTreatmentPlanCubit>()
                            .createTreatmentPlan(
                              name: _planNameController.text,
                              date: _dateFormat.format(_selectedDate!),
                              patientId: patientId,
                            );
                        if (mounted) {
                          Navigator.pop(context); // Close dialog
                          context
                              .read<DoctorPatientTreatmentPlanCubit>()
                              .fetchTreatmentPlans(patientId); // Refresh list
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter a plan name and date."),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
