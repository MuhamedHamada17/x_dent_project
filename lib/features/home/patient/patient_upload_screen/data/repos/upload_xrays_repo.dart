import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:x_dent_project/core/networking/api_error_handler.dart';
import 'package:x_dent_project/core/networking/api_result.dart';
import 'package:x_dent_project/core/networking/api_service.dart';
import 'package:x_dent_project/features/home/patient/patient_upload_screen/data/models/upload_xrays_response_model.dart';
import 'package:x_dent_project/core/networking/api_constants.dart';

import '../models/upload_xrays_request_model.dart';

class UploadXraysRepo {
  final ApiService _apiService;

  UploadXraysRepo(this._apiService);

  Future<ApiResult<UploadXraysResponse>> uploadXrays({
    required String token,
    required UploadXraysRequest request,
  }) async {
    try {
      debugPrint('UploadXraysRepo: Uploading X-ray - token: $token');
      debugPrint('UploadXraysRepo: Base URL: ${ApiConstants.apiBaseUrl}');
      debugPrint('UploadXraysRepo: Endpoint: ${ApiConstants.uploadXrays}');

      // Send request manually to capture raw response
      final dioResponse = await Dio().post(
        '${ApiConstants.apiBaseUrl}${ApiConstants.uploadXrays}',
        data: request.toFormData(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      debugPrint('UploadXraysRepo: Status Code: ${dioResponse.statusCode}');
      debugPrint('UploadXraysRepo: Raw Response: ${dioResponse.data}');

      // Parse response if it's JSON
      if (dioResponse.statusCode == 200 || dioResponse.statusCode == 201) {
        final response = UploadXraysResponse.fromJson(dioResponse.data);
        debugPrint('UploadXraysRepo: Upload successful, message: ${response.message}');
        return ApiResult.success(response);
      } else {
        return ApiResult.failure(
          ErrorHandler.handle(
            Exception('Unexpected status code: ${dioResponse.statusCode}, Response: ${dioResponse.data}'),
          ),
        );
      }
    } catch (error, stackTrace) {
      if (error is DioException) {
        final responseData = error.response?.data;
        final statusCode = error.response?.statusCode;
        debugPrint('UploadXraysRepo: DioException - Type: ${error.type}');
        debugPrint('UploadXraysRepo: DioException - Message: ${error.message}');
        debugPrint('UploadXraysRepo: DioException - Status Code: $statusCode');
        debugPrint('UploadXraysRepo: DioException - Response: $responseData');
        return ApiResult.failure(
          ErrorHandler.handle(
            Exception('Server error: $responseData, Status Code: $statusCode'),
          ),
        );
      }
      debugPrint('UploadXraysRepo: Error uploading X-ray: $error, stackTrace: $stackTrace');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}