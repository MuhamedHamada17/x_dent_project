import 'package:json_annotation/json_annotation.dart';

part 'otp_request_body.g.dart';

@JsonSerializable()
class OtpRequestBody {
  @JsonKey(name: 'email')
  final String email;

  @JsonKey(name: 'code')
  final String code;

  const OtpRequestBody({
    required this.email,
    required this.code,
  });

  factory OtpRequestBody.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestBodyToJson(this);
}