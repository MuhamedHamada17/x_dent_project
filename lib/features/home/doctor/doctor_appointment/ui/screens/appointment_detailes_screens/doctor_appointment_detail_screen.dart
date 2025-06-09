import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/screens/appointment_detailes_screens/reservation_page.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AppointmentDetailsScreen(),
    );
  }
}

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
        'AppointmentDetailsScreen: appointmentId = ${widget.appointmentId}');
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
                  const PaymentPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget لزر التبديل
  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
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

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Center(child: Text("500 L.E", style: TextStyles.font34BlackBoldOpen)),
          const SizedBox(height: 16),
          const SizedBox(height: 8),
          const DetailRow(label: "Recipient", value: "Dr. Ahmed Mahmoud"),
          const DetailRow(label: "Date", value: "16/2/2025"),
          const DetailRow(label: "Reference", value: "2000398466283"),
          const DetailRow(label: "Payment Method", value: "Mastercard"),
        ],
      ),
    );
  }
}
