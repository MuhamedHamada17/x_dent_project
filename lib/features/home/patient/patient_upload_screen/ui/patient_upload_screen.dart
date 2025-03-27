import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/widgets/app_text_button.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/app_bar_patient_upload.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/browse_card_widget.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/widgets/upload_file_widget.dart';

class PatientUploadScreen extends StatelessWidget {
  const PatientUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppBarPatientUpload(),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UploadFileWidget(),
            ],
          ),
          verticalSpace(10),
          Text("or", style: TextStyles.font20BlackRegular),
          BrowseCardWidget(),
          verticalSpace(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Image.asset(
                  "assets/png/Avatar Icon.png",
                  width: 38.w,
                  height: 38.h,
                ),
                SizedBox(width: 10.w),
                Text("xray_image.jpg", style: TextStyles.font16BlackRegular),
                 Spacer(),
                Image.asset("assets/png/pause.png",width: 16.w,height: 16.h,),
                horizontalSpace(8),
                Image.asset("assets/png/trash-2.png",width: 16.w,height: 16.h,)

              ],
            ),
          ),
          verticalSpace(30),
          SizedBox(
            width: 340.w,  // ✅ العرض 340
            height: 10.h,  // ✅ الارتفاع 10
            child: LinearProgressIndicator(
              value: 0.75,
              backgroundColor: Colors.grey.shade300,
              color: Colors.orange,
              borderRadius: BorderRadius.circular(5), // ✅ إضافة زوايا دائرية اختيارية
            ),
          ),

          verticalSpace(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ensure spacing is correct
            children: [
              SizedBox(
                width: 160.w,
                height: 44.h,
                child: AppTextButton(
                  buttonText: "Cancel",
                  borderRadius: 20,
                  verticalPadding: 4.h,
                  backgroundColor: ColorsManager.lighterBLUE,
                  textStyle: TextStyles.font20BlueRegular,
                  onPressed: () {},
                ),
              ),
              SizedBox(
                width: 160.w,
                height: 44.h,
                child: AppTextButton(
                  buttonText: "Upload",
                  borderRadius: 20,
                  verticalPadding: 4.h,
                  backgroundColor: ColorsManager.Blue,
                  textStyle: TextStyles.font20whiteRegular,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
