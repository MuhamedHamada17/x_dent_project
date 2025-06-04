import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/logic/doctor_home_cubit.dart';
import 'package:x_dent_project/features/home/doctor/doctor_home_page/data/repos/doctor_home_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/repos/appointment_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/appointment_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/repos/cancel_appointment_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/logic/cancel_appointment_cubit.dart';
import 'package:x_dent_project/features/login/login_doctor/data/repos/login_repo.dart';
import 'package:x_dent_project/features/login/login_doctor/logic/login_cubit.dart';
import 'package:x_dent_project/features/signUp/doctor/data/repos/sign_up_doctor_repo.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_cubit.dart';
import 'package:x_dent_project/features/signUp/patient/data/repos/sign_patient_repo.dart';
import 'package:x_dent_project/features/signUp/patient/logic/sign_up_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/change_password_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/change_password_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/edit_profile_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/edit_profile_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/logout_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/logout_patient_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/treatment_plan_patient_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/logic/treatment_plan_patient_cubit.dart';
import 'package:x_dent_project/features/forget_password/forget/data/repo/forget_password_repo.dart';
import 'package:x_dent_project/features/forget_password/forget/logic/forget_password_cubit.dart';
import 'package:x_dent_project/features/forget_password/otp/data/repos/otp_repo.dart';
import 'package:x_dent_project/features/forget_password/otp/logic/otp_cubit.dart';
import 'package:x_dent_project/features/forget_password/reset_password/data/repo/reset_password_repo.dart';
import 'package:x_dent_project/features/forget_password/reset_password/logic/reset_password_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/data/repos/get_all_doctors_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/logic/get_all_doctors_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/repos/specialization_doctors_repo.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/specialization_doctors_cubit.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/logic/time_slots_cubit.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/repos/add_rating_repo.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/logic/add_rating_cubit.dart';
import '../../features/home/patient/patient_home_page/data/repos/make_appointment_repo.dart';
import '../../features/home/patient/patient_home_page/data/repos/time-slots_repo.dart';
import '../../features/home/patient/patient_home_page/logic/make_appointment_cubit.dart';
import '../../features/home/patient/patient_profile_settings/data/repo/display_xrays_repo.dart';
import '../../features/home/patient/patient_profile_settings/logic/display_xrays_cubit.dart';
import '../../features/home/patient/patient_upload_screen/data/repos/upload_xrays_repo.dart';
import '../../features/home/patient/patient_upload_screen/logic/upload_xrays_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  debugPrint('ApiService registered');

  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  debugPrint('LoginRepo and LoginCubit registered');

  // Sign-up
  getIt.registerLazySingleton<SignPatientRepo>(() => SignPatientRepo(getIt()));
  getIt.registerFactory<SignUpPatientCubit>(() => SignUpPatientCubit(getIt()));
  debugPrint('SignPatientRepo and SignUpPatientCubit registered');
  // Sign-up Doctor
  getIt.registerLazySingleton<SignUpDoctorRepo>(
    () => SignUpDoctorRepo(getIt()),
  );
  getIt.registerFactory<SignUpDoctorCubit>(() => SignUpDoctorCubit(getIt()));
  debugPrint('SignPatientRepo and SignUpPatientCubit registered');

  // Get All Doctors
  getIt.registerLazySingleton<GetAllDoctorsRepo>(
    () => GetAllDoctorsRepo(getIt()),
  );
  getIt.registerFactory<GetAllDoctorsCubit>(() => GetAllDoctorsCubit(getIt()));
  debugPrint('GetAllDoctorsRepo and GetAllDoctorsCubit registered');

  // Appointments
  getIt.registerLazySingleton<AppointmentPatientRepo>(
    () => AppointmentPatientRepo(getIt()),
  );
  getIt.registerFactory<AppointmentPatientCubit>(
    () => AppointmentPatientCubit(getIt<AppointmentPatientRepo>()),
  );
  debugPrint('AppointmentPatientRepo and AppointmentPatientCubit registered');

  // Cancel Appointment
  getIt.registerLazySingleton<CancelAppointmentRepo>(
    () => CancelAppointmentRepo(getIt()),
  );
  getIt.registerFactory<CancelAppointmentCubit>(
    () => CancelAppointmentCubit(getIt()),
  );
  debugPrint('CancelAppointmentRepo and CancelAppointmentCubit registered');

  // Change Password
  getIt.registerLazySingleton<ChangePasswordPatientRepo>(
    () => ChangePasswordPatientRepo(getIt()),
  );
  getIt.registerFactory<ChangePasswordPatientCubit>(
    () => ChangePasswordPatientCubit(getIt()),
  );
  debugPrint(
    'ChangePasswordPatientRepo and ChangePasswordPatientCubit registered',
  );

  // Edit Profile
  getIt.registerLazySingleton<EditProfilePatientRepo>(
    () => EditProfilePatientRepo(getIt()),
  );
  getIt.registerFactory<EditProfilePatientCubit>(
    () => EditProfilePatientCubit(getIt()),
  );
  debugPrint('EditProfilePatientRepo and EditProfilePatientCubit registered');

  // Logout
  getIt.registerLazySingleton<LogoutPatientRepo>(
    () => LogoutPatientRepo(getIt()),
  );
  getIt.registerFactory<LogoutPatientCubit>(() => LogoutPatientCubit(getIt()));
  debugPrint('LogoutPatientRepo and LogoutPatientCubit registered');

  // Treatment Plans
  getIt.registerLazySingleton<TreatmentPlanPatientRepo>(
    () => TreatmentPlanPatientRepo(getIt()),
  );
  getIt.registerFactory<TreatmentPlanPatientCubit>(
    () => TreatmentPlanPatientCubit(getIt<TreatmentPlanPatientRepo>()),
  );
  debugPrint(
    'TreatmentPlanPatientRepo and TreatmentPlanPatientCubit registered',
  );

  // Forget Password
  getIt.registerLazySingleton<ForgetPasswordRepo>(
    () => ForgetPasswordRepo(getIt()),
  );
  getIt.registerFactory<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(getIt()),
  );
  debugPrint('ForgetPasswordRepo and ForgetPasswordCubit registered');

  // OTP Verification
  getIt.registerLazySingleton<OtpRepo>(() => OtpRepo(getIt()));
  getIt.registerFactory<OtpCubit>(() => OtpCubit(getIt()));
  debugPrint('OtpRepo and OtpCubit registered');

  // Reset Password
  getIt.registerLazySingleton<ResetPasswordRepo>(
    () => ResetPasswordRepo(getIt()),
  );
  getIt.registerFactory<ResetPasswordCubit>(() => ResetPasswordCubit(getIt()));
  debugPrint('ResetPasswordRepo and ResetPasswordCubit registered');

  // Specialization Doctors
  getIt.registerLazySingleton<SpecializationDoctorsRepo>(
    () => SpecializationDoctorsRepo(getIt()),
  );
  getIt.registerFactory<SpecializationDoctorsCubit>(
    () => SpecializationDoctorsCubit(),
  );
  debugPrint(
    'SpecializationDoctorsRepo and SpecializationDoctorsCubit registered',
  );

  // Time Slots
  getIt.registerLazySingleton<TimeSlotsRepo>(() => TimeSlotsRepo(getIt()));
  getIt.registerFactory<TimeSlotsCubit>(
    () => TimeSlotsCubit(getIt<TimeSlotsRepo>()),
  );

  // Add Rating
  getIt.registerLazySingleton<AddRatingRepo>(() => AddRatingRepo(getIt()));
  getIt.registerFactory<AddRatingCubit>(() => AddRatingCubit());
  debugPrint('AddRatingRepo and AddRatingCubit registered');

  getIt.registerLazySingleton<MakeAppointmentRepo>(
    () => MakeAppointmentRepo(getIt()),
  );
  getIt.registerFactory<MakeAppointmentCubit>(
    () => MakeAppointmentCubit(getIt()),
  );
  debugPrint('MakeAppointmentRepo and MakeAppointmentCubit registered');

  // Upload X-rays
  getIt.registerLazySingleton<UploadXraysRepo>(() => UploadXraysRepo(getIt()));
  getIt.registerFactory<UploadXraysCubit>(() => UploadXraysCubit());
  debugPrint('UploadXraysRepo and UploadXraysCubit registered');

  getIt.registerLazySingleton<DisplayXraysRepo>(
    () => DisplayXraysRepoImpl(getIt()),
  );
  getIt.registerFactory<DisplayXraysCubit>(() => DisplayXraysCubit(getIt()));
  debugPrint('DisplayXraysRepo and DisplayXraysCubit registered');
  // Doctor Home
  getIt.registerLazySingleton<DoctorHomeRepository>(
    () => DoctorHomeRepository(getIt()),
  );
  getIt.registerFactory<DoctorHomeCubit>(() => DoctorHomeCubit(getIt()));
  debugPrint('DoctorHomeRepository and DoctorHomeCubit registered');
}
