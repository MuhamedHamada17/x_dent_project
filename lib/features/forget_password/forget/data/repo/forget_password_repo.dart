import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:flutter/material.dart';

import '../models/forget_password_request_body.dart';
import '../models/forget_password_response_body.dart';

class ForgetPasswordRepo {
  final ApiService _apiService;

  ForgetPasswordRepo(this._apiService);

  Future<ApiResult<ForgetPasswordResponseBody>> sendForgetPasswordCode(
      ForgetPasswordRequestBody request) async {
    try {
      debugPrint('ForgetPasswordRepo: Sending forget password request for email: ${request.email}');
      final response = await _apiService.sendForgetPasswordCode(request);
      debugPrint('ForgetPasswordRepo: Response received: $response');
      return ApiResult.success(response);
    } catch (error) {
      debugPrint('ForgetPasswordRepo: Error: $error');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}