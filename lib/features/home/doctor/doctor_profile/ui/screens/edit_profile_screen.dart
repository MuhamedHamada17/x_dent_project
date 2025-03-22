import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/core/widgets/app_text_form_field.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/gender_selection.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  Text("  Phone Number", style: TextStyles.font20BlackRegular),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  About", style: TextStyles.font20BlackRegular),
                ],
              ),
              verticalSpace(8),
              SizedBox(
                width: 330.w,
                height: 80.h,
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 24,
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
              ),
              verticalSpace(1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("  Gender", style: TextStyles.font20BlackRegular),
                ],
              ),
              verticalSpace(12),
              GenderSelector(),
              verticalSpace(60),
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
              verticalSpace(8),
              TextButton(
                onPressed: () {
                  // Action for cancel
                },
                child: Text("Cancel", style: TextStyles.font22BlackMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
