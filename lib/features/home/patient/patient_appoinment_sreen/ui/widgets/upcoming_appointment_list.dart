import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/upcoming_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/upcoming_appointment_widget.dart';

class UpcomingAppointmentList extends StatelessWidget {
  final List<PendingAppointment> appointments;

  const UpcomingAppointmentList({
    super.key,
    this.appointments = const [],
  });

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    print('Upcoming Appointments: $appointments');
    if (appointments.isEmpty) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 185.h,
        ),
        child: const Center(child: Text('No upcoming appointments')),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return UpcomingAppointmentWidget(
          key: ValueKey(appointment.id),
          appointment: appointment,
          onCancel: () => _navigateToScreen(context, "CancelScreen"),
          onReschedule: () => context.pushNamed(Routes.appointmentDetailsPatientScreen),
          onRemindMeChanged: (value) {
            print("Remind me changed to: $value for appointment ${appointment.id}");
          },
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}