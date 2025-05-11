import 'package:json_annotation/json_annotation.dart';

part 'otp_response_body.g.dart';

@JsonSerializable()
class OtpResponseBody {
  final bool success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  final String data;

  const OtpResponseBody({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory OtpResponseBody.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$OtpResponseBodyToJson(this);
}