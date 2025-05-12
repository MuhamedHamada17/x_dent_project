import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/specialization_doctors_model.dart';

abstract class SpecializationDoctorsState {}

class SpecializationDoctorsInitial extends SpecializationDoctorsState {}

class SpecializationDoctorsLoading extends SpecializationDoctorsState {}

class SpecializationDoctorsSuccess extends SpecializationDoctorsState {
  final SpecializationDoctorsResponse data;
  SpecializationDoctorsSuccess(this.data);
}

class SpecializationDoctorsError extends SpecializationDoctorsState {
  final String message;
  SpecializationDoctorsError(this.message);
}