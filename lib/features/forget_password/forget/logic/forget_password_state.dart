import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';

import '../data/models/forget_password_response_body.dart';

part 'forget_password_state.freezed.dart';

@freezed
class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState.initial() = _Initial;
  const factory ForgetPasswordState.loading() = _Loading;
  const factory ForgetPasswordState.success(ForgetPasswordResponseBody response) = _Success;
  const factory ForgetPasswordState.error({required ApiErrorModel error}) = _Error;
}