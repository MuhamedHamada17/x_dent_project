import 'package:json_annotation/json_annotation.dart';

part 'doctors_payment_appointments_model.g.dart';

@JsonSerializable(explicitToJson: true)
class DoctorsPaymentAppointmentsModel {
  final String status;
  final PaymentAppointment appointments;

  DoctorsPaymentAppointmentsModel({
    required this.status,
    required this.appointments,
  });

  factory DoctorsPaymentAppointmentsModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorsPaymentAppointmentsModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DoctorsPaymentAppointmentsModelToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PaymentAppointment {
  final int id;
  @JsonKey(name: 'recipent')
  final String recipient;
  @JsonKey(name: 'refference')
  final String reference;
  @JsonKey(name: 'payment_method')
  final String paymentMethod;
  @JsonKey(name: 'date')
  final String? date;
  @JsonKey(name: 'amount')
  final String? amount;

  PaymentAppointment({
    required this.id,
    required this.recipient,
    required this.reference,
    required this.paymentMethod,
    this.date,
    this.amount,
  });

  factory PaymentAppointment.fromJson(Map<String, dynamic> json) =>
      _$PaymentAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentAppointmentToJson(this);
}
