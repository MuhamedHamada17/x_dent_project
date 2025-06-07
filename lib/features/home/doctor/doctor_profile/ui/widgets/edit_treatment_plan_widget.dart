import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_cubit.dart';

class EditTreatmentPlan extends StatefulWidget {
  final int planId;
  final String initialName;
  final String initialDate;

  const EditTreatmentPlan({
    super.key,
    required this.planId,
    required this.initialName,
    required this.initialDate,
  });

  @override
  State<EditTreatmentPlan> createState() => _EditTreatmentPlanState();
}

class _EditTreatmentPlanState extends State<EditTreatmentPlan> {
  late TextEditingController _planNameController;
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    super.initState();
    _planNameController = TextEditingController(text: widget.initialName);
    _selectedDate = _dateFormat.parse(widget.initialDate);
  }

  @override
  void dispose() {
    _planNameController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _deletePlan(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: Text(
            "Are you sure you want to delete '${_planNameController.text}'?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              await context
                  .read<DoctorPatientTreatmentPlanCubit>()
                  .deleteTreatmentPlan(widget.planId);
              Navigator.pop(dialogContext); // Close confirmation dialog
              Navigator.pop(context); // Close EditTreatmentPlan dialog
            },
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
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
            Text("Edit Plan", style: TextStyles.font28BlackMedium),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Edit your plan and select a date.",
              style: TextStyles.font18BlackRegular,
            ),
            verticalSpace(15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Plan:", style: TextStyles.font12BlueRegular),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deletePlan(context),
                ),
              ],
            ),
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
                Row(
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        "Cancel",
                        style: TextStyles.font22BlackMedium,
                      ),
                    ),
                  ],
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
                        await context
                            .read<DoctorPatientTreatmentPlanCubit>()
                            .updateTreatmentPlan(
                              planId: widget.planId,
                              name: _planNameController.text,
                              date: _dateFormat.format(_selectedDate!),
                            );
                        if (mounted) {
                          Navigator.pop(context, true);
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
