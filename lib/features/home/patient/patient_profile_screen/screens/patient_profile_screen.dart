import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/helpers/extentions.dart';
import 'package:x_dent_project/core/helpers/spacing.dart';
import 'package:x_dent_project/core/routing/routes.dart';
import 'package:x_dent_project/core/theiming/colors.dart';
import 'package:x_dent_project/core/theiming/styles.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_state.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/logout_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/logout_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/widgets/profile_option_patient.dart';
import '../widgets/log_out_patient_screen.dart';

class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  _PatientProfileScreenState createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  String fullName = 'Guest'; // قيمة افتراضية
  String initials = 'DR'; // قيمة افتراضية للـ CircleAvatar

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  Future<void> _loadUserName() async {
    String name = await SharedPrefHelper.getFullName();
    setState(() {
      fullName = name.isNotEmpty ? name : 'Guest';
      if (fullName.isNotEmpty && fullName != 'Guest') {
        final nameParts = fullName.split(' ');
        initials = nameParts.length > 1
            ? '${nameParts[0][0]}${nameParts[1][0]}'
            : fullName[0];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<EditProfilePatientCubit>(),
      child: BlocListener<EditProfilePatientCubit, EditProfilePatientState>(
        listener: (context, state) {
          state.whenOrNull(
            success: (response) async {
              await _loadUserName();
            },
          );
        },
        child: Scaffold(
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
                          child: Text(initials, style: TextStyles.font20BlackRegular),
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
                          onPressed: () {
                            context.pushNamed(Routes.EditProfilePatientScreen);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(18),
                Text(fullName, style: TextStyles.font22BlackMedium),
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
                    context.pushNamed(Routes.ProfileSettingsPatient);
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
                    showDialog(
                      context: context,
                      builder: (dialogContext) => BlocProvider<LogoutPatientCubit>(
                        create: (context) => LogoutPatientCubit(
                          GetIt.instance<LogoutPatientRepo>(),
                        ),
                        child: const LogOutPatientScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}