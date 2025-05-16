import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:x_dent_project/core/networking/api_error_model.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../data/models/upload_xrays_request_model.dart';
import '../data/repos/upload_xrays_repo.dart';
import 'upload_xrays_state.dart';

class UploadXraysCubit extends Cubit<UploadXraysState> {
  UploadXraysCubit() : super(const UploadXraysState.initial());

  final UploadXraysRepo _uploadXraysRepo = GetIt.instance<UploadXraysRepo>();

  Future<void> uploadXrays({
    required String token,
    required UploadXraysRequest request,
  }) async {
    emit(const UploadXraysState.loading());
    try {
      debugPrint('UploadXraysCubit: Attempting to upload X-ray');
      final result = await _uploadXraysRepo.uploadXrays(
        token: token,
        request: request,
      );
      result.when(
        success: (response) {
          debugPrint('UploadXraysCubit: Success: ${response.message}');
          emit(UploadXraysState.success(response));
        },
        failure: (error) {
          debugPrint('UploadXraysCubit: Error: ${error.apiErrorModel.message}');
          emit(UploadXraysState.error(error.apiErrorModel));
        },
      );
    } catch (e) {
      debugPrint('UploadXraysCubit: Exception: $e');
      emit(UploadXraysState.error(
        ApiErrorModel(
          message: e.toString(),
          statusCode: ResponseCode.DEFAULT,
        ),
      ));
    }
  }
}