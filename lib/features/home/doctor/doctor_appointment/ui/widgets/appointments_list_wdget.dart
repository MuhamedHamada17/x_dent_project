import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_appointments_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_appointments_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/screens/appointment_detailes_screens/doctor_appointment_detail_screen.dart';

class AppointmentsListWidget extends StatelessWidget {
  const AppointmentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsAppointmentsCubit, DoctorsAppointmentsState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(child: Text('جاري التحضير...')),
          loading: () => const Center(
              child: CircularProgressIndicator(
            color: ColorsManager.Blue,
          )),
          error: (message) => Center(child: Text('خطأ: $message')),
          loaded: (data) => ListView.builder(
            itemCount: data.appointments.length,
            itemBuilder: (context, index) {
              final appointment = data.appointments[index];
              final displayDate =
                  index == 0 ? appointment.appointmentDate : null;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (displayDate != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Container(
                        width: double.infinity,
                        color: ColorsManager.lighterBLUE,
                        child: Text(
                          textAlign: TextAlign.center,
                          appointment.appointmentDate,
                          style: TextStyles.font12BlackRegular,
                        ),
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.grey.shade300)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          appointment.patient.name,
                          style: TextStyles.font14BlackRegular,
                        ),
                        Row(
                          children: [
                            Text(
                              appointment.appointmentTime,
                              style: TextStyles.font14BlackRegular,
                            ),
                            horizontalSpace(10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: ColorsManager.Blue),
                              ),
                              child: Text(
                                appointment.status == 'pending'
                                    ? "Upcoming"
                                    : appointment.status == 'cancelled'
                                        ? "cancelled"
                                        : "Completed",
                                style: TextStyles.font16BlackRegular,
                              ),
                            ),
                            horizontalSpace(10),
                            GestureDetector(
                              onTap: () {
                                debugPrint(
                                    'Navigating to AppointmentDetailsScreen with ID: ${appointment.id}');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AppointmentDetailsScreen(
                                        appointmentId: appointment.id,
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Icon(
                                Icons.arrow_forward,
                                size: 26,
                                color: ColorsManager.Blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
