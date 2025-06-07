import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/edit_treatment_plan_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/calender.dart';

class AddPrescriptions extends StatefulWidget {
  const AddPrescriptions({super.key});

  @override
  State<AddPrescriptions> createState() => _AddPrescriptionsState();
}

class _AddPrescriptionsState extends State<AddPrescriptions> {
  DateTime? selectedDates;
  void _openDatesPicker() async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DatePickerScreen(initialDate: selectedDates),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDates = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          EditTreatmentPlanScreen(),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 7, sigmaY: 5),
            child: AlertDialog(
              backgroundColor: ColorsManager.OfWhite,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
              title: Row(
                children: [
                  horizontalSpace(2),
                  const Icon(Icons.library_add_outlined, size: 24),
                  horizontalSpace(10),
                  Text("Add Prescription", style: TextStyles.font28BlackMedium),
                ],
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Write new prescription name and how often should be applied.",
                    style: TextStyles.font18BlackRegular,
                  ),
                  verticalSpace(15),
                  Text("  Plan:", style: TextStyles.font12BlueRegular),
                  verticalSpace(16),
                  TextField(
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
                  Text("  Datepicker", style: TextStyles.font14GreyRegular),
                  verticalSpace(5),
                  GestureDetector(
                    onTap: _openDatesPicker,
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
                            selectedDates == null
                                ? "Wednesday, 11th January"
                                : "${selectedDates!.toLocal()}".split(' ')[0],
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
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
