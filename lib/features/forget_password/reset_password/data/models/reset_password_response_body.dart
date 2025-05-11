import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response_body.g.dart';

@JsonSerializable()
class ResetPasswordResponseBody {
  final bool success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;

  const ResetPasswordResponseBody({
    required this.success,
    required this.message,
    required this.statusCode,
  });

  factory ResetPasswordResponseBody.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ResetPasswordResponseBodyToJson(this);
}