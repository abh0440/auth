import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_application/features/authentication/provider/auth_provider.dart';
import 'package:otp_application/locator.dart';
import 'package:provider/provider.dart';

import 'features/authentication/auth_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Dependency injection
  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<AuthProvider>())
      ],
      child: GetMaterialApp(
        title: 'OTP Application',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: const AuthScreen(),
      ),
    );
  }
}
