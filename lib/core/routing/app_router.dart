import 'package:flutter/material.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/forget_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/screens/doctor_home_page/doctor_home_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/notification.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/patient_home_page.dart';
import 'package:x_dent_project/features/layout/layout_patient/lay_out_patient.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';
import 'package:x_dent_project/features/signUp/ui/screens/signup_doctor/sign_up_doctor_screen1.dart';
import 'package:x_dent_project/features/signUp/ui/screens/signup_doctor/sign_up_doctor_screen2.dart';
import 'package:x_dent_project/features/signUp/ui/screens/signup_patient/sign_up_patient_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
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