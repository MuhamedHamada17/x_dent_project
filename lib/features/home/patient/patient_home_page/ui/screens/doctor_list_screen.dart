import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/doctor_card_widget.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/list_view%20_list_doctors.dart';

import '../../../../../../core/theiming/styles.dart';

class DoctorListScreen extends StatelessWidget {
  const DoctorListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: ColorsManager.lighterBLUE,
              width: double.infinity,
              height: 200.h,
              child: Column(
                children: [
                  verticalSpace(50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        verticalSpace(82),
                        GestureDetector(
                          onTap: context.pop,
                            child: Icon(Icons.arrow_back,size: 35,)),
                        Spacer(),
                        GestureDetector(
                            child: Image.asset("assets/png/Bell.png"))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 301.w,
                          height: 41.h,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: " Search",
                              hintStyle: TextStyles.font14GreyRegular,
                              suffixIcon: const Icon(
                                Icons.search,
                                color: Colors.black,
                              ), // ✅ أيقونة البحث باللون الأسود
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white, // ✅ حدود بيضاء لحقل البحث
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(32),
                              ),
                              filled: true,
                              fillColor: Colors.white, // ✅ خلفية بيضاء لحقل البحث
                            ),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: ()=>context.pushNamed(Routes.FilterPatientScreen),
                            child: Image.asset("assets/png/Filter2.png",width: 24.w,height: 24.h,)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
           ListViewDoctors(),
          ],
        ),
      ),
    );
  }
}
