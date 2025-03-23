import 'package:flutter/material.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';

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
