import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/language_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/log_out_doctor_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/widgets/profile_option.dart';

class DoctorProfileMainScreen extends StatelessWidget {
  const DoctorProfileMainScreen({super.key});

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
                      child: Text("OE", style: TextStyles.font20BlackRegular),
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
            FutureBuilder<String>(
              future: SharedPrefHelper.getFullName(),
              builder: (context, nameSnapshot) {
                final doctorName = nameSnapshot.data?.isNotEmpty ?? false
                    ? nameSnapshot.data!
                    : 'Dr omar eid';
                return Text(
                  "Dr $doctorName",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            Text("+20 1012345678", style: TextStyles.font12GreyRegular),
            const SizedBox(height: 20),
            ProfileOption(
              title: "Edit Profile",
              icon: Icons.person,
              onTap: () {
                context.pushNamed(Routes.EditProfileScreen);
              },
            ),
            ProfileOption(
              title: "Change Password",
              icon: Icons.lock,
              onTap: () {
                context.pushNamed(Routes.ChangePasswordPatientScreen);
              },
            ),
            ProfileOption(
              title: "Patient Files",
              icon: Icons.bloodtype,
              onTap: () {
                context.pushNamed(Routes.PatientFilesScreen);
              },
            ),
            ProfileOption(
              title: "Billing Reports",
              icon: Icons.account_balance,
              onTap: () {
                context.pushNamed(Routes.BillingReportsScreen);
              },
            ),
            ProfileOption(
              title: "Settings",
              icon: Icons.settings,
              onTap: () {
                context.pushNamed(Routes.ProfileSettings);
              },
            ),
            ProfileOption(
              title: "Language",
              icon: Icons.language,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LanguageScreen();
                  },
                );
              },
            ),
            ProfileOption(
              title: "Help Center",
              icon: Icons.help,
              onTap: () {
                context.pushNamed(Routes.HelpCenterScreen);
              },
            ),
            ProfileOption(
              title: "Log Out",
              icon: Icons.logout,
              onTap: () {
                // context.pushNamed(Routes.LogOutDoctorScreen);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return LogOutDoctorScreen();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
