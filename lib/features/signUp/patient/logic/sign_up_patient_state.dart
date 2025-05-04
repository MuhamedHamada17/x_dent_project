import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/networking/api_error_model.dart';

part 'sign_up_patient_state.freezed.dart';

@freezed
class SignUpPatientState<T> with _$SignUpPatientState<T> {
  const factory SignUpPatientState.initial() = _Initial;
  const factory SignUpPatientState.loading() = Loading;
  const factory SignUpPatientState.success(T data) = Success<T>;
  const factory SignUpPatientState.error({required ApiErrorModel error}) = Error;
}