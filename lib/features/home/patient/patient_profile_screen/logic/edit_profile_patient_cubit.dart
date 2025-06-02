import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/models/edit_profile_patient_response_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/edit_profile_patient_repo.dart';
import '../../../../../core/helpers/shared_pref_helper.dart';
import 'edit_profile_patient_state.dart';

class EditProfilePatientCubit extends Cubit<EditProfilePatientState> {
  final EditProfilePatientRepo _repo;

  EditProfilePatientCubit(this._repo) : super(const EditProfilePatientState.initial());

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> editProfile() async {
    if (!formKey.currentState!.validate()) return;

    emit(const EditProfilePatientState.loading());

    final token = await SharedPrefHelper.getSecuredString('access_token');

    final request = EditProfilePatientRequest(
      firstName: firstNameController.text.trim(),
      lastName: lastNameController.text.trim(),
      email: emailController.text.trim(),
    );

    // طباعة الـ Request Body للتأكيد
    debugPrint('Sending Request: ${request.toJson()}');

    final response = await _repo.editProfile(
      token,
      request,
    );

    response.when(
      success: (EditProfilePatientResponse profileResponse) async {
        // طباعة الـ Response للتأكيد
        debugPrint('Received Response: ${profileResponse.toJson()}');
        // مسح الحقول بعد النجاح (اختياري)
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        emit(EditProfilePatientState.success(profileResponse));
      },
      failure: (error) {
        emit(EditProfilePatientState.error(error: error.apiErrorModel));
      },
    );
  }

  @override
  Future<void> close() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    return super.close();
  }
}