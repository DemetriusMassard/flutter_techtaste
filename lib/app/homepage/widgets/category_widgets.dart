import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/app_colors.dart';

import '../../../model/category.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;
  const CategoryWidget({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        color: AppColors.lightBackgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "lib/assets/${category.imagePath}",
            height: 48,
          ),
          Text(
            category.name,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.mainTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
