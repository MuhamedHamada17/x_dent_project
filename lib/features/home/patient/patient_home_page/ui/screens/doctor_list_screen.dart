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
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/specialization_doctors_state.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/doctor_card_widget.dart';

class DoctorListScreen extends StatelessWidget {
  final String specialization;

  const DoctorListScreen({super.key, required this.specialization});

  @override
  Widget build(BuildContext context) {
    if (specialization.isEmpty) {
      debugPrint('DoctorListScreen: خطأ - التخصص فارغ');
      return Scaffold(
        body: Center(
          child: Text(
            'خطأ: لم يتم تحديد التخصص',
            style: TextStyles.font16BlueRegular,
          ),
        ),
      );
    }
    return BlocProvider(
      create: (context) => GetIt.instance<SpecializationDoctorsCubit>()
        ..filterDoctors(specialization),
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
                            onTap: () => context.pushNamed(Routes.FilterPatientScreen),
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
              BlocBuilder<SpecializationDoctorsCubit, SpecializationDoctorsState>(
                builder: (context, state) {
                  if (state is SpecializationDoctorsLoading) {
                    debugPrint('DoctorListScreen: جاري تحميل الدكاترة للتخصص: $specialization');
                    return const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.Blue,
                      ),
                    );
                  } else if (state is SpecializationDoctorsSuccess) {
                    if (state.data.data.isEmpty) {
                      debugPrint('DoctorListScreen: لم يتم العثور على دكاترة للتخصص: $specialization');
                      return Center(
                        child: Text(
                          'لا يوجد دكاترة لتخصص $specialization',
                          style: TextStyles.font16BlueRegular,
                        ),
                      );
                    }
                    debugPrint('DoctorListScreen: تم تحميل ${state.data.data.length} دكاترة للتخصص: $specialization');
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.data.data.length,
                        itemBuilder: (context, index) {
                          final doctor = state.data.data[index];
                          debugPrint('DoctorListScreen: دكتور في الفهرس $index: المعرف=${doctor.id}, الاسم=${doctor.name}');
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              debugPrint('DoctorListScreen: تم النقر على GestureDetector للدكتور: المعرف=${doctor.id}, الاسم=${doctor.name}');
                              if (specialization.isEmpty) {
                                debugPrint('DoctorListScreen: خطأ - التخصص فارغ');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('خطأ: لم يتم تحديد التخصص')),
                                );
                                return;
                              }
                              if (doctor.id == 0 || doctor.id == null) {
                                debugPrint('DoctorListScreen: خطأ - معرف الدكتور غير صالح: ${doctor.id}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('خطأ: معرف الدكتور غير صالح')),
                                );
                                return;
                              }
                              debugPrint('DoctorListScreen: الانتقال إلى DoctorDetailsScreen مع التخصص: $specialization, معرف الدكتور: ${doctor.id}');
                              context.pushNamed(
                                Routes.doctorDetailsScreen,
                                arguments: {
                                  'specialization': specialization,
                                  'doctorId': doctor.id,
                                },
                              );
                            },
                            child: DoctorCardWidget(
                              doctorName: doctor.name,
                              specialty: doctor.specialization.join(", "),
                              imagePath: null,
                              rating: doctor.average_rating.toDouble(),
                              price: doctor.price?.toString() ?? "N/A",
                              doctorId: doctor.id, // تمرير doctorId
                              specialization: specialization, // تمرير specialization
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is SpecializationDoctorsError) {
                    debugPrint('DoctorListScreen: حالة خطأ: ${state.message}');
                    return Center(child: Text(state.message));
                  } else {
                    debugPrint('DoctorListScreen: حالة غير معروفة');
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}