import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/map_placeholder.dart';

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
  const AppointmentDetailsScreen({super.key});

  @override
  State<AppointmentDetailsScreen> createState() =>
      _AppointmentDetailsScreenState();
}

class _AppointmentDetailsScreenState extends State<AppointmentDetailsScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                children: const [ReservationPage(), PaymentPage()],
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

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              "Feb 17, 2025 - 10:00 AM",
              style: TextStyles.font22BlackMedium,
            ),
          ),
          const SizedBox(height: 8),

          Row(
            children: [
              Icon(Icons.location_on, size: 24),
              const SizedBox(width: 4),
              Text(
                "Gehan Street, Mansoura",
                style: TextStyles.font12GreyRegular,
              ),
            ],
          ),
          verticalSpace(6),

          Row(
            children: [
              Icon(Icons.book, size: 24),
              const SizedBox(width: 4),
              Text("Booking ID:", style: TextStyles.font12GreyRegular),
              Text("#573DK98M", style: TextStyle(color: ColorsManager.Blue)),
            ],
          ),

          verticalSpace(16),
          const MapPlaceholder(),
          verticalSpace(16),
          const Divider(color: ColorsManager.Black),
          verticalSpace(12),
          Text("Treatment Information", style: TextStyles.font14GreyRegular),
          verticalSpace(12),
          const DetailRow(label: "Patient", value: "Ahmed Khaled"),
          const DetailRow(label: "Treatment Type", value: "Check Up"),
          const DetailRow(label: "Estimate Duration", value: "1 Hour"),
          const Divider(color: ColorsManager.Black),
        ],
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
