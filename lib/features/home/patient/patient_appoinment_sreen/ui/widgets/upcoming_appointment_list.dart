import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/upcoming_appointment_widget.dart';

class UpcomingAppointmentList extends StatelessWidget {
  const UpcomingAppointmentList({super.key});

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // عدد العناصر: 10
      itemBuilder: (context, index) {
        return UpcomingAppointmentWidget(
          onCancel: () => _navigateToScreen(context, "CancelScreen"),
          onReschedule: () => context.pushNamed(Routes.appointmentDetailsPatientScreen),
          onRemindMeChanged: (value) {
            print("Remind me changed to: $value");
          },
        );
      },
    );
  }
}