import 'dart:developer';

import 'package:otp_application/data/models/otp_dto.dart';

abstract class AuthDataSource {
  Future<OtpDto> fetchOTP();
}

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<OtpDto> fetchOTP() async {
    try {
      var mockResponse = {
        'status': 'success',
        'data': {'otp': 'The otp code is 123345'}
      };

      return OtpDto.fromJson(mockResponse);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
