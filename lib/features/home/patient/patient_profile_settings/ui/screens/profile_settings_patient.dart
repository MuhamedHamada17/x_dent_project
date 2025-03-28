import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/deactivate_account.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/delete_account.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_arrow.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/name_with_switch.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/section.dart'
    show Section;
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/deactivate_account_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/widgets/delete_account_patient.dart';

class ProfileSettingsPatient extends StatefulWidget {
  const ProfileSettingsPatient({super.key});

  @override
  State<ProfileSettingsPatient> createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettingsPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,

        title: Text("Settings", style: TextStyles.font20BlackRegular),
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
                  text: " Notification",
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        children: [
                          verticalSpace(16),
                          NameWithSwitch(text: "General"),
                          verticalSpace(8),
                          NameWithSwitch(text: "Reminders"),
                          verticalSpace(8),
                          NameWithSwitch(text: "Calls"),
                          verticalSpace(8),

                          NameWithSwitch(text: "Promotions"),
                          verticalSpace(16),
                        ],
                      ),
                    ),
                  ],
                ),
                Section(
                  textStyles: TextStyles.font22BlackMedium,
                  text: " Account",
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          verticalSpace(10),
                          NameWithArrow(
                            text: "Deactivate",
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeactivateAccountPatient();
                                },
                              );
                            },
                          ),
                          verticalSpace(10),
                          NameWithArrow(
                            text: "Delete",

                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return DeleteAccountPatient();
                                },
                              );
                            },
                          ),
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
