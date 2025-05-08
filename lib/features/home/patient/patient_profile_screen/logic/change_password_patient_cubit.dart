import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/features/home/patient/patient_profile_screen/data/repos/change_password_patient_repo.dart';
import '../data/models/change_paasword_patient_request.dart';
import 'change_password_patient_state.dart';

class ChangePasswordPatientCubit extends Cubit<ChangePasswordPatientState> {
  final ChangePasswordPatientRepo _repo;

  ChangePasswordPatientCubit(this._repo)
      : super(const ChangePasswordPatientState.initial());

  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // متغيرات لتتبع حالة إظهار/إخفاء كلمة المرور لكل حقل
  bool isCurrentPasswordObscure = true;
  bool isNewPasswordObscure = true;
  bool isConfirmPasswordObscure = true;

  // دوال لتبديل حالة إظهار/إخفاء كلمة المرور
  void toggleCurrentPasswordObscure() {
    isCurrentPasswordObscure = !isCurrentPasswordObscure;
    emit(state); // تحديث الـ UI
  }

  void toggleNewPasswordObscure() {
    isNewPasswordObscure = !isNewPasswordObscure;
    emit(state); // تحديث الـ UI
  }

  void toggleConfirmPasswordObscure() {
    isConfirmPasswordObscure = !isConfirmPasswordObscure;
    emit(state); // تحديث الـ UI
  }

  Future<void> changePassword() async {
    if (!formKey.currentState!.validate()) return;

    // التحقق من تطابق كلمة المرور الجديدة وتأكيدها
    if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
      emit(ChangePasswordPatientState.error(
        error: ApiErrorModel(
          success: false,
          message: 'The new password and its confirmation do not match',
          statusCode: 400,
        ),
      ));
      return;
    }

    emit(const ChangePasswordPatientState.loading());

    final response = await _repo.changePassword(
      ChangePasswordPatientRequest(
        currentPassword: currentPasswordController.text.trim(),
        newPassword: newPasswordController.text.trim(),
        newPasswordConfirmation: confirmPasswordController.text.trim(),
      ),
    );

    response.when(
      success: (changePasswordResponse) async {
        // مسح الحقول بعد النجاح
        currentPasswordController.clear();
        newPasswordController.clear();
        confirmPasswordController.clear();
        emit(ChangePasswordPatientState.success(changePasswordResponse));
      },
      failure: (error) {
        emit(ChangePasswordPatientState.error(error: error.apiErrorModel));
      },
    );
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}