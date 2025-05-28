import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:x_dent_project/features/login/login_doctor/data/models/login_response_body.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/cancelled_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/completed_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/upcoming_appointment_model.dart';
import 'package:x_dent_project/features/login/login_doctor/data/models/login_request_body.dart';
import 'package:x_dent_project/features/signUp/patient/data/models/sign_patient_request_body.dart';
import 'package:x_dent_project/features/signUp/patient/data/models/sign_patient_response_body.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/change_password_patient_response.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_response_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/logout_patient_response_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/change_paasword_patient_request.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/treatment_plan_model.dart';
import 'package:x_dent_project/features/forget_password/forget/data/models/forget_password_request_body.dart';
import 'package:x_dent_project/features/forget_password/forget/data/models/forget_password_response_body.dart';
import 'package:x_dent_project/features/forget_password/otp/data/models/otp_request_body.dart';
import 'package:x_dent_project/features/forget_password/otp/data/models/otp_response_body.dart';
import 'package:x_dent_project/features/forget_password/reset_password/data/models/reset_password_request_body.dart';
import 'package:x_dent_project/features/forget_password/reset_password/data/models/reset_password_response_body.dart';
import 'package:x_dent_project/features/home/patient/patient_appoinment_sreen/data/models/cancel_appointment_model.dart';
import 'package:x_dent_project/features/home/patient/patient_messages_screen/data/models/get_all_doctors_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/time_slots_model.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/models/add_rating_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_response_model.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/data/models/upload_xrays_response_model.dart';
import 'package:x_dent_project/features/rating/patient/add%20rating/data/models/add_rating_response_model.dart';
import '../../features/home/patient/patient_profile_settings/data/models/display_xrays_model.dart';
import '../../features/home/patient/patient_upload_screen/data/models/upload_xrays_request_model.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signupPatient)
  Future<SignPatientResponseBody> signUpPatient(@Body() SignPatientRequestBody requestBody);

  @GET(ApiConstants.upcomingAppointment)
  Future<AppointmentResponse> getUpcomingAppointments(
      @Header('Authorization') String token,
      );

  @GET(ApiConstants.cancelledAppointment)
  Future<CancelledAppointmentResponse> getCancelledAppointments(
      @Header('Authorization') String token,
      );

  @GET(ApiConstants.confirmedAppointment)
  Future<CompletedAppointmentResponse> getConfirmedAppointments(
      @Header('Authorization') String token,
      );

  @POST(ApiConstants.changePasswordPatient)
  Future<ChangePasswordPatientResponse> changePassword(
      @Header('Authorization') String token,
      @Body() ChangePasswordPatientRequest requestBody,
      );

  @PUT(ApiConstants.editProfilePatient)
  @Headers({'Content-Type': 'application/json'})
  Future<EditProfilePatientResponse> editProfilePatient(
      @Header('Authorization') String token,
      @Body() EditProfilePatientRequest requestBody,
      );

  @POST(ApiConstants.logoutPatient)
  @Headers({'Content-Type': 'application/json'})
  Future<LogoutPatientResponse> logout(
      @Header('Authorization') String token,
      @Body() LogoutPatientRequest requestBody,
      );

  @GET(ApiConstants.treatmentPlanPatient)
  Future<TreatmentPlanResponse> getTreatmentPlans(
      @Header('Authorization') String token,
      );

  @POST(ApiConstants.forgetPassword)
  @Headers({'Content-Type': 'application/json'})
  Future<ForgetPasswordResponseBody> sendForgetPasswordCode(
      @Body() ForgetPasswordRequestBody request,
      );

  @POST(ApiConstants.otp)
  @Headers({'Content-Type': 'application/json'})
  Future<OtpResponseBody> verifyOtpCode(
      @Body() OtpRequestBody request,
      );

  @POST(ApiConstants.resetPassword)
  @Headers({'Content-Type': 'application/json'})
  Future<ResetPasswordResponseBody> resetPassword(
      @Body() ResetPasswordRequestBody request,
      );

  @PATCH(ApiConstants.cancelAppointment)
  @Headers({'Content-Type': 'application/json'})
  Future<CancelAppointmentModel> cancelAppointment(
      @Header('Authorization') String token,
      @Path('id') int appointmentId,
      );

  @GET(ApiConstants.getAllDoctors)
  Future<GetAllDoctorsResponse> getAllDoctors(
      @Header('Authorization') String token,
      );

  @GET(ApiConstants.filterSpecializationDoctors)
  Future<SpecializationDoctorsResponse> filterDoctors(
      @Header('Authorization') String token,
      @Query('specialization_names') String specialization,
      );

  @GET(ApiConstants.availableSlots)
  Future<TimeSlotsResponse> getAvailableSlots(
      @Header('Authorization') String token,
      @Path('doctorId') int doctorId,
      @Query('date') String date,
      );

  @POST(ApiConstants.addReview)
  @Headers({
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  })
  Future<AddRatingResponse> submitReview(
      @Header('Authorization') String token,
      @Path('doctorId') int doctorId,
      @Body() AddRatingRequest request,
      );

  @POST(ApiConstants.makeAppointment)
  @Headers({'Content-Type': 'application/json'})
  Future<MakeAppointmentResponse> makeAppointment(
      @Header('Authorization') String token,
      @Path('id') int doctorId,
      @Body() MakeAppointmentRequest request,
      );

  @POST(ApiConstants.uploadXrays)
  @MultiPart()
  Future<UploadXraysResponse> uploadXrays(
      @Header('Authorization') String token,
      @Body() UploadXraysRequest request,
      );
  @GET(ApiConstants.DisplayXraysPatient)
  Future<DisplayXraysResponse> displayXrays(
      @Header('Authorization') String token,
      );
}