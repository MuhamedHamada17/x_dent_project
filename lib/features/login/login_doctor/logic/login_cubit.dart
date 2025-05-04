import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
import '../data/models/login_request_body.dart';
import '../data/models/login_response_body.dart';
import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState<LoginResponseBody>> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    response.when(
      success: (loginResponse) async {
        // تخزين الاسم والتوكن في SharedPreferences
        await SharedPrefHelper.setData(
            'first_name', loginResponse.authData.data.firstName);
        await SharedPrefHelper.setData(
            'last_name', loginResponse.authData.data.lastName);
        // اختياري: لو عايز تخزن الاسم كامل (first_name + last_name)
        await SharedPrefHelper.setData(
            'full_name',
            '${loginResponse.authData.data.firstName} ${loginResponse.authData.data.lastName}');
        // تخزين الـ access_token في secure storage
        await SharedPrefHelper.setSecuredString(
            'access_token', loginResponse.authData.accessToken);

        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}