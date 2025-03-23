import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/detail_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_appointment/ui/widgets/map_placeholder.dart';

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
