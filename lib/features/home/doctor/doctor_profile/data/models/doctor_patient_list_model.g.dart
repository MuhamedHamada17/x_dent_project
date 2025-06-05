// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_patient_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorPatientListModel _$DoctorPatientListModelFromJson(
        Map<String, dynamic> json) =>
    DoctorPatientListModel(
      status: json['status'] as String,
      patients: (json['patients'] as List<dynamic>)
          .map((e) => Patient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorPatientListModelToJson(
        DoctorPatientListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'patients': instance.patients,
    };

Patient _$PatientFromJson(Map<String, dynamic> json) => Patient(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      appointmentDate: json['apppointment_date'] as String,
    );

Map<String, dynamic> _$PatientToJson(Patient instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'apppointment_date': instance.appointmentDate,
    };
