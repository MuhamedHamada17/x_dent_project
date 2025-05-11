import 'package:json_annotation/json_annotation.dart';

part 'cancel_appointment_model.g.dart';

@JsonSerializable()
class CancelAppointmentModel {
  final String status;
  final String message;

  const CancelAppointmentModel({
    required this.status,
    required this.message,
  });

  factory CancelAppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$CancelAppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$CancelAppointmentModelToJson(this);
}