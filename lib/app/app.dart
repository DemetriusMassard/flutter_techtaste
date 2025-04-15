import 'package:flutter/material.dart';

import 'splash/splash_screen.dart';
import '_core/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      home: const SplashScreen(),
    );
  }
}
