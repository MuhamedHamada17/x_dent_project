import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/make_appointment_request_model.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/repos/make_appointment_repo.dart';
import 'make_appointment_state.dart';

class MakeAppointmentCubit extends Cubit<MakeAppointmentState> {
  final MakeAppointmentRepo _makeAppointmentRepo;

  MakeAppointmentCubit(this._makeAppointmentRepo)
      : super(const MakeAppointmentState.initial());

  Future<void> makeAppointment({
    required int doctorId,
    required String day,
    required String time,
  }) async {
    emit(const MakeAppointmentState.loading());

    try {
      if (doctorId <= 0) {
        emit(MakeAppointmentState.error(
          error: ApiErrorModel(
            message: 'معرف الدكتور غير صالح',
            statusCode: ResponseCode.BAD_REQUEST,
            success: false,
          ),
        ));
        return;
      }

      if (day.isEmpty || time.isEmpty) {
        emit(MakeAppointmentState.error(
          error: ApiErrorModel(
            message: 'اليوم أو الوقت لا يمكن أن يكون فارغًا',
            statusCode: ResponseCode.BAD_REQUEST,
            success: false,
          ),
        ));
        return;
      }

      final token = await SharedPrefHelper.getSecuredString('access_token');
      if (token.isEmpty) {
        emit(MakeAppointmentState.error(
          error: ApiErrorModel(
            message: 'لم يتم العثور على التوكن',
            statusCode: ResponseCode.UNAUTHORIZED,
            success: false,
          ),
        ));
        return;
      }

      final request = MakeAppointmentRequest(day: day, time: time);
      final result = await _makeAppointmentRepo.makeAppointment(
        token: 'Bearer $token',
        doctorId: doctorId,
        request: request,
      );

      result.when(
        success: (response) {
          emit(MakeAppointmentState.success(response));
        },
        failure: (error) {
          emit(MakeAppointmentState.error(error: error.apiErrorModel));
        },
      );
    } catch (error) {
      final errorModel = ErrorHandler.handle(error).apiErrorModel;
      emit(MakeAppointmentState.error(error: errorModel));
    }
  }
}