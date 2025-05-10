import 'package:flutter/material.dart';
import 'package:x_dent_project/features/filter_patient/ui/screens/filter_patient_screen.dart';
import 'package:x_dent_project/features/forget_password/forget/ui/forget_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/ui/screens/doctor_home_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_message/ui/screens/doc_chat_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_message/ui/screens/doc_message_main_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/Billing%20_reports/bill_detailes.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/Billing%20_reports/billing_reports_maim_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/Billing%20_reports/transfer_to_bank_account/transfer_to_bank_account_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/change_password_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/edit_profile_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/language_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/log_out_doctor_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Midical_records/midical_records_file_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/anlysis_screens/analysis_screens.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/prescriptions/prescriptions_main_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/edit_treatment_plan.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/treatment_Plan/treatment_plan_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/upcomming_appointment/upcomming_appointment.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_list_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/x_ray_file_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/patient_files_screens/patient_data_screens/Xrays/x_rays_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/profile_setting/availablity_location_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/profile_setting/availablity_screen.dart';
import 'package:x_dent_project/features/home/doctor/doctor_profile/ui/screens/profile_setting/profile_settings.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/ui/screens/appointment-details_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/doctor_list_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/notification.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/patient_home_page.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/ui/screens/specialty_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/ui/chat_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/ui/patient_messages_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/screens/change_password_patient_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/screens/data_and_treatment_plans_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/screens/edit_profile_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/screens/help_center_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/widgets/log_out_patient_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/screens/perscriptions_pattient_screen.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/screens/profile_settings_patient.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_settings/ui/screens/treatments_plans_screen.dart';
import 'package:x_dent_project/features/layout/layout_patient/lay_out_patient.dart';
import 'package:x_dent_project/features/login/login_doctor/ui/login_doctor_screen.dart';
import 'package:x_dent_project/features/login/login_patient/ui/login_patient_screen.dart';
import 'package:x_dent_project/features/on_boarding/on_boarding_screen.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/ui/add_rating_screen.dart';
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
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case Routes.ChatScreen:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case Routes.DoctorMessageScreen:
        return MaterialPageRoute(builder: (_) => const DoctorMessageScreen());
      case Routes.specialtyScreen:
        return MaterialPageRoute(builder: (_) => const SpecialtyScreen());
      case Routes.BillingReportsScreen:
        return MaterialPageRoute(
          builder: (_) => const BillingReportsMainScreen(),
        );
      case Routes.ChangePasswordScreen:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());
      case Routes.EditProfileScreen:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
      case Routes.HelpCenterScreen:
        return MaterialPageRoute(builder: (_) => const HelpCenterScreen());
      case Routes.LanguageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.LogOutDoctorScreen:
        return MaterialPageRoute(builder: (_) => const LogOutDoctorScreen());
      case Routes.PatientFilesScreen:
        return MaterialPageRoute(builder: (_) => const PatientFilesScreen());
      case Routes.PatientDetailsScreen:
        return MaterialPageRoute(builder: (_) => const PatientDetailsScreen());
      case Routes.ProfileSettings:
        return MaterialPageRoute(builder: (_) => const ProfileSettings());
      case Routes.XraysScreen:
        return MaterialPageRoute(builder: (_) => const XraysScreen());
      case Routes.XrayFileScreen:
        return MaterialPageRoute(builder: (_) => const XrayFileScreen());
      case Routes.MidicalRecordsScreen:
        return MaterialPageRoute(builder: (_) => const MidicalRecordsScreen());
      case Routes.AnalysisScreen:
        return MaterialPageRoute(builder: (_) => const AnalysisScreen());
      case Routes.chatScreenPatient:
        return MaterialPageRoute(builder: (_) => const ChatScreenPatient());
      case Routes.appointmentDetailsPatientScreen:
        return MaterialPageRoute(
          builder: (_) => const AppointmentDetailsPatientScreen(),
        );
      case Routes.patientMessagesScreen:
        return MaterialPageRoute(builder: (_) => const PatientMessagesScreen());
      case Routes.TreatmentPlanScreen:
        return MaterialPageRoute(builder: (_) => const TreatmentPlanScreen());
      case Routes.PrescriptionScreen:
        return MaterialPageRoute(builder: (_) => const PrescriptionScreen());
      case Routes.UpcomingAppointmentsScreen:
        return MaterialPageRoute(
          builder: (_) => const UpcomingAppointmentsScreen(),
        );
      case Routes.EditTreatmentPlanScreen:
        return MaterialPageRoute(
          builder: (_) => const EditTreatmentPlanScreen(),
        );
      case Routes.EditProfilePatientScreen:
        return MaterialPageRoute(
          builder: (_) => const EditProfilePatientScreen(),
        );
      case Routes.ChangePasswordPatientScreen:
        return MaterialPageRoute(
          builder: (_) => const ChangePasswordPatientScreen(),
        );
      case Routes.DataAndTreatmentPlansScreen:
        return MaterialPageRoute(
          builder: (_) => const DataAndTreatmentPlansScreen(),
        );
      case Routes.BillDetailes:
        return MaterialPageRoute(builder: (_) => const BillDetailes());
      case Routes.AvailablityLocationScreen:
        return MaterialPageRoute(
          builder: (_) => const AvailabilityLocationScreen(),
        );
      case Routes.TransferToBankAccountScreen:
        return MaterialPageRoute(builder: (_) => TransferToBankAccountScreen());
      case Routes.AvailabilityScreen:
        return MaterialPageRoute(builder: (_) => AvailabilityScreen());
      case Routes.DoctorListScreen:
        return MaterialPageRoute(builder: (_) => const DoctorListScreen());
      case Routes.LogOuPatientScreen:
        return MaterialPageRoute(builder: (_) => const LogOutPatientScreen());
      case Routes.FilterPatientScreen:
        return MaterialPageRoute(builder: (_) => const FilterPatientScreen());
      case Routes.AddRatingDialogScreen:
        return MaterialPageRoute(builder: (_) => const AddRatingDialogScreen());
      case Routes.ProfileSettingsPatient:
        return MaterialPageRoute(builder: (_) => const ProfileSettingsPatient());
      case Routes.PerscriptionsPattientScreen:
        return MaterialPageRoute(builder: (_) => const PerscriptionsPattientScreen());
      case Routes.TreatmentsPlansScreenPatient:
        return MaterialPageRoute(builder: (_) => const TreatmentsPlansScreenPatient());

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
