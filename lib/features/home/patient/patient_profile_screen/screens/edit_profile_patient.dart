import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/widgets/gender_selector_patient.dart';

class EditProfilePatientScreen extends StatefulWidget {
  const EditProfilePatientScreen({super.key});

  @override
  State<EditProfilePatientScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfilePatientScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Colors.black,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text("Edit Profile", style: TextStyles.font20BlackRegular),
                    horizontalSpace(50),
                  ],
                ),
                verticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  Name", style: TextStyles.font20BlackRegular),
                  ],
                ),
                verticalSpace(12),
                SizedBox(
                  width: 330.w,
                  height: 40.h,
                  child: AppTextFormField(
                    hintText: "Ahmed Ali",
                    hintStyle: TextStyles.font14BlackRegular,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsManager.Grey.withOpacity(.8),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  Email", style: TextStyles.font20BlackRegular),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 330.w,
                  height: 40.h,
                  child: AppTextFormField(
                    hintText: "omar@gmail.com",
                    hintStyle: TextStyles.font14BlackRegular,
                    prefixIcon: Icon(Icons.email_outlined),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsManager.Grey.withOpacity(.8),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "  Phone Number",
                      style: TextStyles.font20BlackRegular,
                    ),
                  ],
                ),
                verticalSpace(8),
                SizedBox(
                  width: 330.w,
                  height: 40.h,
                  child: AppTextFormField(
                    prefixIcon: Row(
                      children: [
                        horizontalSpace(24),
                        Text(
                          "+20 1012345678",
                          style: TextStyles.font14BlackRegular,
                        ),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ColorsManager.Grey.withOpacity(.8),
                        width: 1.3,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.3),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                verticalSpace(16),
                verticalSpace(1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("  Gender", style: TextStyles.font20BlackRegular),
                  ],
                ),
                verticalSpace(12),
                GenderSelectorPatient(),
                verticalSpace(130),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: AppTextButton(
                    buttonText: "Save Change",
                    borderRadius: 20,
                    verticalPadding: 4.h,
                    backgroundColor: ColorsManager.Blue,
                    textStyle: TextStyles.font22WhiteMedium,
                    onPressed: () {},
                  ),
                ),
                verticalSpace(5),
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text("Cancel", style: TextStyles.font22BlackMedium),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
