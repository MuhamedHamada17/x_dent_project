import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_reservation_appointments_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/logic/doctors_reservation_appointments_state.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/map_placeholder.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';

class ReservationPage extends StatelessWidget {
  final int? appointmentId;

  const ReservationPage({super.key, this.appointmentId});

  @override
  Widget build(BuildContext context) {
    debugPrint('ReservationPage: appointmentId = $appointmentId');
    if (appointmentId == null || appointmentId! <= 0) {
      return const Center(
          child: Text('معرف الموعد غير صالح، برجاء اختيار موعد صالح'));
    }

    // Save appointmentId to SharedPrefHelper
    SharedPrefHelper.saveAppointmentId(appointmentId!);

    return BlocProvider(
      create: (context) {
        final cubit = GetIt.instance<DoctorReservationCubit>();
        debugPrint(
            'ReservationPage: Fetching appointment with ID: $appointmentId');
        cubit.fetchDoctorReservationAppointment(appointmentId!);
        return cubit;
      },
      child: BlocBuilder<DoctorReservationCubit, DoctorReservationState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('جاري التحضير...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (message) => Center(child: Text('خطأ: $message')),
            success: (data) {
              if (data.appointment == null) {
                return const Center(child: Text('لا توجد بيانات للموعد'));
              }
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        "${_formatDate(data.appointment.appointmentDate)} - ${_formatTime(data.appointment.appointmentTime)}",
                        style: TextStyles.font22BlackMedium,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 24),
                        const SizedBox(width: 4),
                        Text(
                          "Gehan Street, Mansoura", // يمكن استبداله بداتا من الـ API لو متوفرة
                          style: TextStyles.font12GreyRegular,
                        ),
                      ],
                    ),
                    verticalSpace(6),
                    Row(
                      children: [
                        const Icon(Icons.book, size: 24),
                        const SizedBox(width: 4),
                        Text("Booking ID:",
                            style: TextStyles.font12GreyRegular),
                        Text(
                          "#${data.appointment.id.toString().padLeft(8, '0')}",
                          style: const TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    verticalSpace(16),
                    const MapPlaceholder(),
                    verticalSpace(16),
                    const Divider(color: ColorsManager.Black),
                    verticalSpace(12),
                    Text("Treatment Information",
                        style: TextStyles.font14GreyRegular),
                    verticalSpace(12),
                    DetailRow(
                        label: "Patient", value: data.appointment.patient.name),
                    DetailRow(
                        label: "Treatment Type",
                        value: data.appointment.treatmentPlan.name),
                    DetailRow(
                        label: "Estimate Duration",
                        value: data.appointment.estimateDuration),
                    const Divider(color: ColorsManager.Black),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(String date) {
    // تنسيق التاريخ من "2025-04-11" إلى "Apr 11, 2025"
    final parts = date.split('-');
    if (parts.length != 3) return date;
    const months = [
      '',
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Octopus',
      'Nov',
      'Dec'
    ];
    return "${months[int.parse(parts[1])]} ${int.parse(parts[2])}, ${parts[0]}";
  }

  String _formatTime(String time) {
    // تنسيق الوقت من "11:30:00" إلى "11:30 AM"
    final parts = time.split(':');
    if (parts.length < 2) return time;
    int hour = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    hour = hour % 12 == 0 ? 12 : hour % 12;
    return "$hour:$minute $period";
  }
}
