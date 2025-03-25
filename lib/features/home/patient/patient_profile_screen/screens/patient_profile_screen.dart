import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/widgets/profile_option_patient.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: TextStyles.font20BlackRegular),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(20),
            Center(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: ColorsManager.Black),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: ColorsManager.OfWhite,
                      child: Text("AZ", style: TextStyles.font20BlackRegular),
                    ),
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: ColorsManager.Blue,
                    child: IconButton(
                      icon: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 16,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(18),
            Text("Dr Ahmed Ali", style: TextStyles.font22BlackMedium),
            const SizedBox(height: 5),
            Text("+20 1012345678", style: TextStyles.font12GreyRegular),
            const SizedBox(height: 20),
            ProfileOptionPatient(
              title: "Edit Profile",
              imagePath: "assets/png/User_02.png",
              onTap: () {
                context.pushNamed(Routes.EditProfilePatientScreen);
              },
            ),
            ProfileOptionPatient(
              title: "Change Password",
              imagePath: "assets/png/Lock.png",
              onTap: () {
                context.pushNamed(Routes.ChangePasswordPatientScreen);
              },
            ),
            ProfileOptionPatient(
              title: "Data and Treatment Plans",
              imagePath: "assets/png/heart_patient.png",
              onTap: () {
                context.pushNamed(Routes.DataAndTreatmentPlansScreen);
              },
            ),
            ProfileOptionPatient(
              title: "Settings",
              imagePath: "assets/png/settings.png",
              onTap: () {
                context.pushNamed(Routes.ProfileSettings);
              },
            ),
            ProfileOptionPatient(
              title: "Language",
              imagePath: "assets/png/settings.png",
              onTap: () {
                context.pushNamed(Routes.LanguageScreen);
              },
            ),
            ProfileOptionPatient(
              title: "Help Center",
              imagePath: "assets/png/Circle_Help.png",
              onTap: () {
                context.pushNamed(Routes.HelpCenterScreen);
              },
            ),
            ProfileOptionPatient(
              title: "Log Out",
              icon: Icons.logout,
              onTap: () {
                // context.pushNamed(Routes.LogOuPatientScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
