import 'package:flutter/material.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import '../models/reset_password_request_body.dart';
import '../models/reset_password_response_body.dart';

class ResetPasswordRepo {
  final ApiService _apiService;

  ResetPasswordRepo(this._apiService);

  Future<ApiResult<ResetPasswordResponseBody>> resetPassword(
      ResetPasswordRequestBody request) async {
    try {
      debugPrint('ResetPasswordRepo: Sending reset password request: ${request.toJson()}');
      final response = await _apiService.resetPassword(request);
      debugPrint('ResetPasswordRepo: Response received: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('ResetPasswordRepo: Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}