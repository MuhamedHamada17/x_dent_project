import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/info_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/nav_row.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ahmed Khaled", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Section(
                  textStyles: TextStyles.font22BlackMedium,
                  text: "Info",
                  children: [
                    InfoRow(label: "Phone", value: "+20 1012345678"),
                    InfoRow(label: "Name", value: "Ahmed Khaled"),
                    InfoRow(label: "Email", value: "ahmedkhaled@gmail.com"),
                    InfoRow(label: "Age", value: "24 Years"),
                    InfoRow(label: "Gender", value: "Male"),
                    InfoRow(label: "First Appt", value: "15/02/2024"),
                    verticalSpace(10),
                  ],
                ),
                Section(
                  textStyles: TextStyles.font22BlackMedium,
                  text: "Data",
                  children: [
                    verticalSpace(10),
                    NavRow(
                      text: "Xrays",
                      icon: Icons.folder,
                      onTap: () {
                        context.pushNamed(Routes.XraysScreen);
                      },
                    ),
                    verticalSpace(10),
                    NavRow(
                      text: "Medical Records",
                      icon: Icons.description,
                      onTap: () {
                        context.pushNamed(Routes.MidicalRecordsScreen);
                      },
                    ),
                    verticalSpace(16),
                  ],
                ),
                Section(
                  textStyles: TextStyles.font22BlackMedium,
                  text: "Treatment Plans",
                  children: [
                    verticalSpace(16),
                    NavRow(
                      text: "Treatments Plans",
                      icon: Icons.monitor_heart,
                      onTap: () {
                        context.pushNamed(Routes.TreatmentPlanScreen);
                      },
                    ),
                    verticalSpace(10),
                    NavRow(
                      text: "Prescriptions",
                      icon: Icons.medical_services,
                      onTap: () {
                        context.pushNamed(Routes.PrescriptionScreen);
                      },
                    ),
                    verticalSpace(10),
                    NavRow(
                      text: "Upcoming Appointments",
                      icon: Icons.event,
                      onTap: () {
                        context.pushNamed(Routes.UpcomingAppointmentsScreen);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
