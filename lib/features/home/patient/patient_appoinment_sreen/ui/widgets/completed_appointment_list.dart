import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/completed_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/completed_appointment_widget.dart';

class CompletedAppointmentList extends StatelessWidget {
  final List<CompletedAppointment> appointments;

  const CompletedAppointmentList({
    super.key,
    this.appointments = const [],
  });

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    print('Completed Appointments: $appointments');
    if (appointments.isEmpty) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 185.h,
        ),
        child: const Center(child: Text('No completed appointments yet')),
      );
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: appointments.length,
      itemBuilder: (context, index) {
        final appointment = appointments[index];
        return CompletedAppointmentWidget(
          key: ValueKey(appointment.id),
          appointment: appointment,
          onAddReview: () => context.pushNamed(Routes.AddRatingDialogScreen),
          onReBook: () => _navigateToScreen(context, "ReBookScreen"),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}