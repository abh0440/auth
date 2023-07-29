// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OtpDto _$$_OtpDtoFromJson(Map<String, dynamic> json) => _$_OtpDto(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OtpDtoToJson(_$_OtpDto instance) => <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      otp: json['otp'] as String?,
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'otp': instance.otp,
    };
