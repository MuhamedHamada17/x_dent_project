import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:x_dent_project/features/login/login_doctor/data/models/login_response_body.dart';
import '../../features/login/login_doctor/data/models/login_request_body.dart';
import '../../features/signUp/patient/data/models/sign_patient_request_body.dart';
import '../../features/signUp/patient/data/models/sign_patient_response_body.dart';
import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseBody> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.signupPatient)
  Future<SignPatientResponseBody> signUpPatient(@Body() SignPatientRequestBody requestBody);
}
