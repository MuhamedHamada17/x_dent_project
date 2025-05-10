import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/cancelled_appointment_list.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/upcoming_appointment_list.dart';

import '../../logic/appointment_patient_state.dart';

class AppointmentBlocBuilder extends StatelessWidget {
  final String selectedStatus;

  const AppointmentBlocBuilder({
    super.key,
    required this.selectedStatus,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentPatientCubit, AppointmentPatientState>(
      builder: (context, state) {
        if (selectedStatus == 'upcoming') {
          return state.maybeWhen(
            upcomingLoading: () => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child:  Center(child: CircularProgressIndicator(
                color: ColorsManager.Blue,
              )),
            ),
            upcomingSuccess: (data) {
              return UpcomingAppointmentList(
                appointments: data.pendingAppointments ?? [],
              );
            },
            upcomingError: (error) => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child: Center(
                child: Text(
                  error.message ?? 'Failed to load upcoming appointments',
                  style: TextStyles.font16BlackRegular,
                ),
              ),
            ),
            orElse: () => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child: const Center(child: Text('Waiting for upcoming appointments...')),
            ),
          );
        } else if (selectedStatus == 'completed') {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 185.h,
            ),
            child: Center(
              child: Text(
                'No completed appointments yet',
                style: TextStyles.font20BlueRegular,
              ),
            ),
          );
        } else if (selectedStatus == 'cancelled') {
          return state.maybeWhen(
            cancelledLoading: () => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child: const Center(child: CircularProgressIndicator(
                color: ColorsManager.Blue,

              )),
            ),
            cancelledSuccess: (data) {
              return CancelledAppointmentList(
                appointments: data.cancelledAppointments ?? [],
              );
            },
            cancelledError: (error) => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child: Center(
                child: Text(
                  error.message ?? 'Failed to load cancelled appointments',
                  style: TextStyles.font16BlackRegular,
                ),
              ),
            ),
            orElse: () => ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - 185.h,
              ),
              child: const Center(child: Text('Waiting for cancelled appointments...')),
            ),
          );
        }
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - 185.h,
          ),
          child: const Center(child: Text('Invalid status')),
        );
      },
    );
  }
}