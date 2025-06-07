import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/logic/doctor_patient_treatment_plan_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/calender.dart';

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
  late TextEditingController _nameController;
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    selectedDate = DateTime.tryParse(widget.initialDate);
  }

  void _openDatePicker() async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DatePickerScreen(initialDate: selectedDate),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
      ),
      title: Row(
        children: [
          const Icon(Icons.edit, size: 24),
          horizontalSpace(10),
          const Text(
            "Edit",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Rewrite your new plan and select a new date.",
            style: TextStyle(fontSize: 18),
          ),
          verticalSpace(15),
          const Text(
            "Plan:",
            style: TextStyle(fontSize: 12, color: Colors.blue),
          ),
          verticalSpace(16),
          TextField(
            controller: _nameController,
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
          const Text(
            "Datepicker",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          verticalSpace(5),
          GestureDetector(
            onTap: _openDatePicker,
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
                    selectedDate == null
                        ? widget.initialDate
                        : "${selectedDate!.toLocal()}".split(' ')[0],
                    style: const TextStyle(fontSize: 16, color: Colors.blue),
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
                child: const Text(
                  "Cancel",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                width: 120.w,
                height: 45.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  onPressed: () {
                    if (_nameController.text.isNotEmpty &&
                        selectedDate != null) {
                      context
                          .read<DoctorPatientTreatmentPlanCubit>()
                          .updateTreatmentPlan(
                            planId: widget.planId,
                            name: _nameController.text,
                            date: selectedDate!.toIso8601String().split('T')[0],
                          );
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    "Confirm",
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
    );
  }
}
