import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/dishes/dish_screen.dart';
import 'package:flutter_techtaste/model/dish.dart';

import '../../_core/app_colors.dart';

class DishWidget extends StatelessWidget {
  final Dish dish;
  const DishWidget({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return DishScreen(dish: dish);
              },
            ),
          );
        },
        child: Container(
          height: 292,
          decoration: BoxDecoration(color: AppColors.lightBackgroundColor),
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 160,
                child: Image.asset(
                  'lib/assets/dishes/Salada (1).png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      dish.name,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.mainTextColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "R\$ ${dish.price.toStringAsFixed(2)}",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      dish.description,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: AppColors.secondaryTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
