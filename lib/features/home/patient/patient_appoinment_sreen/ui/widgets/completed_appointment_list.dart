import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/completed_appointment_widget.dart';

class CompletedAppointmentList extends StatelessWidget {
  const CompletedAppointmentList({super.key});

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // عدد العناصر: 10
      itemBuilder: (context, index) {
        return CompletedAppointmentWidget(
          onAddReview: () => context.pushNamed(Routes.AddRatingDialogScreen),
          onReBook: () => _navigateToScreen(context, "ReBookScreen"),
        );
      },
    );
  }
}