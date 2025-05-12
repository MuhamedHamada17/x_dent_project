import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/specialization_doctors_cubit.dart';
import '../widgets/list_view _list_doctors.dart';

class DoctorListScreen extends StatelessWidget {
  final String specialization; // الإبقاء على specialization كـ parameter

  const DoctorListScreen({super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<SpecializationDoctorsCubit>()
        ..filterDoctors(specialization), // تشغيل filterDoctors مع specialization
      child: Scaffold(
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
                            child: const Icon(Icons.arrow_back, size: 35),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: Image.asset("assets/png/Bell.png"),
                          ),
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
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () =>
                                context.pushNamed(Routes.FilterPatientScreen),
                            child: Image.asset(
                              "assets/png/Filter2.png",
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const ListViewDoctors(),
            ],
          ),
        ),
      ),
    );
  }
}