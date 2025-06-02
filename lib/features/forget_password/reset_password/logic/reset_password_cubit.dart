import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import '../data/models/reset_password_request_body.dart';
import '../data/repo/reset_password_repo.dart';
import 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final ResetPasswordRepo _resetPasswordRepo;

  ResetPasswordCubit(this._resetPasswordRepo) : super(const ResetPasswordState.initial());

  Future<void> resetPassword(String password, String passwordConfirmation) async {
    emit(const ResetPasswordState.loading());
    try {
      // جلب الإيميل من SharedPreferences
      final email = await SharedPrefHelper.getForgetPasswordEmail();
      if (email.isEmpty) {
        emit(const ResetPasswordState.error('No email found. Please start the process again.'));
        return;
      }

      final request = ResetPasswordRequestBody(
        email: email,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      final result = await _resetPasswordRepo.resetPassword(request);

      result.when(
        success: (response) {
          emit(ResetPasswordState.success(response));
        },
        failure: (error) {
          emit(ResetPasswordState.error(error.apiErrorModel.message ?? 'An error occurred.'));
        },
      );
    } catch (e) {
      emit(ResetPasswordState.error(e.toString()));
    }
  }
}