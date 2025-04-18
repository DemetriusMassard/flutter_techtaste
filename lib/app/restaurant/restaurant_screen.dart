import 'package:flutter/material.dart';
import 'package:flutter_techtaste/app/_core/app_colors.dart';
import 'package:flutter_techtaste/app/_core/widgets/appbar.dart';
import 'package:flutter_techtaste/app/restaurant/widgets/dish_widget.dart';
import 'package:flutter_techtaste/model/restaurant.dart';

import '../../model/dish.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({required this.restaurant, super.key});
  final Restaurant restaurant;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppbar(context: context, title: restaurant.name),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
          child: Column(
            spacing: 12,
            children: [
              Image.asset(
                "lib/assets/${restaurant.imagePath}",
                width: 160,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Mais pedidos",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mainTextColor),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    spacing: 16,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      restaurant.dishes.length,
                      (index) {
                        Dish dish = restaurant.dishes[index];
                        // return ListTile(
                        //   leading: _getDishImage(dish.imagePath),
                        //   title: Text(dish.name),
                        //   subtitle: Text("R\$ ${dish.price.toStringAsFixed(2)}"),
                        //   trailing: IconButton(
                        //     onPressed: () {
                        //       context.read<BagProvider>().addAllDishes([dish]);
                        //     },
                        //     icon: Icon(Icons.add),
                        //   ),
                        // );
                        return DishWidget(dish: dish);
                      },
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
