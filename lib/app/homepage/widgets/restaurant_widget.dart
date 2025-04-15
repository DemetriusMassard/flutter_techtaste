import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/app_colors.dart';
import 'package:flutter_techtaste/model/restaurant.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Image.asset(
          'lib/assets/${restaurant.imagePath}',
          width: 96,
          fit: BoxFit.fill,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurant.name,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor,
              ),
            ),
            Row(
              children: List.generate(
                restaurant.stars.toInt(),
                (index) {
                  return Image.asset('lib/assets/others/star.png');
                },
              ),
            ),
            Text(
              '${restaurant.distance} km',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        )
      ],
    );
  }
}
