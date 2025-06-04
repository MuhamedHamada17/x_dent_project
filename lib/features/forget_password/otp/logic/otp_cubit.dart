import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import '../data/models/otp_request_body.dart';
import '../data/repos/otp_repo.dart';
import 'otp_state.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo _otpRepo;

  OtpCubit(this._otpRepo) : super(const OtpState.initial());

  Future<void> verifyCode(String code) async {
    emit(const OtpState.loading());
    try {
      // جلب الإيميل من SharedPreferences
      final email = await SharedPrefHelper.getForgetPasswordEmail();
      if (email.isEmpty) {
        emit(const OtpState.error('No email found. Please try again.'));
        return;
      }

      final request = OtpRequestBody(email: email, code: code);
      final result = await _otpRepo.verifyOtpCode(request);

      result.when(
        success: (response) {
          emit(OtpState.success(response));
        },
        failure: (error) {
          emit(OtpState.error(error.apiErrorModel.message));
        },
      );
    } catch (e) {
      emit(OtpState.error(e.toString()));
    }
  }
}