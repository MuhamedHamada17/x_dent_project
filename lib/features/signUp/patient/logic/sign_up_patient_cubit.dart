import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/shared_pref_helper.dart';
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
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> signPatient() async {
    if (!formKey.currentState!.validate()) return;

    emit(const SignUpPatientState.loading());
    final requestBody = SignPatientRequestBody(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
      confirmPassword: confirmPasswordController.text.trim(),
      phone: phoneController.text.isEmpty ? null : phoneController.text.trim(),
      address: addressController.text.isEmpty ? null : addressController.text.trim(),
      role: "patient",
    );

    final response = await _signPatientRepo.signPatient(requestBody);

    response.when(
      success: (signPatientResponse) async {
        // تخزين الأسماء في SharedPreferences بنفس طريقة LoginCubit
        await SharedPrefHelper.setData(
            'first_name', signPatientResponse.patientData.firstName);
        await SharedPrefHelper.setData(
            'last_name', signPatientResponse.patientData.lastName);
        await SharedPrefHelper.setData(
            'full_name',
            '${signPatientResponse.patientData.firstName} ${signPatientResponse.patientData.lastName}');

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
    confirmPasswordController.dispose();
    phoneController.dispose();
    addressController.dispose();
    return super.close();
  }
}