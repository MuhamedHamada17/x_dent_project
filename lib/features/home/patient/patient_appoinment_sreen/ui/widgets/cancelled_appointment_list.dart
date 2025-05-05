import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/cancelled_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/cancelled_appointment_widget.dart';

class CancelledAppointmentList extends StatelessWidget {
  final List<CancelledAppointment> appointments;

  const CancelledAppointmentList({
    super.key,
    this.appointments = const [],
  });

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    print('Cancelled Appointments: $appointments');
    if (appointments.isEmpty) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 185.h,
        ),
        child: const Center(child: Text('No cancelled appointments')),
      );
    }

    return ListView.separated(
      shrinkWrap: true, // لتجنب مشاكل الـ layout
      physics: const NeverScrollableScrollPhysics(), // لأن SingleChildScrollView هو اللي بيتحكم في الـ scrolling
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return CancelledAppointmentWidget(
          key: ValueKey(appointment.id),
          appointment: appointment,
          onReBook: () => _navigateToScreen(context, "ReBookScreen"),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}