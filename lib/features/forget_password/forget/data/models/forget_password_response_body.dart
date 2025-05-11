import 'package:json_annotation/json_annotation.dart';

part 'forget_password_response_body.g.dart';

@JsonSerializable()
class ForgetPasswordResponseBody {
  final bool success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;
  final String data;

  const ForgetPasswordResponseBody({
    required this.success,
    required this.message,
    required this.statusCode,
    required this.data,
  });

  factory ForgetPasswordResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ForgetPasswordResponseBodyToJson(this);
}