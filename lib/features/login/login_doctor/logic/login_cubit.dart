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
        // تخزين الاسم والتوكن والـ role في SharedPreferences
        await SharedPrefHelper.saveUserData(
          firstName: loginResponse.authData.data.firstName,
          lastName: loginResponse.authData.data.lastName,
          fullName:
          '${loginResponse.authData.data.firstName} ${loginResponse.authData.data.lastName}',
        );
        await SharedPrefHelper.saveAccessToken(
            loginResponse.authData.accessToken);
        await SharedPrefHelper.saveUserRole(loginResponse.authData.data.role);
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