import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/widgets/appointmentCard.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/half_specialties_grid.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theiming/styles.dart';

class PatientHomePage extends StatelessWidget {
  const PatientHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: ColorsManager.lighterBLUE,
                width: double.infinity,
                height: 230.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpace(25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "  Welcome,\n  Dr Mohamed Ali",
                          style: TextStyles.font28BlackMedium,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: IconButton(
                            onPressed: () {
                              context.pushNamed(Routes.notification);
                            },
                            icon: Icon(
                              Icons.notifications_none_outlined,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),

                    verticalSpace(30), // ✅ تحريك حقل البحث للأسفل قليلاً
                    // ✅ مربع البحث
                    SizedBox(
                      height: 42.h,
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
                  ],
                ),
              ),

              verticalSpace(8),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Text(
                      "Upcoming Appointments",
                      style: TextStyles.font14BlackRegular,
                    ),
                    Spacer(),
                    Text("See all", style: TextStyles.font12BlueRegular),
                  ],
                ),
              ),

              verticalSpace(10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: AppointmentCard(),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  children: [
                    Text(
                      "Dentist Specialty",
                      style: TextStyles.font14BlackRegular,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        context.pushNamed(Routes.specialtyScreen);
                      },
                      child: Text("See all", style: TextStyles.font12BlueRegular),
                    ),
                  ],
                ),
              ),
              verticalSpace(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: HalfSpecialtiesGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
