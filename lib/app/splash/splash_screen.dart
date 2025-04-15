import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/homepage/homepage_screen.dart';

import '../_core/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              'lib/assets/banners/Banner.png',
              fit: BoxFit.fitWidth,
            ),
          ),
          Center(
            child: Column(
              spacing: 32.0,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/Logo home@2x.png',
                  width: 192,
                ),
                const Column(
                  children: [
                    Text(
                      "Um parceiro inovador para sua",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Melhor experiência culinária!",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomepageScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Bora!",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
