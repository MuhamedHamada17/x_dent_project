import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/widgets/profile_option_patient.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theiming/styles.dart';

class DataAndTreatmentPlansScreen extends StatelessWidget {
  const DataAndTreatmentPlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 26,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  horizontalSpace(10),
                  Text("Data and Treatment Plans", style: TextStyles.font20BlackRegular),
                ],
              ),
            ),
            verticalSpace(20),
            Container(
              height: 47.h,
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("   Data",style: TextStyles.font22BlackMedium,),
                ],
              ),
            ),
            verticalSpace(15),
            ProfileOptionPatient(title:"Xrays" ,
                imagePath: "assets/png/folder.png",
                onTap: (){}),
            verticalSpace(10),
            ProfileOptionPatient(title:"Medical Records" ,
                imagePath: "assets/png/File text.png",
                onTap: (){}),
            verticalSpace(15),
            Container(
              height: 47.h,
              width: double.infinity,
              color: ColorsManager.lighterBLUE,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("   Treatment Plans",style: TextStyles.font22BlackMedium,),
                ],
              ),
            ),
            verticalSpace(15),

            ProfileOptionPatient(title:"Treatments Plans" ,
                imagePath: "assets/png/heart_patient.png",
                onTap: (){}),
            verticalSpace(10),

            ProfileOptionPatient(title:"Perscriptions" ,
                imagePath: "assets/png/Perscriptions.png",
                onTap: (){}),

          ],
        ),
      ),
    );
  }
}
