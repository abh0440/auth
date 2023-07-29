import 'package:flutter/material.dart';
import 'package:otp_application/features/authentication/provider/auth_provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<AuthProvider>(context, listen: false).fetchOTP();
    Provider.of<AuthProvider>(context, listen: false).startCountdown();
  }

  final defaultPinTheme = PinTheme(
    width: 40,
    height: 40,
    textStyle: const TextStyle(
        fontSize: 20, color: Colors.blueGrey, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(5),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.amber,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const Text(
              'Authenticating...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Please key in activation code sent to +12312312312',
              maxLines: 2,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 32),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              controller: authProvider.pinputTextEditingController,
              onCompleted: (value) => authProvider.verifyOTP(value),
            ),
            const SizedBox(height: 16),
            authProvider.secRemaining == 0
                ? InkWell(
                    onTap: () {
                      authProvider.pinputTextEditingController.clear();
                      authProvider.fetchOTP();
                      authProvider.startCountdown();
                    },
                    child: const Text(
                      'Resend Code?',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ))
                : Text(
                    authProvider.duration != null
                        ? authProvider.formatDuration(
                            Duration(seconds: authProvider.secRemaining))
                        : '',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
          ],
        ),
      ),
    );
  }
}
