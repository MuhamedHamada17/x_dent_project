// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctors_payment_appointments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorsPaymentAppointmentsModel _$DoctorsPaymentAppointmentsModelFromJson(
        Map<String, dynamic> json) =>
    DoctorsPaymentAppointmentsModel(
      status: json['status'] as String,
      appointments: PaymentAppointment.fromJson(
          json['appointments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorsPaymentAppointmentsModelToJson(
        DoctorsPaymentAppointmentsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'appointments': instance.appointments.toJson(),
    };

PaymentAppointment _$PaymentAppointmentFromJson(Map<String, dynamic> json) =>
    PaymentAppointment(
      id: (json['id'] as num).toInt(),
      recipient: json['recipent'] as String,
      reference: json['refference'] as String,
      paymentMethod: json['payment_method'] as String,
      date: json['date'] as String?,
      amount: json['amount'] as String?,
    );

Map<String, dynamic> _$PaymentAppointmentToJson(PaymentAppointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recipent': instance.recipient,
      'refference': instance.reference,
      'payment_method': instance.paymentMethod,
      'date': instance.date,
      'amount': instance.amount,
    };
