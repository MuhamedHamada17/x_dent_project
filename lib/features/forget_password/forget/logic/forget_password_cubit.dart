import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import '../data/models/forget_password_request_body.dart';
import '../data/repo/forget_password_repo.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPasswordRepo _repo;

  ForgetPasswordCubit(this._repo) : super(const ForgetPasswordState.initial());

  Future<void> sendCode(ForgetPasswordRequestBody request) async {
    emit(const ForgetPasswordState.loading());
    debugPrint('ForgetPasswordCubit: Sending code for email: ${request.email}');
    final response = await _repo.sendForgetPasswordCode(request);
    response.when(
      success: (responseBody) {
        debugPrint('ForgetPasswordCubit: Success: ${responseBody.message}');
        // Save the email from the response to SharedPreferences
        SharedPrefHelper.setData('forget_password_email', responseBody.data);
        emit(ForgetPasswordState.success(responseBody));
      },
      failure: (error) {
        debugPrint('ForgetPasswordCubit: Error: ${error.apiErrorModel.message}');
        emit(ForgetPasswordState.error(error: error.apiErrorModel));
      },
    );
  }
}