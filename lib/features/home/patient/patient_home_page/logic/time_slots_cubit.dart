import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import 'package:x_dent_project/core/helpers/shared_pref_helper.dart';
import 'package:x_dent_project/features/home/patient/patient_home_page/data/models/time_slots_model.dart';
import '../data/repos/time-slots_repo.dart';
import 'time_slots_state.dart';

class TimeSlotsCubit extends Cubit<TimeSlotsState> {
  final TimeSlotsRepo _repo;

  TimeSlotsCubit(this._repo) : super(const TimeSlotsState.initial());

  Future<void> fetchAvailableSlots(int doctorId, String date) async {
    emit(const TimeSlotsState.loading());

    if (doctorId <= 0) {
      debugPrint('TimeSlotsCubit: Invalid doctorId: $doctorId');
      emit(TimeSlotsState.error(
        error: ApiErrorModel(
          message: 'The doctor ID is invalid',
          statusCode: 400,
        ),
      ));
      return;
    }
    if (date.isEmpty || !RegExp(r'^\d{4}-\d{2}-\d{2}$').hasMatch(date)) {
      debugPrint('TimeSlotsCubit: Invalid date format: $date');
      emit(TimeSlotsState.error(
        error: ApiErrorModel(
          message: 'Invalid date format, use YYYY-MM-DD',
          statusCode: 400,
        ),
      ));
      return;
    }

    final cachedSlots = await SharedPrefHelper.getAvailableSlots(doctorId, date);
    if (cachedSlots.isNotEmpty) {
      debugPrint('TimeSlotsCubit: Retrieved ${cachedSlots.length} slots from cache for doctorId: $doctorId, date: $date');
      emit(TimeSlotsState.success(TimeSlotsResponse(status: 'success', slots: cachedSlots)));
      return;
    }

    final token = await SharedPrefHelper.getSecuredString('access_token');
    if (token.isEmpty) {
      debugPrint('TimeSlotsCubit: No access token found');
      emit(TimeSlotsState.error(
        error: ApiErrorModel(
          message: 'Please log in firstً',
          statusCode: 401,
        ),
      ));
      return;
    }

    debugPrint('TimeSlotsCubit: Fetching slots for doctorId: $doctorId, date: $date with token: $token');

    final response = await _repo.getAvailableSlots(
      doctorId: doctorId,
      date: date,
    );

    response.when(
      success: (TimeSlotsResponse slotsResponse) async {
        debugPrint('TimeSlotsCubit: Received Response: ${slotsResponse.toJson()}');
        if (slotsResponse.slots.isEmpty) {
          emit(TimeSlotsState.error(
            error: ApiErrorModel(
              message: 'There are no appointments available for today',
              statusCode: 404,
            ),
          ));
          return;
        }
        await SharedPrefHelper.saveAvailableSlots(doctorId, date, slotsResponse.slots);
        emit(TimeSlotsState.success(slotsResponse));
      },
      failure: (error) {
        debugPrint('TimeSlotsCubit: Error: ${error.apiErrorModel.message}, Status: ${error.apiErrorModel.statusCode}');
        String message = error.apiErrorModel.message ?? 'An error occurred while fetching appointments';
        if (error.apiErrorModel.statusCode == 404) {
          message = 'The doctor is not available on this day';
        }
        SharedPrefHelper.clearAvailableSlots(doctorId, date);
        emit(TimeSlotsState.error(
          error: ApiErrorModel(
            message: message,
            statusCode: error.apiErrorModel.statusCode,
          ),
        ));
      },
    );
  }
}