import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/signUp/doctor/data/models/Sign_up_request_doctor_model.dart';
import 'package:x_dent_project/features/signUp/doctor/data/repos/sign_up_doctor_repo.dart';
import 'package:x_dent_project/features/signUp/doctor/logic/sign_up_doctor_state.dart';
import 'package:dio/dio.dart';

class SignUpDoctorCubit extends Cubit<SignUpDoctorState> {
  final SignUpDoctorRepo _signDoctorRepo;

  SignUpDoctorCubit(this._signDoctorRepo)
    : super(const SignUpDoctorState.initial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController yearGraduatedController = TextEditingController();
  final TextEditingController specializationController =
      TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final GlobalKey<FormState> formKeyScreen1 = GlobalKey<FormState>();
  final GlobalKey<FormState> formKeyScreen2 = GlobalKey<FormState>();

  Future<void> signDoctor() async {
    if (!formKeyScreen1.currentState!.validate() ||
        !formKeyScreen2.currentState!.validate()) {
      print('فشل التحقق: النموذج غير صالح');
      emit(
        SignUpDoctorState.error(
          error: ApiErrorModel(
            message: 'من فضلك املأ جميع الحقول المطلوبة',
            statusCode: 400,
          ),
        ),
      );
      return;
    }

    // التأكد من وجود degree, university, وyearGraduated
    if (degreeController.text.isEmpty ||
        universityController.text.isEmpty ||
        yearGraduatedController.text.isEmpty) {
      print('فشل التحقق: degree أو university أو year graduated فاضي');
      emit(
        SignUpDoctorState.error(
          error: ApiErrorModel(
            message: 'degree و university و year graduated مطلوبة',
            statusCode: 400,
          ),
        ),
      );
      return;
    }

    emit(const SignUpDoctorState.loading());

    // معالجة myspec كنص
    final myspec = specializationController.text
        .split(',')
        .map((s) => s.trim())
        .where((s) => s.isNotEmpty)
        .map((s) => s[0].toUpperCase() + s.substring(1).toLowerCase())
        .join(',');

    final requestBody = SignUpRequestDoctorModel(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
      phone: phoneController.text.isEmpty ? null : phoneController.text.trim(),
      address:
          locationController.text.isEmpty
              ? null
              : locationController.text.trim(),
      role: "doctor",
      myspec: myspec.isNotEmpty ? myspec : 'General',
      degree: degreeController.text.trim(),
      university: universityController.text.trim(),
      yearGraduated: yearGraduatedController.text.trim(),
    );

    // طباعة الـ request body للتحقق
    print('Request Body: ${requestBody.toJson()}');

    try {
      final response = await _signDoctorRepo.signDoctor(requestBody);
      response.when(
        success: (signDoctorResponse) async {
          // طباعة الـ response كامل للتحقق
          print('Full Response: ${signDoctorResponse.toJson()}');
          // أخذ الـ message من المستوى الأول
          String successMessage =
              signDoctorResponse.message ??
              'التسجيل ناجح، لكن ما فيش رسالة محددة';
          print('التسجيل ناجح: $successMessage');
          // حفظ البيانات في SharedPreferences
          if (signDoctorResponse.data != null) {
            await SharedPrefHelper.setData(
              'first_name',
              signDoctorResponse.data!.firstName ?? '',
            );
            await SharedPrefHelper.setData(
              'last_name',
              signDoctorResponse.data!.lastName ?? '',
            );
            await SharedPrefHelper.setData(
              'full_name',
              '${signDoctorResponse.data!.firstName ?? ''} ${signDoctorResponse.data!.lastName ?? ''}',
            );
          } else {
            print('تحذير: signDoctorResponse.data هو null');
          }

          emit(SignUpDoctorState.success(signDoctorResponse));
        },
        failure: (error) {
          print('تفاصيل فشل الـ API: ${error.apiErrorModel.message}');
          emit(SignUpDoctorState.error(error: error.apiErrorModel));
        },
      );
    } catch (e) {
      if (e is DioException) {
        print('=== تفاصيل DioException ===');
        print('DioException Message: ${e.message}');
        print('Response Data: ${e.response?.data ?? 'لا يوجد بيانات رد'}');
        print(
          'Response Status Code: ${e.response?.statusCode ?? 'لا يوجد كود حالة'}',
        );
        print('Response Headers: ${e.response?.headers ?? 'لا يوجد هيدرز'}');
        print('Request Data: ${e.requestOptions.data}');
        print('Request Headers: ${e.requestOptions.headers}');
        print('Full DioException: $e');
        print('====================');
        String errorMessage = 'خطأ غير معروف في الـ API';
        if (e.response?.data != null) {
          errorMessage =
              e.response!.data['message'] ?? 'رد غير صالح من السيرفر';
          if (e.response!.data['errors'] != null) {
            final errors = e.response!.data['errors'] as Map<String, dynamic>?;
            errorMessage =
                errors?.entries
                    .map((entry) => '${entry.key}: ${entry.value.join(', ')}')
                    .join('\n') ??
                errorMessage;
          }
        }
        emit(
          SignUpDoctorState.error(
            error: ApiErrorModel(
              message: errorMessage,
              statusCode: e.response?.statusCode ?? -1,
            ),
          ),
        );
      } else {
        print('=== استثناء غير Dio ===');
        print('فشل التسجيل: $e');
        print('====================');
        emit(
          SignUpDoctorState.error(
            error: ApiErrorModel(
              message: 'خطأ غير متوقع: ${e.toString()}',
              statusCode: -7,
            ),
          ),
        );
      }
    }
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    degreeController.dispose();
    universityController.dispose();
    yearGraduatedController.dispose();
    specializationController.dispose();
    locationController.dispose();
    return super.close();
  }
}
