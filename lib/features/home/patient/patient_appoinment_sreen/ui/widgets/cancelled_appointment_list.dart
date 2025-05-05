import 'package:flutter/material.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/cancelled_appointment_widget.dart';

class CancelledAppointmentList extends StatelessWidget {
  const CancelledAppointmentList({super.key});

  void _navigateToScreen(BuildContext context, String screenName) {
    Navigator.pushNamed(context, '/$screenName');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // عدد العناصر: 10
      itemBuilder: (context, index) {
        return CancelledAppointmentWidget(
          onReBook: () => _navigateToScreen(context, "ReBookScreen"),
        );
      },
    );
  }
}