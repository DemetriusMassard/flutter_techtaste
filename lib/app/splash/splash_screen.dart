import 'package:flutter/material.dart';

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
                  'lib/assets/Logo home.png',
                ),
                const Column(
                  children: [
                    Text(
                      "Um parceiro inovador para sua",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w200,
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
                      onPressed: () {},
                      child: Text("Bora!"),
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
