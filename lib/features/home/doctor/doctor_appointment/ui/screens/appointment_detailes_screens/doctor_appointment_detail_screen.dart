import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/screens/appointment_detailes_screens/payment_page.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/screens/appointment_detailes_screens/reservation_page.dart';

class AppointmentDetailsScreen extends StatefulWidget {
  final int? appointmentId;

  const AppointmentDetailsScreen({super.key, this.appointmentId});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    debugPrint(
        'AppointmentDetailsScreen: Building with appointmentId = ${widget.appointmentId}');
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            verticalSpace(32),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 36,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Text("Details", style: TextStyles.font28BlackSemiBoldOpen),
                  horizontalSpace(50),
                ],
              ),
            ),
            verticalSpace(16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Color(0xffF4F8FC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(child: _buildTabButton("Reservation", 0)),
                  Expanded(child: _buildTabButton("Payment", 1)),
                ],
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: _currentIndex,
                children: [
                  ReservationPage(appointmentId: widget.appointmentId),
                  PaymentPage(
                      key: ValueKey(widget.appointmentId),
                      appointmentId: widget.appointmentId),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        debugPrint('AppointmentDetailsScreen: Switching to tab index = $index');
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color:
              _currentIndex == index ? ColorsManager.Blue : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color:
                  _currentIndex == index ? Colors.white : ColorsManager.Black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
