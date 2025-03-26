import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_arrow.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart';

class AvailabilityLocationScreen extends StatelessWidget {
  const AvailabilityLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text("Availablity", style: TextStyles.font20BlackRegular),
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
                  text: " Choose Location",
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          verticalSpace(16),
                          NameWithArrow(
                            text: "El Geish Street",
                            onTap: () {
                              context.pushNamed(Routes.AvailabilityScreen);
                            },
                          ),
                          verticalSpace(8),
                          NameWithArrow(text: "Hay ElGamaa"),
                          verticalSpace(8),
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
