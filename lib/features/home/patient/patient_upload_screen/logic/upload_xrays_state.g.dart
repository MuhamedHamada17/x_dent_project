// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_xrays_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadXraysInitialImpl _$$UploadXraysInitialImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadXraysInitialImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UploadXraysInitialImplToJson(
        _$UploadXraysInitialImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UploadXraysLoadingImpl _$$UploadXraysLoadingImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadXraysLoadingImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UploadXraysLoadingImplToJson(
        _$UploadXraysLoadingImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$UploadXraysSuccessImpl _$$UploadXraysSuccessImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadXraysSuccessImpl(
      UploadXraysResponse.fromJson(json['response'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UploadXraysSuccessImplToJson(
        _$UploadXraysSuccessImpl instance) =>
    <String, dynamic>{
      'response': instance.response,
      'runtimeType': instance.$type,
    };

_$UploadXraysErrorImpl _$$UploadXraysErrorImplFromJson(
        Map<String, dynamic> json) =>
    _$UploadXraysErrorImpl(
      ApiErrorModel.fromJson(json['error'] as Map<String, dynamic>),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$UploadXraysErrorImplToJson(
        _$UploadXraysErrorImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
