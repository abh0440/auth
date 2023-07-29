import 'dart:developer';

import 'package:otp_application/data/data_sources/auth_data_source.dart';
import 'package:otp_application/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});
  @override
  Future<String> fetchOTP() async {
    try {
      final res = await authDataSource.fetchOTP();

      String otp = res.data?.otp?.split(' ').last as String;

      return otp;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
