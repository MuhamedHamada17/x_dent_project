import 'package:dio/dio.dart';

class UploadXraysRequest {
  final MultipartFile image;

  UploadXraysRequest({required this.image});

  FormData toFormData() {
    return FormData()..files.add(
      MapEntry('image', image),
    );
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}