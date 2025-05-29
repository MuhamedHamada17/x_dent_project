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

class DoctorListScreen extends StatefulWidget {
  final String specialization;

  const DoctorListScreen({super.key, required this.specialization});

  @override
  State<DoctorListScreen> createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  String currentSpecialization = '';
  int? currentReviewRating;
  int? currentMinPrice;
  int? currentMaxPrice;

  @override
  void initState() {
    super.initState();
    currentSpecialization = widget.specialization;
  }

  @override
  Widget build(BuildContext context) {
    if (currentSpecialization.isEmpty) {
      debugPrint('DoctorListScreen: Error - Specialization is empty');
      return Scaffold(
        body: Center(
          child: Text(
            'Error: Specialization was not specified',
            style: TextStyles.font16BlueRegular,
          ),
        ),
      );
    }

    return BlocProvider(
      create: (context) => GetIt.instance<SpecializationDoctorsCubit>()
        ..filterDoctors(
          specialization: currentSpecialization,
          reviewRating: currentReviewRating,
          minPrice: currentMinPrice,
          maxPrice: currentMaxPrice,
        ),
      child: Builder(
        builder: (blocContext) {
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
                                onTap: () => context.pop(),
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
                                onTap: () async {
                                  final filterResult = await context.pushNamed(Routes.FilterPatientScreen);
                                  if (filterResult is Map<String, dynamic>) {
                                    setState(() {
                                      currentSpecialization = filterResult['specialization'] ?? widget.specialization;
                                      currentReviewRating = filterResult['reviewRating'] as int?;
                                      currentMinPrice = filterResult['minPrice'] as int?;
                                      currentMaxPrice = filterResult['maxPrice'] as int?;
                                    });
                                    debugPrint(
                                      'DoctorListScreen: Applying filters: '
                                          'specialization=$currentSpecialization, '
                                          'reviewRating=$currentReviewRating, '
                                          'minPrice=$currentMinPrice, '
                                          'maxPrice=$currentMaxPrice',
                                    );
                                    blocContext.read<SpecializationDoctorsCubit>().filterDoctors(
                                      specialization: currentSpecialization,
                                      reviewRating: currentReviewRating,
                                      minPrice: currentMinPrice,
                                      maxPrice: currentMaxPrice,
                                    );
                                  }
                                },
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
                  BlocConsumer<SpecializationDoctorsCubit, SpecializationDoctorsState>(
                    listener: (context, state) {
                      if (state is SpecializationDoctorsError) {
                        debugPrint('DoctorListScreen: Error loading Drs: ${state.message}');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('error: ${state.message}')),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is SpecializationDoctorsLoading) {
                        debugPrint('DoctorListScreen: Loading doctors for specialization: $currentSpecialization');
                        return SizedBox(
                          height: MediaQuery.of(context).size.height - 200.h,
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.Blue,
                            ),
                          ),
                        );
                      } else if (state is SpecializationDoctorsSuccess) {
                        if (state.data.data.isEmpty) {
                          debugPrint('DoctorListScreen: No doctors were found for the specialty: $currentSpecialization');
                          return Center(
                            child: Text(
                              'There are no doctors for this specialty $currentSpecialization',
                              style: TextStyles.font16BlueRegular,
                            ),
                          );
                        }
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.h),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.data.data.length,
                            itemBuilder: (context, index) {
                              final doctor = state.data.data[index];
                              debugPrint(
                                  'DoctorListScreen: Doctor in the index $index: Id=${doctor.id}, name=${doctor.name}');
                              return GestureDetector(
                                behavior: HitTestBehavior.opaque,
                                onTap: () {
                                  debugPrint(
                                      'DoctorListScreen: GestureDetector clicked for Doctor: ID=${doctor.id}, name=${doctor.name}');
                                  if (currentSpecialization.isEmpty) {
                                    debugPrint('DoctorListScreen: خطأ - التخصص فارغ');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Error: Specialization was not specified')),
                                    );
                                    return;
                                  }
                                  if (doctor.id == 0 || doctor.id == null) {
                                    debugPrint('DoctorListScreen: Error - Invalid Doctor ID: ${doctor.id}');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Error: The doctor ID is invalid')),
                                    );
                                    return;
                                  }
                                  debugPrint(
                                      'DoctorListScreen: Move to DoctorDetailsScreen with specialization: $currentSpecialization, معرف الدكتور: ${doctor.id}');
                                  context.pushNamed(
                                    Routes.doctorDetailsScreen,
                                    arguments: {
                                      'specialization': currentSpecialization,
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
                                  doctorId: doctor.id,
                                  specialization: currentSpecialization,
                                ),
                              );
                            },
                          ),
                        );
                      } else if (state is SpecializationDoctorsError) {
                        debugPrint('DoctorListScreen: Error condition: ${state.message}');
                        return Center(child: Text(state.message));
                      } else {
                        debugPrint('DoctorListScreen: Unknown condition');
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}