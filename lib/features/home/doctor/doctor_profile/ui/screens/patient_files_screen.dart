import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/search_text_form.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/patients_table.dart';

class PatientFilesScreen extends StatelessWidget {
  const PatientFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Patients List", style: TextStyles.font20BlackRegular),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            color: ColorsManager.lighterBLUE,
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SizedBox(
                  height: 42.h,
                  child: SearchTextForm(
                    borderColor: Colors.grey,
                    hintStyle: TextStyles.font12GreyRegular,
                  ),
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Sort by", style: TextStyles.font12BlueRegular),
                    horizontalSpace(4),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 10,
                      color: ColorsManager.Blue,
                    ),
                    horizontalSpace(8),
                  ],
                ),
                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name", style: TextStyles.font14BlackRegular),
                    Text(
                      "Date of 1st Appt.   ",
                      style: TextStyles.font12BlackRegular,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: PatientsTable()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              "You Currently have  patients.",
              style: TextStyles.font14BlueRegular,
            ),
          ),
        ],
      ),
    );
  }
}
