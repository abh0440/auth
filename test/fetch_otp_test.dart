import 'package:flutter_test/flutter_test.dart';
import 'package:otp_application/data/data_sources/auth_data_source.dart';
import 'package:otp_application/locator.dart';

void main() {
  setUpAll(() async {
    init();
  });

  group('Unit Test', () {
    test('Fetch OTP', () async {
      var res = await AuthDataSourceImpl().fetchOTP();

      expect(res.data?.otp?.contains('123345'), true);
    });
  });
}
