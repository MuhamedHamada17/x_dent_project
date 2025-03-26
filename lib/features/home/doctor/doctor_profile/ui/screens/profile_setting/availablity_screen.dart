import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/available_time.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_switch.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';

class AvailabilityScreen extends StatelessWidget {
  const AvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text("El Geish Street", style: TextStyles.font20BlackRegular),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Section(
                  textStyles: TextStyles.font22BlackMedium,
                  text:
                      "Choose when you are available for work for the next month.",
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          verticalSpace(8),
                          NameWithSwitch(text: "  Sunday"),
                          AvailableTime(),
                          verticalSpace(8),
                          NameWithSwitch(text: "  Monday"),
                          AvailableTime(),
                          verticalSpace(8),

                          NameWithSwitch(text: "  Tuesday"),
                          AvailableTime(),
                          verticalSpace(8),

                          NameWithSwitch(text: "  Wednesday"),
                          NameWithSwitch(text: "  Thursday"),
                          AvailableTime(),
                          verticalSpace(8),

                          NameWithSwitch(text: "  Friday"),

                          NameWithSwitch(text: "  Saturday"),
                        ],
                      ),
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
