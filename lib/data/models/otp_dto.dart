import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_dto.freezed.dart';
part 'otp_dto.g.dart';

@freezed
class OtpDto with _$OtpDto {
  const factory OtpDto({
    String? status,
    Data? data,
  }) = _OtpDto;

  factory OtpDto.fromJson(Map<String, dynamic> json) => _$OtpDtoFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    String? otp,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
