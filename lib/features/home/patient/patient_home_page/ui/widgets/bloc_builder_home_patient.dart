import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/widgets/home_screen_card.dart';

import '../../../patient_appoinment_sreen/logic/appointment_patient_state.dart';

class BlocBuilderHomePatient extends StatelessWidget {
  const BlocBuilderHomePatient({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentPatientCubit, AppointmentPatientState>(
      builder: (context, state) {
        print("BlocBuilderHomePatient state: $state");
        return state.maybeWhen(
          upcomingLoading: () => ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 180.h,
            ),
            child: const Center(child: CircularProgressIndicator()),
          ),
          upcomingSuccess: (data) {
            print("Upcoming appointments: ${data.pendingAppointments}");
            if (data.pendingAppointments == null || data.pendingAppointments!.isEmpty) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: 180.h,
                ),
                child:  Center(
                  child: Text(
                    'No upcoming appointments',
                    style: TextStyles.font16BlueRegular,
                  ),
                ),
              );
            }
            // نعرض أول موعد بس
            final firstAppointment = data.pendingAppointments!.first;
            return HomeScreenCard(appointment: firstAppointment);
          },
          upcomingError: (error) => ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 180.h,
            ),
            child: Center(
              child: Text(
                error.message ?? 'Failed to load upcoming appointment',
                style: TextStyles.font16BlackRegular,
              ),
            ),
          ),
          orElse: () => ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: 180.h,
            ),
            child:  Center(
              child: Text(
                'Waiting for upcoming appointments...',
                style: TextStyles.font16BlueRegular,
              ),
            ),
          ),
        );
      },
    );
  }
}