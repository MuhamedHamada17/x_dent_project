import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/reset_password_response_body.dart';

part 'reset_password_state.freezed.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState.initial() = _Initial;
  const factory ResetPasswordState.loading() = _Loading;
  const factory ResetPasswordState.success(ResetPasswordResponseBody response) = _Success;
  const factory ResetPasswordState.error(String error) = _Error;
}