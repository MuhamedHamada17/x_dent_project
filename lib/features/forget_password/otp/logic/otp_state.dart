import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/otp_response_body.dart';

part 'otp_state.freezed.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.initial() = _Initial;
  const factory OtpState.loading() = _Loading;
  const factory OtpState.success(OtpResponseBody response) = _Success;
  const factory OtpState.error(String error) = _Error;
}