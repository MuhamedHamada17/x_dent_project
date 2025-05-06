import 'package:dio/dio.dart' hide Headers; // إخفاء Headers من dio
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
import '../../features/home/patient/patient_profile_screen/data/models/change_paasword_patient_request.dart';
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
}