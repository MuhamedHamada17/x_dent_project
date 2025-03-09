import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final bool? success;
  final String message;
  @JsonKey(name: 'status_code')
  final int statusCode;

  ApiErrorModel({
    this.success,
    required this.message,
    required this.statusCode,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
