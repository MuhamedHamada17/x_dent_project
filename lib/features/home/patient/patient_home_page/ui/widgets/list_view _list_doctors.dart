import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/specialization_doctors_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/doctor_card_widget.dart';

import '../../logic/specialization_doctors_state.dart';

class ListViewDoctors extends StatelessWidget {
  const ListViewDoctors({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecializationDoctorsCubit, SpecializationDoctorsState>(
      builder: (context, state) {
        if (state is SpecializationDoctorsLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.Blue,
            ),
          );
        } else if (state is SpecializationDoctorsSuccess) {
          if (state.data.data.isEmpty) {
            return  Center(
              child: Text(
                'No doctors found for this specialization',
                style: TextStyles.font16BlueRegular,
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.data.data.length,
              itemBuilder: (context, index) {
                final doctor = state.data.data[index];
                return GestureDetector(
                  onTap: () => context.pushNamed(
                    Routes.chatScreenPatient,
                    arguments: doctor.id,
                  ),
                  child: DoctorCardWidget(
                    doctorName: doctor.name,
                    specialty: doctor.specialization.join(", "),
                    imagePath: null,
                    rating: doctor.average_rating.toDouble(),
                    reviewsCount: doctor.reviews_count,
                    price: doctor.price?.toString(),
                  ),
                );
              },
            ),
          );
        } else if (state is SpecializationDoctorsError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}