import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/container_row_details.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/widgets/payment-details.dart';

import '../widgets/reservation_details.dart';

class AppointmentDetailsPatientScreen extends StatelessWidget {
  const AppointmentDetailsPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          verticalSpace(50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "assets/png/Icon_arrow_back.png",
                    width: 32.w,
                    height: 32.h,
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Details",
                      style: TextStyles.font28BlackMedium,
                    ),
                  ),
                ),
                horizontalSpace(32.w)
              ],
            ),
          ),
          verticalSpace(20),
          ContainerRowDetails(),
          PaymentDetails()
        ],
      ),
    );
  }
}
