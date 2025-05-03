import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/sign_patient_request_body.dart';
import '../data/models/sign_patient_response_body.dart';
import '../data/repos/sign_patient_repo.dart';
import 'sign_up_patient_state.dart';

class SignUpPatientCubit extends Cubit<SignUpPatientState<SignPatientResponseBody>> {
  final SignPatientRepo _signPatientRepo;

  SignUpPatientCubit(this._signPatientRepo) : super(const SignUpPatientState.initial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signPatient() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignUpPatientState.loading());
    final response = await _signPatientRepo.signPatient(
      SignPatientRequestBody(
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.isEmpty ? null : phoneController.text.trim(),
        address: addressController.text.isEmpty ? null : addressController.text.trim(),
        role: "patient",
      ),
    );

    response.when(
      success: (signPatientResponse) {
        emit(SignUpPatientState.success(signPatientResponse));
      },
      failure: (error) {
        emit(SignUpPatientState.error(error: error.apiErrorModel));
      },
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    return super.close();
  }
}