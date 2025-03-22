import 'package:flutter/material.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/forget_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/screens/doctor_home_page/doctor_home_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_message/ui/screens/doc_chat_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_message/ui/screens/doc_message_main_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/billing_reports_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/change_password_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/edit_profile_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/help_center_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/language_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/log_out_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/profile_settings.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/screens/appointment-details_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/patient_home_page.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/specialty_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/ui/chat_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/ui/patient_messages_screen.dart';
import 'package:x_dent_project/features/layout/layout_patient/lay_out_patient.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';
import 'package:x_dent_project/features/signUp/doctor/ui/screens/sign_up_doctor_screen1.dart';
import 'package:x_dent_project/features/signUp/doctor/ui/screens/sign_up_doctor_screen2.dart';
import 'package:x_dent_project/features/signUp/patient/ui/screens/signup_patient/sign_up_patient_screen.dart';
import 'package:x_dent_project/features/splash/splash_screen.dart';
import '../../features/forget_password/otp/ui/otp_screen.dart';
import '../../features/forget_password/reset_password/ui/reset_password_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginPatientScreen:
        return MaterialPageRoute(builder: (_) => const LoginPatientScreen());
      case Routes.loginDoctorScreen:
        return MaterialPageRoute(builder: (_) => const LoginDoctorScreen());
      case Routes.signUpPatientScreen:
        return MaterialPageRoute(builder: (_) => const SignUpPatientScreen());
      case Routes.signUpDoctorScreen1:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen1());
      case Routes.signUpDoctorScreen2:
        return MaterialPageRoute(builder: (_) => const SignUpDoctorScreen2());
      case Routes.doctorHomeScreen:
        return MaterialPageRoute(builder: (_) => const DoctorHomeScreen());
      case Routes.patientHomeScreen:
        return MaterialPageRoute(builder: (_) => const PatientHomePage());
      case Routes.forgetScreen:
        return MaterialPageRoute(builder: (_) => const ForgetScreen());
      case Routes.otpScreen:
        return MaterialPageRoute(builder: (_) => const OtpScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.AppLayoutPatient:
        return MaterialPageRoute(builder: (_) => const AppLayoutPatient());
      case Routes.notification:
        return MaterialPageRoute(builder: (_) => const AppLayoutPatient());
      case Routes.ChatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case Routes.DoctorMessageScreen:
        return MaterialPageRoute(builder: (_) => const DoctorMessageScreen());
      case Routes.specialtyScreen:
        return MaterialPageRoute(builder: (_) => const SpecialtyScreen());
      case Routes.BillingReportsScreen:
        return MaterialPageRoute(builder: (_) => const BillingReportsScreen());
      case Routes.ChangePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.EditProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case Routes.HelpCenterScreen:
        return MaterialPageRoute(builder: (_) => const HelpCenterScreen());
      case Routes.LanguageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.LogOutScreen:
        return MaterialPageRoute(builder: (_) => const LogOutScreen());
      case Routes.PatientFilesScreen:
        return MaterialPageRoute(builder: (_) => const PatientFilesScreen());
      case Routes.ProfileSettings:
        return MaterialPageRoute(builder: (_) => const ProfileSettings());
      case Routes.chatScreenPatient:
        return MaterialPageRoute(builder: (_) => const ChatScreenPatient());
      case Routes.appointmentDetailsPatientScreen:
        return MaterialPageRoute(
          builder: (_) => const AppointmentDetailsPatientScreen(),
        );
      case Routes.patientMessagesScreen:
        return MaterialPageRoute(builder: (_) => const PatientMessagesScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text("No route defined for ${settings.name}"),
                ),
              ),
        );
    }
  }
}
