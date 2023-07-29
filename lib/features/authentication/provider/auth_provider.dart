import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_application/domain/repositories/auth_repository.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepository authRepository;
  AuthProvider(this.authRepository);

  Duration? duration;
  Timer? timer;
  int secRemaining = 0;
  TextEditingController pinputTextEditingController = TextEditingController();

  Future<void> fetchOTP() async {
    final res = await authRepository.fetchOTP();

    Future.delayed(const Duration(seconds: 5), () {
      String code = res;
      pinputTextEditingController.text = code;
      timer?.cancel();
      secRemaining = 0;
      notifyListeners();
    });
  }

  Future<void> verifyOTP(String code) async {
    if (code == '123345') {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'OTP Verification',
          message: 'Success!',
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      Get.showSnackbar(
        const GetSnackBar(
          title: 'OTP Verification',
          message: 'Failed!',
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void startCountdown() {
    const input = "01:00";
    final parsedDuration = parseTimeString(input.toLowerCase());

    duration = parsedDuration;
    secRemaining = duration!.inSeconds;
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      secRemaining--;
      if (secRemaining <= 0) {
        timer?.cancel();
      }
      notifyListeners();
    });
  }

  Duration? parseTimeString(String input) {
    int minutes = 0;
    int seconds = 0;
    final parts = input.split(':');
    minutes = int.parse(parts[0]);
    seconds = int.parse(parts[1]);
    return Duration(minutes: minutes, seconds: seconds);
  }

  // Display formatted duration
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
